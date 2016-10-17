title: How to connect a Flask app to Postgres with docker-compose
display_date: October 9, 2016
sort_date: 20161009
full_date: Sun Oct  9 10:31:39 PDT 2016
tags: python, docker-compose, mysql, mariadb, postgres

This is how you connect two containers using docker-compose. As a first example I tried to connect a flask app in python 3 to a MySQL database. It turns out the python mysql interface supports only up to python 2.7. This happens to be my first real WTF moment using python 3. How has this not happened yet?

My solution is to try try PostgreSQL instead. Ok so it raised similar issues, but not to worry. A [Github issue](https://github.com/frol/docker-alpine-python3/issues/1) suggested installing `postgresql-dev`, `gcc`, `python3-dev` and `musl-dev`. This allows `pip3 install psycopg2` to successfully install. I will be using the [flask-sqlalchemy](http://flask-sqlalchemy.pocoo.org/2.1/) ORM that is so widely praised in the python community.

##Steps

1. Create the base container
1. Configure SQLAlchemy for the chosen database
1. Create docker-compose file
1. Check that the database is ready

##The base container

    :::docker
    FROM alpine:3.4

    ADD requirements.txt /home/app/
    WORKDIR /home/app/


    RUN apk add --no-cache postgresql-dev gcc python3 \
        python3-dev musl-dev && \
        python3 -m ensurepip && \
        rm -r /usr/lib/python*/ensurepip && \
        pip3 install --upgrade pip setuptools && \
        rm -r /root/.cache && \
        pip3 install -r requirements.txt

Here we are installing the dependencies for a flask app that connects to a postgres database. Admittedly yes, it will have the server as well as the client, but hey this is not a professional production setup. This is doing a few things. As the base container it will shield the developing cycle from having to install these things each and every code change. Our development container will just inherit from this one so that it has everything it needs to get done. If our requirements and dependencies change, we change this container, not the development container.

##SQLAlchemy configuration

SQLAlchemy requires a [URI format](http://flask-sqlalchemy.pocoo.org/2.1/config/#connection-uri-format) to be specified for the database. For posgres it looks like this

    :::python
    postgresql://username:password@host:port/database

You might ask about those required parameters and say that this is a container. It is ephemeral and when you run it you don't want to `ssh` into it and create a new root password and users that you're just going to forget because this container is ephemeral and it's not worth the brainpower to remember these things. And you're right. However the postgres image and docker-compose both provide simple solutions to this problem.

The [postgres image](https://hub.docker.com/_/postgres/) provides some helpful instructions. There are some optional environment variables that are not required, but "may significantly aid you in using the image". Docker also provides some documentation for [environment variables in compose](https://docs.docker.com/compose/environment-variables/). Also [here](https://docs.docker.com/compose/compose-file/#env-file).

So our docker-compose.yml file looks like this.

    :::docker hl_lines="1 15"
    # This is docker-compose.yml

    version: '2'
    services:
      flaskapp:
        restart: always
        build: .
        ports:
          - "42424:5000"
        links:
          - database
      database:
        restart: 'no'
        image: postgres:9
        env_file: .env

And our `.env` file looks like this.

    :::docker hl_lines="1"
    # This is .env

    POSTGRES_PASSWORD=foobarbaz
    POSTGRES_USER=marco
    POSTGRES_DB=testdb

`docker-compose` allows us to use the name of the service instead of an ephemeral IP address. The name is specified in the docker-compose file like this. Actually we've already specified it.

    :::docker hl_lines="1 6"
    # This is docker-compose.yml

    version: '2'
    services:
      ...
      database:
        image: postgres:9
        ...

This means our posgres URI line should look like this.

    :::python
    postgresql://marco:foobarbaz@database/testdb

##Check that the database is ready

Ok moment of truth. Will this work? Well no. But really yes. In this compose setup it just so happens that my flaskapp starts up faster than the database. SQLAlchemy then checks for a database at the hostname 'database' but finds nothing, spits out an error and exits. All of this happens before postgres has time to start. The solution? Write a startup script that forces the app to wait until [postgres is ready](https://docs.docker.com/compose/startup-order/).

It turns out the best practice is not to have a separate script that checks to see if the database is ready. The best practice is to check for it in the application code. This makes sense because it is the application that's going to use the database and the application needs to have access in just the right way. Our solution here will be simple and likely not production robust. At the end our flask app, we have the usual `if __name__ == '__main__'` clause. We will add one `while` loop to it to check that the database is ready.

    :::python hl_lines="7"
    import time
    ...
    if __name__ == '__main__':
         dbstatus = False
         while dbstatus == False:
             try:
                 db.create_all()
             except:
                 time.sleep(2)
             else:
                 dbstatus = True
         database_initialization_sequence()
         app.run(debug=True, host='0.0.0.0')

We have here the usual `try/except` pattern but we're also using an `else`. The `else` block gets executed only if th `try` block does not raise an exception. Here the loop will try to create the tables until it succeeds, then it will move on to the `database_initialization_sequence`. This is just a fancy name for a function that enters dummy data in the database. 

##Conclusion

Those are the essential parts of the `docker-compose` setup. To recap, they were these.

1. Create the base container
1. Configure SQLAlchemy for the chosen database
1. Create the docker-compose file
1. Create the .env file
1. Check that the database is ready

Each of these is required, otherwise the setup won't work. From here you could go on to create a test suite based on this automated environment. Using docker-compose for this is useful because you have your whole app and you have an ephemeral database. Once this setup is written, you can `fig up -d --build` it as many times as you want and it will have all the same dependencies. It will also not be bogged down by the sheer size of a full OS and hypervizor that come with a VM.

Thanks for reading!

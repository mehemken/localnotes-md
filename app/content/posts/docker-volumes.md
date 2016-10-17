title: Docker Volumes
display_date: October 10, 2016
sort_date: 20161010
full_date: Mon Oct 10 20:20:12 PDT 2016
tags: none

##How to use volumes to edit code in a container

Adding code to a container is fairly simple with the `ADD` command. Using the `ADD` method will add the given directory to the container at build time. You might say, well, what if I want to edit files and have the container see the changes in real time? This is possible with the `VOLUME` command. This is the preferred method of exposing files at run time. I'll be referring to a tutorial that is [a bit dated](http://matthewminer.com/2015/01/25/docker-dev-environment-for-web-app.html). The first step is to start with a new Flask project so I'll clone my stock [Flask container](https://github.com/mehemken/clean-flask-container) project on github. 

##Steps

1. Add the volume to the Dockerfile
1. Make the Flask app `debug=True`
1. Begin editing code and see changes on saves

##Steps v2

1. 

The Dockerfile should have the following line.

    :::docker hl_lines="6"
    FROM alpine:3.4

    RUN mkdir app
    WORKDIR /app

    VOLUME <host dir>:<container dir>

    ENTRYPOINT start.sh

##Reality check

Well it's not that simple. It turns out that Flask's `debug` mode is made possible by its built in server. The server detects when a file is modified and restarts itself. This feature is quite common these days but we will have to use the Gunicorn web server this time around.

Ok so I've done it. It was actually quite simple. Too simple. But you know what, I'm tired and I'm going to go to sleep now. This is really cool stuff going on right here. This is absolutely amazing... I've started a docker container with `docker-compose` and inside the container is a Flask app. And every time I update the Flask app I can just save and reload the browser to see the changes. No more build scripts. Wow. Go docker.

I'll have to update my clean Flask container. Now that I can add a postgres database and develop code without restarting containers I can create a sweet default setup.

##Finishing this post

To finish this post I have to explain a few things.

- The role of `gunicorn`
- Why I couln't just make it work with a `node` app
- The `file.env`
- `gunicorn.py`

##Gunicorn

##How to do this with `node`



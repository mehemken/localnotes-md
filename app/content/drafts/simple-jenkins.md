title: A very simple Jenkins setup
date: September 25, 2016
tags: jenkins python flask docker

I would like to set up a continuous deployment system for a flask app. the app itself is a very simple hello world flask app. There is nothing special about it because this tutorial is not about the app. It is about the Jenkins workflow. I will not dilute this tutorial to show off how I can do this and that. I will only show how to set up a continuous delivery pipeline with Jenkins. In future tutorials I might elaborate on things but any elaboration on the app is beyond the scope of this tutorial.

This is not a tutorial about TDD. And I'm not the most well versed in the art of TDD, so don't laugh at my test suite. Or do laugh. Up to you.

This project will be entirely housed on the localhost. The development code will live in the dev directory and the production code will live in the production directory.

##Ingredients

- Flask app
- Jenkins server
- git repo
- Test suite

##Goal

1. Merges to `master` succeed only when all tests pass.
1. Production code updates on each merge to `master`.

##Instructions

1. Create the directories
1. Init the git repo
1. Write the flask app
1. Set up the virtualenv
1. Write the test suite
1. Set up the Jenkins server
1. Next

###Create the directories
To set up the directories just go to the directory you want to save all this stuff in and use these commands.

    :::bash
    $ mkdir {jenkins-tutorial, \
        jenkins-tutorial/dev, \
        jenkins-tutorial/dev/app, \
        jenkins-tutorial/pro}
    
    $ cd jenkins-tutorial/dev/app

    $ mkdir {templates,static}

    $ touch {app.py, \
        templates/home.html, \
        static/styles.css}

The result should be this file structure

    :::bash
    /jenkins-tutorial/
    ├── dev
    │   └── app
    │       ├── app.py
    │       ├── static
    │       │   └── styles.css
    │       └── templates
    │           └── home.html
    └── pro

###Init the git repo

Now, this is a simulation of a development and production environment where you've got your code in Github and a production server with a copy of the code. So we'll have to initiate git repositories accordingly. For now we'll just do the one for the `dev/` directory.

    :::bash
    $ pwd
    /jenkins-tutorial/dev

    $ git init
    Initialized empty Git repository in /...

###Write the flask app

Ok now that we've started, let's get started. We'll need these files here.

    :::python
    # file:  jenkins-tutorial/dev/app.py

    from flask import Flask, render_template
    app = Flask(__name__)

    @app.route('/')
    def home():
        return render_template('home.html')

    if __name__ == '__main__':
        app.run()

This is the page we're going to work with. Other tutorials might introduce some complexity here, but behold! No such thing exists here.

    :::html
    <!-- file:  .../dev/templates/home.html  -->
    <html>
        <head>
            <title>Simple Jenkins</title>
        </head>
        <body>
            <h1>Hello World</h1>
        </body>
    </html>

###Set up the virtualenv

Ok so if you haven't already, check out [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/). It is python's premier virtualization tool. I happen to like Continuum Analytics' `conda` a whole lot better, but it introduces unecessary complexity for this here tutorial.

First, install it, then create a venv, then activate it.

    :::bash
    $ pip install virtualenv
    $ virtualenv venv
    $ source venv/bin/activate
    (venv) $ _  # Your prompt now shows the venv is active

So now our directory tree looks like this.

    :::bash hl_lines="9 10 11"
    /jenkins-tutorial/
    ├── dev
    │   ├── app
    │   │   ├── app.py
    │   │   ├── static
    │   │   │   └── styles.css
    │   │   └── templates
    │   │       └── home.html
    │   └── venv
    │       ├── ...   # I'm not showing the contents
    │       └── ...   # because it takes too much space.
    └── pro

And we'll have to install flask

    :::bash
    (venv) $ pip install flask

Now you can start the flask app and see it in your browser.

    :::bash
    (venv) $ python app.py

And we can see if a request sent to that port will return our page. In a new terminal window or tmux pane if you're into that kind of thing, `curl` the flask app. You don't have to activate the venv in this one.

    :::bash
    $ curl localhost:5000
    <html>
        <head>
            <title>Simple Jenkins</title>
        </head>
        <body>
            <h1>Hello World</h1>
        </body>
    </html>

And it works! Great. But I don't think we need this anymore. Go back to the terminal that's running the app and hit `C-c` to stop the process.

###The tests

My testing setup was heavily influenced Eddy Reyes' [slide deck](http://www.slideshare.net/ereyes01/tdd-in-python-with-pytest-43671276).

I've said before, I'm not a testing buff. But I did pytest tutorial and I like it more than python's built in unittest and doctest. So please forgive this one bit of unnecessary complexity. 

All you need to do is install pytest.

    :::bash
    $ pip install pytest


To be continued...

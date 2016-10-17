title: Basic API with flask
display_date: October 2, 2016
sort_date: 20161002
full_date: Sun Oct  2 14:17:10 PDT 2016
tags: flask, api

The tutorial is from Miguel Grinberg's [RESTful tutorial](http://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask).

As a recap, a REST system is characterized by six design rules. For more detail visit Miguel's post.

- Client-server
- Stateless
- Cacheable
- Layered System
- Uniform Interface
- Code on demand (optional)

##Objectives

I'd like to build a container that houses a simple flask app that acts as an API layer for a mysql or mongo database. Now that I think about it, a container would require some modifications to adjust the API. There should be some kind of config file that defines the API. I'll see about how that might be done. For now I'm just going to build the basic API without dependencies using the tutoiral by M. Grinberg.

##Results

Ok I have a whole Github repo that houses a clean flask app docker container. All you have to do is fork it and add your app to the `app/` directory. From there you can do anything, even add an API app. I did this exactly. It's great, everybody should check it out.

##Day two

Ok I finished the first tutorial and second tutorials. I have a superficial understanding of how to build an API with Flask. I've used plain flask and flask-RESTful. The two methods are similar and they use fairly standard python patterns. Both methods use list comprehensions. I'll have to do them both again to get a better hang of them. I have the idea in my head that I can build APIs for hire. Check that out. I've completed two tutorials and I'm already thinking about doing it for money. I'm still missing several pieces.

- database connection
- machine learning alorithm
- app with live data

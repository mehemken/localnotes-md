title: Flask, Docker and Redis
display_date: October 10, 2016
sort_date: 20161010
full_date: Mon Oct 10 19:08:50 PDT 2016
tags: redis

##Connecting a flask app to a redis backend

I might have to save this for another day. Today I want to look at using volumes in Docker to connect to the running code. The goal would be to not have to rebuild the container on every code change. As a followup to that, I'll have to learn how to do production/testing/development environments for Flask apps. That way I can develop in `debug=True` mode and deploy in `debug=False` mode. Alas, this Redis article will have to wait.

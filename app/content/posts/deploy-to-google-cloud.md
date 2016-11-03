title: deploy-to-google-cloud
sort_date: 20161023
display_date: Sunday 23, 2016
full_date: 
tags: none

##Pushing this blog to production

This is a checklist of things I have to do to deploy this blog in no particular order.

- Figure out upload API  
  I'd like to use curl to send my blog posts to the sever using curl from a bash script. All I have to do is send a markdown file.
- Set up an ```nginx``` server on the host.
- Point my url to the server.
- Integrate with google analytics

##Solution #1

This is one possible solution that involves one Google Cloud node and my local system. The host will have docker and nginx installed. The blog will be a simple docker container that houses the flask app that will house the blog. The container will have a mounted volume that will contain the posts. The volume itself will be a git repository and it will be the origin. On my local system I will have a clone of the repo. I will also run the same container image on my local system to preview the production system. When I want to publish a post all I need to do is do a git push.

A problem arises here. In my local notes container I'm running ```gunicorn``` in debug mode. All credible sources caution against running production servers in debug mode. Something about security issues.

##Solution #2

I've never used Travis CI, but it is quite popular. I'm sure it won't hurt my resume to say that I've used it in production. Apparently it is easy to use and free for open source projects. To top it off, Google has a [tutorial](https://cloud.google.com/solutions/continuous-delivery-with-travis-ci) on how to deploy with Github, Travis and Cloud Platform. I hesitate with this one because Travis has the bitch of a dependency that is ```ruby```.

##Solution #3

Circle CI has a very prominent page titled *A modern continuous delivery process for your [Docker applications](https://circleci.com/integrations/docker/)*. They also have a page with tutorials on [various ways](https://circleci.com/docs/google-cloud-platform/) to deploy to google cloud and a page for [python apps](https://circleci.com/docs/language-python/). I haven't found a catch like the Travis ```ruby``` catch. Well, it only allows one free build. Which is all I need really. I wonder if that might become a limiting factor as my blog matures.

##Solution #4

CodeShip. I hear it on every episode of Talk Python to me.

title: How I built this
display_date: September 9, 2016
sort_date: 20160924
tags: markdown, flask, blog

This morning I googled how to build a simple flask blog and google told me to look at [James Harding's article](http://www.jamesharding.ca/posts/simple-static-markdown-blog-in-flask/). So I sat down and started working. A few minutes into it I had some simple functionality. The nice thing about this article is that it just gave the absolute bare essentials. All it is is a file structure and a flask app. Very simple. I am actually amazed at how simple this was. I am also amazed about why I am only seeing this now. Google has been holding out on me all year.

##Update October 16, 2016

Today I dockerized this blog. The edits I made are based on my work in the *Docker Volumes* article. As it stands today, this whole app can be started in a Docker container and edited in real time without restarting the container. I also added `docker-compose` support. All I have to do to start the blog is `fig up -d`. Boom isn't that awesome?

This is a nice step forward in the direction I want to go. I eventually want to make this blog public so I'll have to deploy it somehow and I can do that in the Google Cloud. Now all I need is a test suite and some kind of Jenkins setup. And some security measures.

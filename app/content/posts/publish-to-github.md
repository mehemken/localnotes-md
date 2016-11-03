title: publish-to-github
sort_date: 20161103
display_date: Thursday Nov 03, 2016
full_date: 
tags: none

##Simple Flask Notes on Localhost

I'm going to publish my simple flask blog to github. It is a very simple project, but it is powered by python, flask and docker. That should be interesting to people. It is also a simple way to have notes on a localhost that you can write in markdown and see immediately on your browser. It uses the ```gunicorn``` webserver set to debug mode. This allows you to see your changes without restarting the server.

Everything about this is customizeable. The styling uses simple css (could use some upgrading to bootstrap maybe). The data fields collected for each article are customizeable, but could be streamlined. As it stands you have to edit each document and the ```./newpost``` utility to make any changes to the schema. That's kind of a pain in the ass actually. So it could definitely be improved.

All in all I have a minimum viable product here. I write my notes with it all the time and I'm able to look back and re-read everything. I've aligned the web page left so that you can have a split screen situation.

##Publish to github

To do list
- Clone the directory
- Make it a git repo
- Create new Github repo
- Move origin to new Github repo
- Make the app generic

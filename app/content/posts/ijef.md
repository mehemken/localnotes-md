title: IJEF
sort_date: 20161018
display_date: Tuesday 18, 2016
full_date: 
tags: bjj, non-profit, international

##Meeting notes
This was the meeting on 10/18/2016

###Fundraisers

- We'll bring the ipad to pass around for donations. Announcement will be made at the beginning and at the end. Message in the uniforms ($40)
- Another fundraiser will be an ijef tournament for kids.
- Holiday party on the 3rd or the 10th. Docwiler beach party BBQ?  
  Sami will get the right address. "End of the year beach party"
  "2016 Jiu Jitsu Connection Invitational and end of year party benefiting IJEF"

###Website

- Actions from last week  
  Gallery done  
  Next steps: albums with blurb at the top  
  Call to action  
  Did not happen: let's get it done  

##Keystone

###Items to do today  
- The Keystone getting started page

###Things I don't understand  
- How to log in to the keystone backend
- What is a dyno as defined by Heroku
- Why the f-- does the ```heroku``` CLI require ```ruby```?  
  Goddamn assholes.  
- asdf  

sdfasdf

    :::bash
    node -v
    npm -v
    npm i -g npm
    npm -v
    npm install -g yo generator-keystone


    echo "export NODE_PATH=$NODE_PATH:/home/ubuntu/...

    yo keystone

###Things I now understand

I first installed ```nvm``` then selected node version 4. Then I did an ```npm``` install for ```yo```. Then I pulled the official docker image for mongo and ran it and made sure it was accessible on port 27017. Then I just followed the installation instructions. They led me to a CLI interface that asked me some configuration questions. It was all very simple. One of the questions asked about a temporary admin password that I would need to change at first logon. There was no such prompt on first logon.

Now I have to go try it again on a GCP instance. It seems as though there are some permission issues with it. But I haven't tried it this way. It is worth a try.

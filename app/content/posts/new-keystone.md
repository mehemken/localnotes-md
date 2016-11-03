title: New Keystone
sort_date: 20161028
display_date: Friday 28, 2016
full_date: 
tags: javascript, keystone, cms

Dan is going ot walk through setting up keystone.

    :::
    nvm install 6.7.0
    install the generator ## see the tutorial on the keystone site
    use handlebars
    use sass
    yes to blog
    yes to image gallery
    yes to contact form
    yes to user model
    use gulp
    no to email
    ...

use git --rebase

##Resources

- [Importing and exporting](https://docs.mongodb.com/v2.6/core/import-export/) MongoDB
- Also use the new permissions to the ijef site but don't write anything. Read only.

##How to import/export mongod

I'm writing a script that will import/export the mongodb database for ijef. I could write a shell script that does this with a simple that asks for user info and target location. But then Sami would not be able to run it on her windows machine. Fuck it. I know ```bash``` and Sami has an Ubuntu shell on her machine.

Ok so I've installed ```ruby 2.3.1``` and the Heroku CLI. I was able to run a ```heroku config``` command that gave me my URI for the mongodb instance for the moreira project. Now I just need to connect and run the import/export commands.

##Dan's instructions

Dan says not to worry about migrating the db. What we need now is the handlebars templates for the ui. He says this pretty much verbatim. 

I'm starting a new keystone project using these instructions

    :::bash
    nvm --version
    nvm install 6.7.0
    npm --version
    npm install -g generator-keystone
    mkdir handlebars-test
    cd handlebars-test
    npm install yo  # This fails. Use the following.
    npm install -g yo
    yo keystone

This will initiate the keystone menu that asks you for several things. I used the selections specified at the top of this article. When the menu finishes it installs the project and creates the files and directories. To start the project enter ```node keystone```.

The project is now running on port 3000. I can view the website and the admin interface using the password I provided, ```12345```.

The next thing is to figure out where the templates go and how they work inside my keystone project.

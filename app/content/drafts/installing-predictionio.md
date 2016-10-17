title: Installing PredictionIO
date: Saturday Oct 01, 2016
full_date: Sat Oct  1 09:37:50 PDT 2016
tags: predictionio

In this guide I will walk you through how to install predictionio on a virtual machine in the Google Cloud.

##Requirements

- Apache Hadoop 2.4.0 (required if using YARN or HDFS)
- Apache Spark 1.4.0 for Hadoop 2.4
- Java SE Development Kit 7

And one of these sets

- PosgreSQL 9.1

or

- MySQL 5.1

or

- Apache HBase 0.98.6
- Elasticsearch 1.4.0

Check the [current documentation](http://predictionio.incubator.apache.org/install/) for more up to date requirements.

##Steps

So first things first, install java 8

    :::bash
    $ sudo apt-get install openjdk-8-jre

And then let's install mysql

    :::bash
    $ sudo apt-get install mysql-server
    $ mysql_secure_installation

    $ mysql -u root -p    # to log in, do this

Once you log in you will want to create a new user for yourself so you're not always logged on as root.

    :::mysql
    CREATE USER 'somename' IDENTIFIED BY 'goodpassword';
    GRANT ALL PRIVILEGES ON * . * TO 'somename';
    FLUSH PRIVILEGES;

Also install Apache Spark

...

##Change of plans

I'm putting this post on hiaitus. I don't want to work with PredictionIO anymore because it is kind of a pain in the ass to get running. Instead I will create a Flask API powered by a mysql database. From There I will see how to feed data to a machine learning algorithm.

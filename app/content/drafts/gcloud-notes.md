title: Deploying VMs to Google Cloud
date: Saturday Oct 01, 2016
full_date: Sat Oct  1 11:50:28 PDT 2016
tags: gcc, gcloud

Use this command to create a new VM on the cloud.

    :::bash
    $ sudo gcloud deployment-manager deployments \
        create DEPLOYMENT_NAME \
        --config CONFIG
    # where CONFIG is a .yaml file

For more info on these .yaml files you're out of luck, the documentation has a steep learning curve. But the [deployment-manager](https://cloud.google.com/deployment-manager/quickstart) quickstart page might be useful.

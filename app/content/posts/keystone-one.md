title: Keystone, getting started
sort_date: 20161017
display_date: Monday 17, 2016
full_date: 
tags: keystone, javascript, node, docker

##Installing Keystone in a docker container


I'm using Keystone's own [getting started](http://keystonejs.com/getting-started/) page. One key obstacle that I'm imposing on this gig is that I'm trying to install it in a docker container. I'm using the official `node:6` image (aka `latest`) on [DockerHub](https://hub.docker.com/_/node/). My first attempt at installation failed. I got an error, take a look.

    :::
    user@machine:/my-test-project# yo keystone
    /usr/local/lib/node_modules/yo/node_modules/configstore/index.js:53
                                    throw err;
                                    ^

    Error: EACCES: permission denied, open '/root/.config/configstore/insight-yo.json'
    You don't have access to this file.

        at Error (native)
        at Object.fs.openSync (fs.js:640:18)
        at Object.fs.readFileSync (fs.js:508:33)
        at Object.get (/usr/local/lib/node_modules/yo/node_modules/configstore/index.js:34:26)
        at Object.Configstore (/usr/local/lib/node_modules/yo/node_modules/configstore/index.js:27:44)
        at new Insight (/usr/local/lib/node_modules/yo/node_modules/insight/lib/index.js:37:34)
        at Object.<anonymous> (/usr/local/lib/node_modules/yo/lib/cli.js:172:11)
        at Module._compile (module.js:570:32)
        at Object.Module._extensions..js (module.js:579:10)
        at Module.load (module.js:487:32)

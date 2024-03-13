Dashd for Docker
================

[![Docker Stats](http://dockeri.co/image/dashpay/dashd)](https://hub.docker.com/r/dashpay/dashd/)

[![Build Status](https://travis-ci.org/dashpay/docker-dashd.svg?branch=master)](https://travis-ci.org/dashpay/docker-dashd/)


Docker image that runs the Dash dashd node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. Vultr, Digital Ocean, KVM or XEN based VMs) running Ubuntu 18.04 or later (*not OpenVZ containers!*)
* At least 40 GB to store the block chain files
* At least 2 GB RAM + 2 GB swap file


Really Fast Quick Start
-----------------------

One liner for Ubuntu 18.04 LTS machines with JSON-RPC enabled on localhost and adds upstart init script:

    curl https://raw.githubusercontent.com/dashpay/docker-dashd/master/bootstrap-host.sh | sh -s bionic


Quick Start
-----------

1. Create a `dashd-data` volume to persist the dashd blockchain data, should exit immediately.  The `dashd-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=dashd-data
        docker run -v dashd-data:/dash --name=dashd-node -d \
            -p 9999:9999 \
            -p 127.0.0.1:9998:9998 \
            dashpay/dashd

2. Verify that the container is running and dashd node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        d0e1076b2dca        dashpay/dashd:latest          "dash_oneshot"      2 seconds ago       Up 1 seconds        127.0.0.1:9998->9998/tcp, 0.0.0.0:9999->9999/tcp   dashd-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f dashd-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* To run in testnet, add environment variable `TESTNET=1` to `docker run` as such:

        docker run -v dashd-data:/dash --name=dashd-node -d \
            --env TESTNET=1 \
            -p 9999:9999 \
            -p 127.0.0.1:9998:9998 \
            dashpay/dashd

* Additional documentation in the [docs folder](docs).

Credits
-------

Original work by Kyle Manna [https://github.com/kylemanna/docker-bitcoind](https://github.com/kylemanna/docker-bitcoind).
Modified to use Dash Core instead of Bitcoin Core.


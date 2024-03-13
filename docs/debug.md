# Debugging

## Things to Check

* RAM utilization -- dashd is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The dash blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 2GB+ is necessary.

## Viewing dashd Logs

    docker logs dashd-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the dashd node, but will not connect to already running containers or processes.

    docker run -v dashd-data:/dash --rm -it dashpay/dashd bash -l

You can also attach bash into running container to debug running dashd

    docker exec -it dashd-node bash -l



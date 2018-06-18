CPU Mining System
=================

How to run miner
----------------

On a machine with Docker installed run `docker pull jrtktb/miner`. This will pull the latest docker container with 

The container is configured to run as an executable via a docker entrypoint. You must set environment variables related to choosing and using a mining pool when issuing the following run command:

`sudo docker run -it -e pooladdr=<address-of-mining-pool> poolprt=<port-to-use> poolusr=<pool-user> wrkr=<name-of-worker> poolpwd=<pool-password>`

A CPU mining system intended to automate the setup and execution of a crypto miner. 

Ansible provisions a Docker container. The Docker container clones the source for and builds a bitcoin miner and runs it in a mining pool.

CPU Mining System
=================

What are the goals of this project?
-----------------------------------

This project is meant as an exercise in configuration management, containerization, and mining software.

This project IS NOT meant to result in a profitable mining system. CPU mining of Bitcoin is generally unprofitable, and a waste of electricity.

How to run miner
----------------

On a machine with Docker installed run `docker pull jrtktb/miner`. This will pull the latest docker container with 

The container is configured to run as an executable via a docker entrypoint. You must set environment variables related to choosing and using a mining pool when issuing the following run command:

`sudo docker run -it -e "pooladdr=<address-of-mining-pool>" -e "poolprt=<port-to-use>" -e " poolusr=<pool-user>" -e " wrkr=<name-of-worker>" -e "poolpwd=<pool-password>" --rm jrtktb/miner:latest bash`

How is the mining container built
---------------------------------

The mining container is built on CircleCI using a CircleCI script along with the ansible and docker configuration files in the project. CircleCI pushes the resulting image to DockerHub, and that is where the mining container in the "How to run miner" section is produced and distributed.


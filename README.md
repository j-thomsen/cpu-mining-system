CPU Mining System
=================

What are the goals of this project?
-----------------------------------

This project is meant as an exercise in configuration management, containerization, and mining software.

This project IS NOT meant to result in a profitable mining system. CPU mining of Bitcoin is generally unprofitable, and a waste of electricity.

Repo Structure
--------------

The repo structure is kept as intentionally flat on purpose.

The stable branch is Master, and develop is treated as an unstable feature branch. Pull requests should be openedagainst Master. Third party contributors should open their pull requests against a branch on their own fork of the repo.

CircleCI must pass on pull request before being merged.

The Vagrantfile was configured and used during initial development, but abandoned during the migration to CircleCI. It is not currently guaranteed to work, but still serves as a useful vagrant example.

How to run miner
----------------

On a machine with Docker installed run `docker pull jrtktb/miner`. This will pull the latest docker container with 

The container is configured to run as an executable via a docker entrypoint. You must set environment variables related to choosing and using a mining pool when issuing the following run command:

`sudo docker run -it -e "pooladdr=<address-of-mining-pool>" -e "poolprt=<port-to-use>" -e " poolusr=<pool-user>" -e " wrkr=<name-of-worker>" -e "poolpwd=<pool-password>" --rm jrtktb/miner:latest bash`

How is the mining container built?
----------------------------------

The mining container is built on CircleCI using a CircleCI script along with the ansible and docker configuration files in the project. CircleCI pushes the resulting image to DockerHub, and that is where the mining container in the "How to run miner" section is produced and distributed.

How can the miner be run in production?
---------------------------------------

The mining container was tested on an AWS EC2 Ubuntu 16.04 Server instance. 

A script, `server-setup.sh`, installs the necessary dependencies. The command to run the mining container is the same as above. The script install `docker.io` and pulls the docker image from DockerHub. 

Stop the mining container with `sudo docker stop <container-id>

To update with newest version from DockerHub first stop container, then run `docker pull jrtktb/miner` to update image. After that just reissue the `docker run` command.

Useful links
------------

DockerHub image home: hub.docker.com/r/jrtktb/miner/

# Resources I found useful while working on this project
Docker role: https://github.com/angstwad/docker.ubuntu
Vagrant/Ansible: https://github.com/geerlingguy/ansible-vagrant-examples


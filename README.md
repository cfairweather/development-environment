# development-environment
A development environment for use within Docker. Quickly use a spare port and authorized_keys to SSH into a custom environment that's extensible using your own Docker file.  

# Setup
In the docker-compose.yml:
- Set the `user`, or leave it as `ubuntu`.
- Change the mapped port, or leave it as `2223`.
- Generate an SSH keypair, and place the public key in `./development/config/.ssh/authorized_keys` (or map in your own directory) to allow you to login as `user`.

# Usage
- Start your container by running `docker-compose up -d`
- Login to your container with SSH:
-- `ssh -p 2223 -i id_rsa_my_privkey ubuntu@mycontainer.local` where `mycontainer.local` is the hostname of the docker host or the ip of the container.
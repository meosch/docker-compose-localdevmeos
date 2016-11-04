# docker-compose-localdevmeos
docker-compose.yml and friends for setting up a local development environment on Linux (Ubuntu 14.04) for MEOS

# Github project
https://github.com/meosch/docker-compose-localdevmeos

### docker-compose.yml files

The project contains two docker-compose.yml files and a link. 
* **docker-compose-all_containers.yml** - All containers including support containers, only one instance can be run at a time (and/or only one is needed.)
* **docker-compose_add_on_site.yml** - Only containers needed for adding an additional site to running all_containers site (currently only the localdevdrupal container).
* **docker-compose.yml** - Is a link to one of the above to files to allow for easy switching.
 

### change-enviro-type.sh

This is a script to switch the **docker-compose.yml** link file between the full **docker-compose_all_containers.yml** file and the **docker-compose_add_on_site.yml** file. You can run in on the command line inside the development environment like this:

`./change-enviro-type.sh`

###docker-gen.conf

The docker-gen.conf file will generate three different files using information from the containers using 3 templates.
* **nginx.tmpl** generates **/etc/nginx/conf.d/default.conf** which is the configuration for Nginx and uses the **VIRTUAL_HOST** environmental variable to set domains to reach webservers runing in container.
* **dnsmasq.tmpl** generates **/tmp/dockerhosts/dockerhosts** which can be used by the Docker host dnsmasq to allow the containers to be reachable from the host computer
* **dockerhostdns.tmpl** generates **/tmp/dockerhosts/docker** sets a static ip address for the **.docker** domain

#### Switch to docker-compose version 2
The parent project [meosch/docker-localdevdrupal](https://github.com/meosch/docker-localdevdrupal) switched to using version 2 docker-compose files. Docker-compose now handles networking and an an new docker-gen nginx template file (nginx-v2.tmpl) was needed for docker-gen. the version 1 file is still available as nginix.tmpl for docker-compose version one files. Newly created project will use the docker-compose version 2 files.

### Template Drush Alias file for other docker containers

 The Drush alias template file **localdevmeos-docker_add_on.aliases.drushrc.php** will be modified by the setup-new-localdev.sh script to made it ready to use by other Docker containers. Just copy it to the other containers **.home-localdev/.drush/** folder so that it will be copied into the container on start up. If the container is already running a restart will be needed to use this new drush alias file. 

### Main container

The main container used in the **docker-compose.yml** file has its own project, meosch/docker-localdevdrupal found here: https://github.com/meosch/docker-localdevdrupal

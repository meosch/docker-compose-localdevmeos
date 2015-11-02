# docker-compose-localdevmeos
docker-compose.yml and friends for setting up a local development environment on Linux for MEOS

# Github project
https://github.com/meosch/docker-compose-localdevmeos

### docker-compose.yml files

The project contains two docker-compose.yml files and a link. 
* **docker-compose-all_containers.yml8** - All containers including support containers, only one instance can be run at a time (and/or only one is needed.)
* **docker-compose_add_on_site.yml** - Only containers needed for adding an additional site to running all_containers site (currently only the localdevdrupal container).
* **docker-compose.yml** - Is a link to one of the above to files to allow for easy switching.
 
### change-enviro-type.sh

This is a script to switch the **docker-compose.yml** link file between the full **docker-compose_all_containers.yml** file and the **docker-compose_add_on_site.yml** file. You can run in on the command line inside the development environment like this:

`./change-enviro-type.sh`

### Main container

The main container used in the **docker-compose.yml** file has its own project, meosch/docker-localdevdrupal found here: https://github.com/meosch/docker-localdevdrupal

# docker-compose-localdevmeos
docker-compose.yml and friends for setting up a local development environment on Linux for MEOS

# Github project
https://github.com/meosch/docker-compose-localdevmeos

### docker-compose.yml files

The project contains two docker-compose.yml files. 
 -- docker-compose-all_containers.yml   - All containers including support containers, only one can be run at a time
 -- docker-compose_add_on_site.yml      - Only containers needed for adding an additional site to running all_containers site.
 -- docker-compose.yml                  - Is a link to one of the above to files to allow for easy switching.

### Main container

The main container used in the docker-compose.yml file has its own project, meosch/docker-localdevdrupal found here: https://github.com/meosch/docker-localdevdrupal

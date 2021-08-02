# s4hri-docker
Template for building S4HRI experiments using Docker

# Quickstart (development)

1. Define your .env entries
2. Fill your docker image in the file docker/Dockerfile
3. Create the EXPERIMENT DOCKER IMAGE:

       make init

4. Build the LOCAL DOCKER IMAGE:

       make build

5. Define your additional services in the docker-compose.yml
6. Run the docker image:

       make run

7. Create a release on github to trigger the event for pushing the EXPERIMENT DOCKER IMAGE on dockerhub

# Quickstart (production)

1. Setup, build and run the LOCAL DOCKER IMAGE:

       make run


# Setup
Automatic setup has been designed for Ubuntu systems (hard check for /etc/os-release).

    make setup

Will perform a check for:
- docker (will install latest docker-ce)
- docker-compose (will install 1.29.2)
- nvidia-container-runtime (will install for correct ubuntu only if the nvidia kernel driver is loaded) 
- will add current user to group docker if not added

Please notice that the setup runs automatically during the building/running process.

# dockyman
...

# 1. How to setup a custom container using dockyman
...

# 2. How to build the container
...

# 3. How to run the container
...

# 4. The .env file


The building process will produce a docker image X=Y+Z
- Y is the image specified in DOCKER_SRC
- Z is the image specified in docker/Dockerfile

The resulting docker image X will be tagged as: ${DOCKER_DOMAIN}/${PROJECT_NAME}-docker:${RELEASE}
Optionally you can specify custom building arguments in BUILD_ARGS that will be passed for building Z


# LOCAL DOCKER IMAGE

...

# Building

Prerequisites:
- adjust base image and credentials in `devenv/docker-compose.yml`
- if needed, place your ssh keys in `devenv/install/ssh` directory, those will be incorporated into the environment

Then, in the main folder of this repository, run

```
docker-compose -f devenv/docker-compose.yml up -d --build
```

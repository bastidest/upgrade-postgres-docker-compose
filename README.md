# upgrade-postgres-docker-compose
Upgrades the PostgreSQL major version in a Docker Compose project

## Usage
```
upgrade-postgres-docker-compose

Upgrades the PostgreSQL major version in a Docker Compose project.

This script does the following:
1. bring down the Docker Compose project
2. dump the PostgreSQL container's database
3. update the PostgreSQL image version in the docker-compose.yml file
4. restore the database dump in the new PostgreSQL container

Requirements:
- docker, docker compose, yq
- the PostgreSQL container must use bind-mounts
- a docker-compose.yml file in the current working directory

Usage: upgrade-postgres-docker-compose upgrade --service-name=NAME (--data-dir=DIR | --volume=VOLUME) --new-image=IMAGE --username=USER [--default-db=DB]
       upgrade-postgres-docker-compose --help

Options:
--service-name=NAME  name of the PostgreSQL Docker Compose service
                      The service name as declared in the docker-compose.yml 'services:' array
--data-dir=DIR       PostgreSQL data directory bind-mount
                      This directory is renamed with a '-bak' suffix during the upgrade
--new-image=IMAGE    label of the upgraded PostgreSQL Docker image
                      This value will be written to the 'image:' attribute in the docker-compose.yml file
--username=USER      PostgreSQL username to use for the backup/restore
                      This must be equal to the value used for the POSTGRES_USER environment variable
--default-db=DB      PostgreSQL default database name
                      This must be equal to the value used for the POSTGRES_DB environment variable
```

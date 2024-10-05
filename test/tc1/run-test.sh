#!/bin/bash
yq --in-place --yaml-roundtrip '.services["postgres"].image = "postgres:16"' docker-compose.yml
rm ./*.sql
sudo rm -rf ./data ./data-bak
docker compose up -d
sleep 10
bash -x ../../upgrade-postgres-docker-compose upgrade --service-name=postgres --data-dir=data --username=tc1-user --new-image=postgres:17 --default-db=tc1-db

#!/bin/bash
docker compose down -v
yq --in-place --yaml-roundtrip '.services["postgres"].image = "postgres:16"' docker-compose.yml
rm ./*.sql
docker compose up -d
sleep 10
bash -x ../../upgrade-postgres-docker-compose upgrade --service-name=postgres --volume=pg-data --username=tc2-user --new-image=postgres:17 --default-db=tc2-db

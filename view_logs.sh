#!/bin/bash

docker compose logs --project-name `cat ./proj_name` -f -t

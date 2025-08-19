#!/bin/bash

docker container prune -f --filter=label=iiif-curation-platform-docker

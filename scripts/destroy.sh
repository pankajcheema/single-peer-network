!# bin/bash

docker rm $(docker ps -aq)--force
sleep 1

docker volume prune

docker network prune


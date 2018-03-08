## Docker

The crowdAI development envionment, including the **crowdAI Broker** and a sample **Job Factory** has been packaged with Docker, for development and integration testing puposes.

### Quickstart

Clone this repo locally

```
git clone git@github.com:crowdAI/crowdai.git
cp config/application.yml.example config/application.yml
docker-compose build
docker-compose up -d
```

### Docker commands

## Get status and logs
```
docker-compose ps
docker ps
docker logs 7b7ff37ed2d5
```

### Example

```
$ docker ps

```

## Rebuild a specfic container
```
docker-compose ps
docker-compose stop web
docker-compose rm web
docker-compose up -d
```


### Start, stop, delete
```
stop all containers on your system:
docker kill $(docker ps -q)

remove all containers
docker rm $(docker ps -a -q)

remove all docker images
docker rmi $(docker images -q)
```

### One-liner

Please note this will cleanup all Docker containers, including for other projects.
```
docker kill $(docker ps -q) &&  docker rm $(docker ps -a -q) && docker rmi $(docker images -q)
```

### Shell into container
```
sudo docker exec -i -t 665b4a1e17b6 /bin/bash

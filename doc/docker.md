## Docker Machine commands

## Connect to Docker Machine

### Command
Find the machine name
```
osx$ docker-machine ls
```

### Response
Response from server
```
NAME              ACTIVE   DRIVER       STATE     URL                        SWARM   DOCKER    ERRORS
aws-sandbox       -        amazonec2    Running   tcp://52.16.157.182:2376           v1.12.0
crowdAI-prd-cpu   -        amazonec2    Running   tcp://52.208.112.53:2376           v1.12.1
dev               -        virtualbox   Stopped                                      Unknown
```

## Make one of the instances active for this shell only
```
osx$ eval $(docker-machine env crowdAI-prd-cpu)
docker-machine ls
```

The instance now has an **active** indicator
```
NAME              ACTIVE   DRIVER       STATE     URL                        SWARM   DOCKER    ERRORS
aws-sandbox       -        amazonec2    Running   tcp://52.16.157.182:2376           v1.12.0
crowdAI-prd-cpu   *        amazonec2    Running   tcp://52.208.112.53:2376           v1.12.1
dev               -        virtualbox   Stopped                                      Unknown
```

## Working with images

List images on Docker Machine
```
docker images
```

response
```
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
<none>                   <none>              0d926c8b665a        17 hours ago        4.834 GB
<none>                   <none>              8259f466eff1        4 days ago          4.843 GB
<none>                   <none>              f3a8d24bae54        4 days ago          4.834 GB
jupyter/scipy-notebook   latest              3f4324b0e654        11 days ago         4.751 GB
jupyter/scipy-notebook   05ccd6db25ea        746a019f1c2a        6 weeks ago         4.669 GB
jupyter/scipy-notebook   0017b56d93c9        38ab6b0b5938        8 months ago        3.482 GB
```



#### Docker machine

create a docker machine on EC2
```
export AWS_ACCESS_KEY_ID=........
export AWS_SECRET_ACCESS_KEY=........
export AWS_VPC_ID=vpc-8e67d4ea
docker-machine -D create --driver amazonec2 --amazonec2-access-key $AWS_ACCESS_KEY_ID --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY --amazonec2-vpc-id $AWS_VPC_ID --amazonec2-region eu-west-1 --amazonec2-zone a aws-sandbox
```

show docker machines
```
docker-machine ls
docker-machine active
docker-machine aws-sandbox config
```

start a docker machine
```
docker-machine start dev
```

set default machine
```
eval $(docker-machine env aws-sandbox)
```

unset all (no docker machine)
```
eval $(docker-machine env -u)
```

get docker machine IP
```
docker-machine ip dev
```

#### Docker

list running containers

```
docker ps
```

list all containers
```
docker ps -a
```

stop and delete all containers
```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

Container management
```
docker run -d -p 80:5000 training/webapp python app.py
docker run -it -p 8888:8888 gcr.io/tensorflow/tensorflow
docker ps
docker inspect 2f2b84ebd87d | grep IPAddress
docker exec -it 24bdc7c8307d bash
```

Image management
```
docker images
```

Delete all images
```
docker rmi $(docker images -q)
```

docker network inspect bridge

Convert cert to single line

awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' cert-name.pem

### Docker API

Using curl on OS X
```
curl https://52.16.157.182:2376/containers/json --cert $DOCKER_CERT_PATH/cert.p12 --pass mypass --key $DOCKER_CERT_PATH/key.pem --cacert $DOCKER_CERT_PATH/ca.pem
```

curl -X POST -H "Content-Type: application/json" --cert $DOCKER_CERT_PATH/cert.p12 --pass mypass --key $DOCKER_CERT_PATH/key.pem --cacert $DOCKER_CERT_PATH/ca.pem https://52.16.157.182:2376/containers/create -d '{ "Hostname":"", "User":"","Memory":0,"MemorySwap":0,"AttachStdin":false,"AttachStdout":true,"AttachStderr":true,"PortSpecs":null,"Privileged": false,"Tty":false,"OpenStdin":false,"StdinOnce":false,"Env":null,"Dns":null,"Image":"vieux/elasticsearch","Volumes":{},"VolumesFrom":"","WorkingDir":""}'

curl -X POST -H "Content-Type: application/json" --cert $DOCKER_CERT_PATH/cert.p12 --pass mypass --key $DOCKER_CERT_PATH/key.pem --cacert $DOCKER_CERT_PATH/ca.pem https://52.16.157.182:2376/containers/create -d '{"Image":"busybox"}'



curl -XPOST  -cert $DOCKER_CERT_PATH/cert.p12 --pass mypass --key $DOCKER_CERT_PATH/key.pem --cacert $DOCKER_CERT_PATH/ca.pem https://52.16.157.182:2376/containers/webserver/start




### References

https://realpython.com/blog/python/dockerizing-flask-with-compose-and-machine-from-localhost-to-the-cloud/    

http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/docker-singlecontainer-deploy.html    

[cli](https://docs.docker.com/compose/reference/overview/)    


https://www.digitalocean.com/community/tutorials/how-to-provision-and-manage-remote-docker-hosts-with-docker-machine-on-ubuntu-16-04    

https://hub.docker.com/r/ipython/scipyserver/    

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html    

[Amazon container registry](https://aws.amazon.com/ecr/)    

http://blog.couchbase.com/2016/february/enabling-docker-remote-api-docker-machine-mac-osx

#### Create a p12 cert for curl on OS X

http://blog.couchbase.com/2016/february/enabling-docker-remote-api-docker-machine-mac-osx

#### Docker API

https://www.sitepoint.com/automate-docker-with-the-remote-api-and-ruby/

http://between-deploys.swipely.com/2013/09/03/build-os-images-with-ruby.html

#### Docker client accessing parent

http://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach?rq=1

https://github.com/docker/docker/issues/1143

root@<host># docker run --add-host=docker:$(hostip) --rm -it debian
root@<container># cat /etc/hosts
...
130.0.10.1     docker # <--- Docker host's gateway, cannot be used to connect to host
...
root@<container># ip route show 0.0.0.0/0
default via 172.17.0.1 dev eth0 # <--- Docker host IP

curl -X PUT -G 128.178.51.175:3000/api/v1/submissions/24 -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'

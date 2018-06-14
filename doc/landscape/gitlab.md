## GitLab and development

GitLab can be installed for development purposes using Docker.

### Pull the image

```
docker pull gitlab/gitlab-ce
```

### Run the image

```
sudo docker run --detach \
    --hostname localhost \
    --publish 443:443 --publish 80:80 --publish 22:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
```

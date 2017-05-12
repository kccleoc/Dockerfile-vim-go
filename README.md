# Dockerfile-vim-go
docker build -t kccleoc/tagwhatever:latest https://github.com/kccleoc/Dockerfile-vim-go.git

## Using persistent data to store codes with docker volume <br />
$ docker volume create --name gocodevolume (create named volume) <br />
$ docker run -d -v gocodevolume:/go --name cv-go-code-vol busybox /bin/true (mount in container as /go) <br />
$ docker run -d --volumes-from cv-go-code-vol --name go-ide1 goimage /bin/sh (to mount the /go volume in another container)

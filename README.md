## 👋 Welcome to mariadb 🚀  

mariadb README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update mariadb
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/mariadb/mariadb/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/mariadb/rootfs"
git clone "https://github.com/dockermgr/mariadb" "$HOME/.local/share/CasjaysDev/dockermgr/mariadb"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/mariadb/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-mariadb-latest \
--hostname mariadb \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/mariadb:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/mariadb
    container_name: casjaysdevdocker-mariadb
    environment:
      - TZ=America/New_York
      - HOSTNAME=mariadb
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/mariadb/mariadb/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/mariadb/mariadb/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/mariadb
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/mariadb" "$HOME/Projects/github/casjaysdevdocker/mariadb"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/mariadb"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  

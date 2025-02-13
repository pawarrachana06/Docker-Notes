## Basic Docker commands

- To check the list of containers
```docker
docker ps 
```
-  To check running/previously stopped containers
```docker
docker ps -a
```
- To stop a container
```docker
docker stop container_name/id
```
- To remove the container (only the stopped container can be removed -Gives a warming). Can combine multiple container names/id separated by space
```docker
docker rm container_name/id 
```
-  To run am Image (This will pull the image if not present)
```docker
docker run image_name
```
- To run the image in detached mode i.e no execution/terminal with close to be shown
```docker
docker run -d image_name
```
- To run the image in interactive mode specify -it and to open bash append the bash command
```docker
docker run -it image_name bash
```
- To remove an image (only the images not referenced by container  can be removed -Gives a warming). Can combine multiple image names/is separated by space
```docker
docker rmi image_name
```
- To pull an image 
```docker
docker pull image_name
```
- To map the image to a port on host
-  To run the image with version tag
-  To inspect a container
-  To check the container logs
-  To build a Dockerfile
-  To tag a Dockerfile
-  To push a Dockerfile
-  To run a docker-compose.yml file , by default check for docker-compose.yml file in the directory
  ```docker
docker compose up
```
-  -To stop the docker-compose.yml file , by default check for docker-compose.yml file in the directory
```docker
docker compose doen
```
-  To pass env while running a image
```docker
docker run -e ENV_VARIABLE=VALUE image_name
```
-  To remove the docker build cache
  ```docker
docker builder prune
```
-To clear all the docker image/containers
```docker
docker system prune
```

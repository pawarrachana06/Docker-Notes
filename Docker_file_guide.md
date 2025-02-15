## What is a Docker Image?
Imagine you want to bake a cake 🎂.

A recipe 📝 tells you how to make it step by step.
The cake 🍰 is the final product.
Similarly, in Docker:

A Dockerfile = the recipe (instructions to build an image).
A Docker Image = the cake (a ready-to-use package with everything inside).
A Container = a slice of cake 🍰 (a running instance of the image).

A Docker image is a lightweight, standalone, executable package that includes everything needed to run an application:
✅ Code
✅ Runtime (e.g., Python, Node.js)
✅ Libraries & Dependencies
✅ Environment Variables
✅ Configurations

💡 A Docker image is a pre-packaged version of an app that runs the same way anywhere.

## How to Write a Dockerfile? (Step-by-Step) 🚀
1️⃣ Create a Project Directory


 
``` mkdir myapp && cd myapp ```


2️⃣ Create a Dockerfile


 ``` touch Dockerfile ```

 
3️⃣ Define the Dockerfile

Example: FastAPI application
```
#dockerfile

# Use an official lightweight Python image as base
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir fastapi uvicorn

# Expose the application port
EXPOSE 8000

# Define the startup command
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

## Commands in Dockefile


| **Command**      | **Description** |
|------------------|----------------|
| `FROM`          | Defines the **base image** for the container (e.g., `python:3.10-slim`). |
| `WORKDIR`       | Sets the **working directory** inside the container. |
| `COPY`          | Copies files from the **host machine** to the container. |
| `RUN`           | Executes commands inside the container **during build time** (e.g., installing dependencies). |
| `EXPOSE`        | Declares the **port** the application will listen on (for documentation only). |
| `CMD`           | Defines the **default command** to run when the container starts. |
| `ENTRYPOINT`    | Similar to `CMD`, but **forces execution of a command** even if arguments are passed. |
| `ENV`           | Sets **environment variables** inside the container. |
| `LABEL`         | Adds **metadata** (e.g., author, description) to the image. |
| `VOLUME`        | Creates a **persistent storage** location inside the container. |
| `ARG`           | Defines **build-time variables** (used only during `docker build`). |
| `ADD`           | Similar to `COPY`, but can also **extract tar files** and fetch remote URLs. |
| `HEALTHCHECK`   | Defines a command to **monitor container health** (e.g., `curl` to check if an app is running). |
| `USER`          | Specifies a **non-root user** to run the container. |

---
## How to Build & Run the Docker Image?

1️⃣ Build the Docker Image

``` docker 
docker build -t myapp:v1 .
```

✔ Creates a Docker image named myapp with version v1

2️⃣ Verify the Image

```
docker images
```

✔ Lists available images

3️⃣ Run a Container from the Image
```
docker run -d -p 8000:8000 --name my_running_app myapp:v1
```


✔ Runs the container in detached mode (-d)

4️⃣ Check Running Containers
```
docker ps
```

5️⃣ Stop & Remove the Container

```

docker stop my_running_app
```

```
docker rm my_running_app 
```

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
- To run the image in interactive mode specify -it and to open append the command
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
  
Port Mapping in Docker = Connecting Your Container to the Outside World 🌍
Imagine your Docker container is a restaurant kitchen 🍽️, and the host machine (your computer) is the restaurant building 🏢. Customers (users) can’t enter the kitchen directly—they need a service window (port) to order food.

How Does Port Mapping Work?
Docker containers have their own internal ports (like a private kitchen).
Your host machine (computer) has its own ports (like the restaurant entrance).
Port mapping connects a port on the host machine to a port inside the container so users can access the container’s services.

If a web app inside a container runs on port 5000, but you want to access it via your computer’s port 8080, you use:
``` docker  run -p 8080:5000 myapp ```
8080 → Port on the host machine (your computer) 🌎
5000 → Port inside the container (the kitchen) 🍳

- To store the Volumne locally
Volume Mapping in Docker = Giving Containers Persistent Storage 📦

Imagine a Docker container is like a food truck 🚚. It can cook and serve food (run applications), but if it drives away (gets deleted), all the ingredients (data) inside are lost!

💡 Solution? Use a storage unit (Docker Volume) to keep the ingredients safe!

How Does Volume Mapping Work?

Docker containers have temporary storage by default, meaning:

❌ If you delete the container, the data inside is gone!

``` docker run -v /host/path:/container/path myapp ```

- /home/user/data → A folder on your computer (host machine) 🖥️
- /app/data → A folder inside the container 📦
- Any files created in /app/data inside the container will also appear in /home/user/data on your computer!
- 
To save data permanently, we use volumes to store it outside the container on your computer.

-  To run the image with version tag
  
  ``` docker run image_name:tag ```
  eg:
``` docker run nginx:1.21 ```
  
-  To inspect a container
  ``` docker inspect containername ```

-  To check the container logs
``` docker  log containername ```

-  To build a Dockerfile
  ``` docker build -t myapp:v1 . ```

 -  To tag a Dockerfile
``` docker tag source_image:tag new_image:new_tag ```
-  To push a Dockerfile
  ``` docker push myusername/myapp:v1 ```

-  To run a docker-compose.yml file , by default check for docker-compose.yml file in the directory
  ```docker
docker compose up
```
-  -To stop the docker-compose.yml file , by default check for docker-compose.yml file in the directory
```docker
docker compose down
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

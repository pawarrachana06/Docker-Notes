# 📌 Docker Compose: A Complete Guide

## 📖 Introduction

### 🔹 What is Docker Compose?

Docker Compose is a **tool** that allows you to define and manage **multi-container Docker applications** using a single YAML configuration file (`docker-compose.yml`). Instead of manually running multiple `docker run` commands, you can define all services, networks, and volumes in **one file** and start everything with a single command.

### 🔹 Why Use Docker Compose?

✅ **Simplifies multi-container setups** – No need to start services individually.

✅ **Defines everything in one place** – Networks, volumes, services, and dependencies.

✅ **Easier scaling** – Quickly spin up or scale services.

✅ **Environment isolation** – Each project has its own defined services and configurations.

✅ **Version control-friendly** – The configuration can be stored in Git.

---

## 📄 Commands in a `docker-compose.yml` File (Explained)

| **Command**   | **Description**                                                             |
| ------------- | --------------------------------------------------------------------------- |
| `version`     | Defines the **Docker Compose file format version** (e.g., `3.8`).           |
| `services`    | Defines the **list of containers** to run as part of the application.       |
| `image`       | Specifies the **Docker image** to use (or build).                           |
| `build`       | Defines the **path to the Dockerfile** if building an image.                |
| `ports`       | Maps **container ports** to host machine ports.                             |
| `volumes`     | Mounts **persistent storage** for services.                                 |
| `environment` | Defines **environment variables** inside the container.                     |
| `depends_on`  | Ensures that **one service starts before another** (not for health checks). |
| `networks`    | Connects services within a **Docker network**.                              |
| `restart`     | Configures **restart policies** (e.g., `always`, `unless-stopped`).         |

---

##  Example `docker-compose.yml` (FastAPI + PostgreSQL)

```yaml
version: '3.8'

services:
  app:
    image: myapp:v1  # Use a pre-built image or build from Dockerfile
    build: .
    ports:
      - "8000:8000"
    depends_on:
      - db
    environment:
      DATABASE_URL: postgresql://postgres:password@db:5432/mydatabase
    volumes:
      - app_data:/app/data  # Persistent storage
    networks:
      - my_network

  db:
    image: postgres:15
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
      POSTGRES_DB: mydatabase
    volumes:
      - db_data:/var/lib/postgresql/data  # Persistent database storage
    networks:
      - my_network

volumes:
  app_data:
    driver: local
  db_data:
    driver: local

networks:
  my_network:
    driver: bridge
```

---

## 💾 Understanding Volumes in Docker Compose

### 🔹 What is a Volume?

A **volume** is a storage mechanism that persists data **even if a container is stopped or removed**.

### 🔹 Types of Volumes

| **Type**          | **Description**                                                |
| ----------------- | -------------------------------------------------------------- |
| **Named Volumes** | Managed by Docker, stored in `/var/lib/docker/volumes/`.       |
| **Bind Mounts**   | Directly maps to a specific directory on the **host machine**. |

### 🔹 Example of Volume Mounting

```yaml
volumes:
  my_volume:
    driver: local
```

In the `services:` section:

```yaml
  app:
    volumes:
      - my_volume:/app/data
```

### 🔹 Bind Mount Example

```yaml
  app:
    volumes:
      - ./host-folder:/container-folder
```

This maps `./host-folder` on the host machine to `/container-folder` inside the container.

---

## 🌐 Networking in Docker Compose

### 🔹 Types of Docker Networks

| **Network Type**  | **Description** |
|-------------------|----------------|
| **Bridge**       | Default network type, isolates containers and allows internal communication. |
| **Host**         | Removes network isolation, making the container share the host’s network stack. |
| **Overlay**      | Used in Docker Swarm, enables multi-host container communication. |
| **Macvlan**      | Assigns a unique MAC address to each container, making them appear as physical devices. |
| **None**         | No networking, completely isolates the container. |

### 🔹 Example of a Bridge Network

A **bridge network** allows containers to communicate **internally** without exposing ports to the external world.

```yaml
networks:
  my_network:
    driver: bridge
```

Services using this network:

```yaml
  app:
    networks:
      - my_network

  db:
    networks:
      - my_network
```

Here, **`app`** and **`db`** can communicate using service names (e.g., `db:5432`).

---

## ⚙️ Docker Engine & Orchestration

### 🔹 Docker Engine

Docker Engine is the **core component** that runs Docker containers. It includes:

- **Docker Daemon** (background process managing images & containers)
- **CLI (Command Line Interface)**
- **API (to interact with services programmatically)**

### 🔹 Orchestration

Docker Compose **orchestrates multi-container applications** on a single host. For distributed deployments, we use:

- **Docker Swarm** (built-in clustering tool)
- **Kubernetes** (advanced container orchestration)

---

## 🚀 Step-by-Step Guide to Using Docker Compose

### 1️⃣ **Install Docker & Docker Compose**

- **Windows/Mac:** Install Docker Desktop (includes Compose)
- **Linux:** Install using package manager:

```bash
sudo apt install docker-compose -y  # Ubuntu/Debian
```

### 2️⃣ **Create a `docker-compose.yml` File**

```bash
touch docker-compose.yml
```

### 3️⃣ **Build and Start Services**

```bash
docker-compose up -d --build
```

✅ `-d` runs services in detached mode (background).  
✅ `--build` ensures the latest image is built.

### 4️⃣ **Check Running Containers**

```bash
docker-compose ps
```

### 5️⃣ **View Logs**

```bash
docker-compose logs -f
```

### 6️⃣ **Stop and Remove Containers**

```bash
docker-compose down
```

### 7️⃣ **Remove Volumes (Optional)**

```bash
docker-compose down -v
```

✅ This deletes **all volumes and data**.

---

## 🔥 Best Practices for Docker Compose

✅ **Use Named Volumes** instead of Bind Mounts for better portability.  
✅ **Leverage Networks** to enable service-to-service communication.  
✅ **Use `.env` files** for sensitive configurations instead of hardcoding.  
✅ **Keep Services Stateless** to allow scaling and recovery.  
✅ **Use Health Checks** to monitor service status.

---


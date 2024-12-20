# Inception

Welcome to the **Inception** project! This project is designed to provide a full-fledged development environment using Docker and Docker Compose, ensuring that all necessary services are configured and running seamlessly.

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Setup Instructions And Usage](#setup-instructions-and-usage)
- [Usage](#usage)
- [Stopping and Removing Containers](#stopping-and-removing-containers)
- [Project Architecture](#project-architecture)
- [License](#license)

## Features

- Easy setup and configuration of multiple services using Docker.
- Ability to build and run containers with a single command.
- Automated scripts for environment setup.
- Built-in functionality to monitor the status of services.

## Technologies

- Docker
- Docker Compose
- Bash

## Setup Instructions And Usage

1. **Install And Start Docker**

   ```bash
   pacman -S docker
   pacman -S docker-compose
   (OR)
   apt install docker
   systemctl start docker
   ```

2. **Clone the repository:**

   ```bash
   git clone https://github.com/7h3Y055/inception.git
   cd inception
   cp srcs/.example_env srcs/.env
   make
   ```
   Don't forget to edit srcs/.env with your informations.

## Status Monitoring

1. **Monitor CLI:**

   ```bash
   make status
   ```

2. **Monitor GUI (cadvisor):**

   http://localhost:8080

## Stopping and Removing Containers

1. **Stopping Containers**

   ```bash
   make stop
   ```

2. **Stopping And Remove Containers And Volumes And Networks**

   ```bash
   make down
   ```

## Project Architecture

1. **Wordpress**
![Project Architecture](imgs/wordpress.png)
2. **Adminer**
![Project Architecture](imgs/Adminer.png)
3. **Static Web Page**
![Project Architecture](imgs/Static_Web_Page.png)


## License
   
   Feel free to adjust any sections to better match your project's needs!



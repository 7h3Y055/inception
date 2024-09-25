# Inception

Welcome to the **Inception** project! This project is designed to provide a full-fledged development environment using Docker and Docker Compose, ensuring that all necessary services are configured and running seamlessly.

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Status Monitoring](#status-monitoring)
- [Stopping and Removing Containers](#stopping-and-removing-containers)

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

1. **Clone the repository:**
   

   ```bash
   git clone https://github.com/7h3Y055/inception.git
   cd inception
   cp srcs/.example_env srcs/.env
   make
   ```
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


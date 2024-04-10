# Auto build docker in AI Server
This guide aims to walk you through deploying an environment using Docker containers, based on Ubuntu 22.04 with CUDA 12.3.2 and cuDNN 9, and installing necessary Python libraries including PyTorch.

## Docker Desktop (Client)

- **Version**: 25.0.3
- **API version**: 1.44
- **Build Date**: Tue Feb  6 21:13:02 2024
- **OS/Arch**: windows/amd64

## Docker Engine (Server)

- **Version**: 26.0.0
- **API version**: 1.45
- **Build Date**: Wed Mar 20 15:17:48 2024
- **OS/Arch**: linux/amd64

## File Descriptions

- `Ubuntu22.04-CUDA.Dockerfile`: Defines the steps for building the Docker image, including the base image, installing Python and pip, and the required Python libraries.
- `requirements.txt`: Lists all the Python libraries needed for the project, which are used by the `Ubuntu22.04-CUDA.Dockerfile` to build the image.
- `Create_Docker-linux-x86_64.bat`: A Windows batch script for automating the process of building the Docker image, and creating and starting a Docker container.

## Usage Tutorial

### Step 1: Preparation

Ensure Docker is installed on your Windows system. For installation instructions, visit the [Docker Desktop documentation](https://docs.docker.com/desktop/).

#### Windows

![Docker Setup](https://raw.githubusercontent.com/MikeHuang0618/DL-with-Docker/main/images/Install_Docker.jpg)

### Step 2: Build the Docker Image

Open a command line tool, navigate to the directory containing the `Ubuntu22.04-CUDA.Dockerfile` and `requirements.txt`, and execute the `Create_Docker-linux-x86_64.bat` script. This script requires three arguments:

1. **Container Name**: The name you wish to assign to the created container.
2. **Local Project Path**: The local path you want to mount to the `/workspace` directory in the container.

Example command:

```cmd
Create_Docker-linux-x86_64.bat my_container_name /data/Mike/CRNN
```

### Step 3: View Container Logs

After the container starts, you can use the following command to view its logs and check the execution status:
```cmd
docker logs my_container_name
```
Replace my_container_name with the name you specified when creating the container.

### Step 4: Enter the Container

If you need to perform interactive operations inside the container, you can use the following command:
```cmd
docker exec -it my_container_name bash
```
Again, replace my_container_name with your container's name.

## Conclusion

By following the steps above, you can quickly deploy and run your Docker container for deep learning development and testing. Ensure to adjust the command parameters according to your actual paths and requirements.

This README.md file offers a concise description of each file and a basic tutorial on how to use these files to build and run a Docker container. Feel free to adjust and expand this document according to the specific needs and configurations of your project.

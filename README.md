# My Website - Nginx Docker

A simple single-page HTML website served using **Nginx** inside a **Docker container**.

## Project Overview

This project demonstrates how to:

* Create a single-page HTML website
* Use Ubuntu with Nginx as the web server
* Build a Docker image
* Run the website inside a Docker container
* Access the website from a web browser
* Push the project to GitHub

## Technologies Used

* HTML5
* Nginx
* Ubuntu
* Docker
* Git
* GitHub
* Visual Studio Code

## Project Structure

```text
my-website/
├── Dockerfile
├── index.html
└── README.md
```

## Dockerfile

The Dockerfile uses Nginx as the base image and copies the website into Nginx's default web directory.

```dockerfile
FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

## Build the Docker Image

From the project directory, run:

```bash
docker build -t my-website .
```

Check that the image was created:

```bash
docker images
```

## Run the Container

Run the container and map port 8080 on the host to port 80 inside the container:

```bash
docker run -d --name my-web -p 8080:80 my-website
```

Check the running container:

```bash
docker ps
```

## Access the Website

Open a web browser and go to:

```text
http://localhost:8080
```

The website should be displayed in your browser.

## Verify Nginx Inside the Container

To enter the running container:

```bash
docker exec -it my-web bash
```

iCheck the Nginx version:

```bash
nginx -v
```

Check where Nginx is installed:

```bash
which nginx
```

Exit the container:

```bash
exit
```

## Stop the Container

```bash
docker stop my-web
```

## Remove the Container

```bash
docker rm my-web
```

## GitHub

The project can be version-controlled with Git and stored in a GitHub repository.

### Git Commands

Initialize Git:

```bash
git init
```

Check the repository status:

```bash
git status
```

Add the project files:

```bash
git add .
```

Create the first commit:

```bash
git commit -m "Initial commit"
```

Rename the branch to `main`:

```bash
git branch -M main
```

Add the GitHub remote:

```bash
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
```

Push the project to GitHub:

```bash
git push -u origin main
```

## Author

Taiwo Joseph


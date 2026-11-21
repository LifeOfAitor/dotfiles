# docker

Containers: run programs in an isolated environment, with everything they need, without installing it on your system.

## On macOS: OrbStack

Docker comes from **OrbStack** (`cask "orbstack"` in the Brewfile): it ships the `docker` command (and `docker compose`) plus the Linux VM that runs the containers. No need to install `docker` with brew.

Open it once (or let it start at login); while it's closed, every command fails with `Cannot connect to the Docker daemon`. On Linux, install docker from your distro's package manager and its service is all you need.

## Containers

| Command | What it does |
|---|---|
| `docker run hello-world` | Check that everything works |
| `docker run -it --rm ubuntu bash` | A shell in a throwaway Ubuntu (deleted on exit) |
| `docker run -d --name web -p 8080:80 nginx` | In the background, host port 8080 to container port 80 |
| `docker run -v "$PWD":/app ...` | Mount the current folder inside the container |
| `docker ps` / `docker ps -a` | Running containers / all of them |
| `docker logs -f web` | Follow the logs live |
| `docker exec -it web sh` | Get a shell in a running container |
| `docker stop web` / `docker start web` | Stop / start |
| `docker rm web` | Delete the container (`-f` if it's running) |

## Images

| Command | What it does |
|---|---|
| `docker images` | Downloaded images |
| `docker pull nginx` | Download an image |
| `docker build -t myapp .` | Build an image from the folder's `Dockerfile` |
| `docker rmi nginx` | Delete an image |

## Compose (several containers from a `compose.yaml`)

| Command | What it does |
|---|---|
| `docker compose up -d` | Bring everything up in the background |
| `docker compose ps` | Status |
| `docker compose logs -f` | Logs from all of them |
| `docker compose pull && docker compose up -d` | Update the images and restart |
| `docker compose down` | Stop and remove the containers (volumes stay) |

## Cleanup

| Command | What it does |
|---|---|
| `docker system df` | How much space everything takes |
| `docker system prune` | Remove stopped containers, unused networks and cache |
| `docker system prune -a` | Also every image that isn't in use |

Reference: `docker --help`, <https://docs.docker.com/reference/cli/docker/>.

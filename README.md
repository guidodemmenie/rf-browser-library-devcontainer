# S4S workshop

### Windows:
[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/guidodemmenie/rf-browser-library-devcontainer.git)


### Mac:
1. Clone the repo
  1. `git clone https://github.com/guidodemmenie/rf-browser-library-devcontainer.git`
1. Open folder in VSCode
1. F1 >> Dev Container: Rebuild Container

# Prerequisites

- Docker
- VS Code

## Steps
1. Install Podman Desktop [https://podman-desktop.io]
2. Instal VS Code [https://code.visualstudio.com/download]


#### VS Code
1. Settings
1. zoek `dev.containers.dockerPath`
1. verander **Docker Path** van `docker` naar `podman`


## Optioneel
Toevoegen Ubuntu als default WSL host waardoor browser automatisch wordt gestart op host.

- Check in cmd: `wsl --version`
```
WSL version: 2.2.4.0
[...]
```

- Check `wsl --list `
```
Windows Subsystem for Linux Distributions:
docker-desktop (default)
```
- Ga via het StartMenu naar *Microsoft Store*
- Zoek op *Ubuntu*
- Installeer *Ubuntu App*

- Check `wsl --list `
```
Windows Subsystem for Linux Distributions:
docker-desktop (default)
Ubuntu
```

- Run `wsl -s Ubuntu`


- Check `wsl --list `
```
Windows Subsystem for Linux Distributions:
docker-desktop
Ubuntu (default)
```

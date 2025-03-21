# ROS2 Humble Docker

## Prerequisites

Before running this container, ensure you have the following dependencies installed:

Docker: [Engine Only](https://docs.docker.com/engine/install/) or [Desktop GUI](https://docs.docker.com/get-docker/)<br>
(_GUI version highly reccommended for those not familliar with the command line_)

Docker Compose: Comes with Docker Desktop. [Standalone Install](https://docs.docker.com/compose/install/)

MacOS guide for installing these is below

## Windows install

Make sure the file ".env" exists in this folder (If it doesn't exist then create it)

Add into your .env file the absolute path to your ros2_ws folder, e.g.

```
ROS_PROJECT_PATH='C:\path_to_your_local_ros_workspace_folder\'
```

Open powershell and navigate to this folder using cd, then execute

```powershell
docker compose build
docker compose up -d
docker attach ros-dev-vm
```

## Windows specific notes

Any commands in usage that say `docker-compose` on windows should be run as `docker compose` with a space instead of a hyphen

Do not run the setup script (setup.sh) on windows, the windows specific instructions should suffice

### MacOS install

For macOS users, the recommended method of installing Docker and Docker Compose is through Homebrew:
<br>
Install Homebrew by running the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> **:warning: Warning:**
> Running untrusted code directly with bash can be harmful for your computer, and may expose you to viruses or other unecessary risk

Install Docker and Docker Compose using Homebrew:

```bash
brew install --cask docker && brew install docker-compose
```

or for just the engine

```bash
brew install docker docker-compose
```

> :information_source:
> There are sometimes errors when running through QEMU (default) emulation for the containers. <br />
> To switch from QEMU to Rosetta emulation in Docker, go to **Docker Desktop Settings > General > Virtual Machine Options > Apple Virtualisation Framework > Use Rosetta for x86/amd64 emulation on Apple Silicon**

<sub>(additionally Rosetta is up to 4x faster)</sub>

## Usage

Clone this repo

```bash
git clone https://github.com/uqracing/noetic-docker.git
cd noetic-docker
```

Run the setup script

```bash
./setup.sh
```

Once inside the container, press Ctrl + P followed by Ctrl + Q to exit. <br>
To remove the containers and free up resources, use

```bash
docker-compose down
```

in the folder where this repo's docker-compose.yml exists. <br>
PLEASE remove containers and git pull before starting containers to ensure you have an up to date config <br>
To restart the containers, use

```bash
docker-compose up -d
```

or feel free to use the run script.

```bash
./run.sh
```

Alternatively, you can stop the containers, which keeps them around so you do not need to rebuild the next time you try to run.

```bash
docker-compose stop
```

and to restart then run

```bash
docker-compose start
```

> **:exclamation: Important:**
> To access the desktop, visit http://localhost:8080/vnc_auto.html

Note that the terminal inside this is NOT connected to your docker terminal, and will NOT have the required dependencies installed.

## How to run multiple terminals at once

N.B. you can run a seperate terminal inside a new terminal emulator by running the command

```bash
docker exec -it ros-dev-vm /bin/bash
```

However, we use `tmux` to manage multiple terminal sessions inside of one emulator simultaneously. To get started:

1. Start a new tmux session by running:

   ```bash
   tmux
   ```

2. Split the terminal into multiple panes:

   - Vertically: `Ctrl + b`, then %
   - Horizontally: `Ctrl + b`, then "

3. Switch between panes using `Ctrl + b`, then use the arrow keys.

4. To create multiple windows:

   - Press `Ctrl + b`, then C to create a new window.

5. Switch between windows using `Ctrl + b`, then use the number keys (1, 2, 3, etc.).

6. To detach from the session and leave it running in the background:
   Ctrl + b, then d

7. To reattach to the tmux session:
   tmux attach-session

For more advanced tmux usage, check out the [official tmux manual](https://man7.org/linux/man-pages/man1/tmux.1.html).

## Issues

Feel free to report issues, this is currently in beta and is not validated for all systems. Verified on an M1 and M3 Apple Silicon Mac.

### Common issues

HELP I GET A WEIRD ERROR GETTING CREDENTIALS!!!<br/>
`(ERROR: failed to solve: error getting credentials - err: exit status 1, out: ``)` <br/>
OSX: edit the file at `~/.docker/config.json` to change credsStore to be either desktop or osxkeychain (whichever it currently is not) <br/>

HELP MY I CANNOT RUN DOCKER-COMPOSE:<br />
docker does support running compose commands via `docker compose` in some situations instead of `docker-compose` but implementation across various versions is inconsistent. The guide recommends you use `docker-compose` but if only `docker compose` works for you, just use that (they are supposed to be the same thing)

WINDOWS DOCKER DESKTOP ISSUE:<br />
WSL update failed or smth like that?<br />
Update WSL manually: go to `https://github.com/microsoft/WSL/releases` and scroll down to the release tagged `latest` <br />
select the installer (`.........x86.msi` for most people unless you know it's otherwise) and install then relaunch docker

HELP MY TERMINAL ISNT RENDERING THE PROMPT CORRECTLY:<br />
Please install and configure a nerdfont to properly use the prompt: instructions are easily available and depend on your terminal, os and preferred font

HELP I'M MISSING A DEPENDENCY:<br />
Please create a git issue and tag it with the `Missing Dependency` label. Assign either [@nedlane] (https://www.github.com/nedlane), or assign yourself and create a branch with it added, PR and link to issue. Make sure to request review from somebody else before merging so that it doesn't brick everyone's environment! Don't forget to update the list of dependencies with the added one(s).

## Notes

Please note that the setup script requires an **ABSOLUTE** path to your project folder

## Dependencies

For a full list of system packages, ROS 2, and Python libraries required, see the [dependencies documentation](dependencies.md).

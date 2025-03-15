# ROS2 Humble Docker

## Prerequisites

Before running this container, ensure you have the following dependencies installed:

Docker: [Engine Only](https://docs.docker.com/engine/install/) or [Desktop GUI](https://docs.docker.com/get-docker/)<br>
(_GUI version highly reccommended for those not familliar with the command line_)

Docker Compose: Comes with Docker Desktop. [Standalone Install](https://docs.docker.com/compose/install/)

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

Install Docker and Docker Compose using Homebrew:

```bash
brew install docker docker-compose
```

## Usage

Clone this repo

```bash
git clone https://github.com/uqracing/noetic-docker.git
cd noetic-docker
git checkout compose
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

To access the desktop, visit http://localhost:8080/vnc_auto.html

Note that the terminal inside this is NOT connected to your docker terminal, and will NOT have the required dependencies installed.

## How to run multiple terminals at once

We use `tmux` to manage multiple terminal sessions simultaneously. To get started:

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

## Notes

Please note that the setup script requires an **ABSOLUTE** path to your project folder

## Dependencies

### General

#### **System Packages:**

- **wget**: allows for fetching additional resources from the internet during the image build process.
- **lsb-release**: a lightweight utility that provides key information about the Linux distribution, used to dynamically obtain the Ubuntu codename for configuring the ROS 2 repository.
- **gnupg2**: a tool for secure communication and data storage, used to manage and verify GPG keys for secure package installation.
- **curl**: a command-line tool used for transferring data from or to a server, necessary for securely downloading repository keys and configuration files.
- **python3-pip**: the package manager for Python 3, allowing easy installation, upgrading, and management of Python libraries and dependencies.
- **python3-dev**: provides the header files and static libraries necessary for compiling Python modules written in C or C++.
- **locales**: provides tools required to configure and generate locale settings, ensuring proper UTF-8 text encoding.
- **software-properties-common**: a set of tools for managing software sources, enabling the Universe repository and allowing easy addition of third-party sources like ROS 2.
- **build-essential**: a meta-package that installs core development tools (e.g., gcc, g++, Make) necessary to compile software.
- **git**: used for version control within the team and for accessing open-source software.
- **tmux**: a terminal multiplexer that allows multiple terminal sessions to be accessed and controlled from a single window.
- **virtualgl**: a package for enabling remote 3D rendering with GPU acceleration.

#### **ROS 2 and Related Packages:**

- **python3-osrf-pycommon**: a utility package required for ROS 2 development.
- **ros-humble-desktop**: the full ROS 2 Humble desktop installation, including core tools and visualization software.
- **python3-rosdep**: a tool for installing dependencies for ROS packages.
- **ros-humble-gazebo-msgs**: message definitions for integrating ROS with the Gazebo simulator.
- **ros-humble-image-geometry**: provides ROS-compatible image geometry transformations.
- **ros-humble-gazebo-ros**: ROS interface for the Gazebo simulator.
- **ros-humble-pcl-ros**: integrates the Point Cloud Library (PCL) with ROS.
- **ros-humble-camera-info-manager**: manages camera calibration information within ROS.
- **ros-humble-velodyne-simulator**: provides simulated Velodyne LiDAR sensor support.
- **ros-humble-joy**: joystick driver for ROS.
- **ros-humble-ackermann-msgs**: message definitions for Ackermann steering-based vehicles.
- **ros-humble-joint-state-publisher**: publishes joint states for robot visualization.
- **ros-humble-rviz-visual-tools**: visualization tools for RViz.

#### **Python Libraries:**

- **numpy (1.24.4)**: a fundamental package for numerical computing in Python.
- **networkx (2.5)**: a library for creating, analyzing, and manipulating complex networks and graphs.
- **torch (2.1.1)**: an open-source machine learning library for deep learning and tensor computation.
- **torchvision (0.16.1)**: provides computer vision datasets, models, and image transformations for PyTorch.
- **torchaudio (2.1.1)**: provides audio processing functionalities for PyTorch.
- **ground**: a Python library for computational geometry.
- **sect**: a Python library used for geometric computations (possibly related to sector operations).
- **scikit-learn**: a machine learning library for Python that includes classification, regression, and clustering algorithms.
- **cv_bridge**: a ROS package that provides an interface between ROS image messages and OpenCV.
- **opencv-python**: an open-source computer vision and machine learning library.
- **ultralytics**: a library associated with object detection and deep learning models like YOLO.
- **onnx**: an open standard for machine learning model interoperability.
- **nms**: a library related to non-maximum suppression, often used in object detection.
- **shapely**: a library for geometric operations and spatial analysis.
- **ipython**: an enhanced interactive Python shell.
- **pandas (1.4.4)**: a data analysis and manipulation library.

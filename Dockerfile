# Use the official Ubuntu 22.04 base image
FROM --platform=linux/amd64 ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

#lets see if this works
RUN rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    lsb-release \
    gnupg2 \
    curl \
    python3-pip \
    python3-dev \
    locales \
    software-properties-common \
    build-essential \
    git

#Mac users will probs need this

RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    software-properties-common \
    tmux 

# Add the VirtualGL GPG key
RUN wget -q -O- https://packagecloud.io/dcommander/virtualgl/gpgkey | \
    gpg --dearmor > /etc/apt/trusted.gpg.d/VirtualGL.gpg

# Add the VirtualGL repository
RUN wget -q -O /etc/apt/sources.list.d/VirtualGL.list \
    https://raw.githubusercontent.com/VirtualGL/repo/main/VirtualGL.list
# Update package lists and install VirtualGL
RUN apt-get update && apt-get install -y virtualgl
    


RUN locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# Add ROS 2 Humble repository
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | apt-key add - && \
    add-apt-repository universe && \
    echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list

# Install python3-osrf-pycommon (ROS package)
RUN apt-get update && \
    apt-get install -y python3-osrf-pycommon

# Install ROS 2 Humble and additional ROS packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ros-humble-desktop \
    python3-rosdep \
    ros-humble-gazebo-msgs \
    ros-humble-image-geometry \
    ros-humble-gazebo-ros \
    ros-humble-pcl-ros \
    ros-humble-camera-info-manager \
    ros-humble-velodyne-simulator \
    ros-humble-joy \
    ros-humble-ackermann-msgs \
    ros-humble-joint-state-publisher \
    ros-humble-rviz-visual-tools && \
    rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rm -f /etc/ros/rosdep/sources.list.d/20-default.list

RUN rosdep init && \
    rosdep update

RUN apt update 

RUN apt install python3-colcon-common-extensions -y

# Install Python packages
RUN pip3 install --no-cache-dir --upgrade \
    numpy==1.24.4 \
    networkx==2.5 \
    torch==2.1.1 \
    torchvision==0.16.1 \
    torchaudio==2.1.1 \
    ground \
    sect \
    scikit-learn \
    cv_bridge \
    opencv-python \
    ultralytics \
    onnx \
    nms \
    shapely \
    ipython \
    pandas==1.4.4

RUN yes | unminimize
# Source ROS setup script for all users
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc
RUN echo "export EUFS_MASTER=/ros2_ws/src" >> /etc/bash.bashrc

# Set the default command
CMD ["bash"]

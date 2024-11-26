# Use the NVIDIA CUDA 11.8 base image
FROM ubuntu:20.04


# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive


# Install dependencies
RUN apt-get update && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    lsb-release \
    gnupg2 \
    curl \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*
# Add ROS Noetic repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Add ROS key
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

# Install ROS Noetic
RUN apt-get update && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc |   apt-key add - && \
    apt update && \
    apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y build-essential


# Initialize rosdep
RUN rosdep init && \
    rosdep update



# Conenet dependencies
RUN apt-get update
RUN apt-get upgrade
RUN python3 -m pip install networkx==2.5
RUN python3 -m pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cpu && \
    python3 -m pip install cv_bridge opencv-python ultralytics onnx nms && \
    apt update && \
    apt install -y git ros-noetic-catkin python3-catkin-tools python3-osrf-pycommon

    

#Vam dependencies
RUN apt update && \
    apt install -y libsdl2-2.0-0 libsdl2-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev && \
    apt install -y ros-noetic-sbg-driver && \
    apt-get -y install ros-noetic-rosserial && \
    apt-get -y install ros-noetic-rosserial-arduino

# FSSIM dependencies
RUN apt install -y python3-catkin-tools && \
    apt install -y libpcl-dev && \
    apt install -y python3-pip

# Install ROS Packages
RUN apt-get install -y \
    ros-noetic-gazebo-msgs \
    ros-noetic-gazebo-ros \
    ros-noetic-pcl-ros \
    ros-noetic-camera-info-manager \
    ros-noetic-hector-gazebo \
    ros-noetic-velodyne-simulator \
    ros-noetic-joy
  
#Vape2
RUN apt install -y ros-noetic-rviz-visual-tools ros-noetic-ddynamic-reconfigure
RUN pip3 install shapely
RUN pip3 install --upgrade numpy
RUN pip install ipython


# Source ROS setup script for all users
RUN echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

# Set the default command
CMD ["bash"]

# Use the NVIDIA CUDA 11.8 base image
FROM ubuntu:22.04


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

RUN locale

RUN apt-get update && \
    apt-get install -y locales \
    && locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN locale

# Add ROS Humble repository
RUN apt-get install -y software-properties-common
RUN add-apt-repository universe


# Add ROS key
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
# Install ROS Noetic
RUN apt-get update && \
    apt update && \
    apt upgrade && \
    apt-get install -y ros-humble-desktop \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y ros-dev-tools


RUN rosdep init && \
    rosdep update


# Conenet dependencies
RUN apt-get update
RUN apt-get upgrade
RUN pip3 install --upgrade numpy
RUN python3 -m pip install networkx==2.5
RUN python3 -m pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cpu && \
    python3 -m pip install cv_bridge opencv-python ultralytics onnx nms && \
    apt update && \
    apt install -y git python3-osrf-pycommon

    

#Vam dependencies
# TODO: sbg_driver is not available in humble, build from source as seen on sbg_driver repo
# RUN apt update && \
#     apt install -y libsdl2-2.0-0 libsdl2-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev && \
#     apt install -y ros-humble-sbg-driver && \

#TODO ROSSERIAL is not in humble, i think its microros
#     apt-get -y install ros-noetic-rosserial && \
#     apt-get -y install ros-noetic-rosserial-arduino

# # FSSIM dependencies
# No fssim being used, will be modified to EUFS


# RUN apt install -y python3-catkin-tools && \
#     apt install -y libpcl-dev && \
#     apt install -y python3-pip

# Install ROS Packages
RUN apt-get install -y \
    ros-humble-gazebo-msgs \
    ros-humble-gazebo-ros \
    ros-humble-pcl-ros \
    ros-humble-camera-info-manager \
    # below is available in noetic and melodic
    #ros-noetic-hector-gazebo \
    ros-humble-velodyne-simulator \
    ros-humble-joy
  
#Vape2
RUN apt install -y ros-humble-rviz-visual-tools
# TODO: ddynamic-reconfigure not on humble, find alternative (rqt_reconfigure is apparently its replacement)
# The issue is that ddynamic is an extension of dynamic reconfigure, so we have to retrofit vape to rqr_reconfigure)
# Unless we dont need the package?
# RUN ros-humble-ddynamic-reconfigure
RUN pip3 install shapely
RUN pip install ipython


# Source ROS setup script for all users
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc

# Set the default command
CMD ["bash"]

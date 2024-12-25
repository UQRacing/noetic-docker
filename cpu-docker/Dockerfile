# Use an official Ubuntu base image
FROM ubuntu:20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set locale
RUN apt-get update && \
    apt-get install -y locales && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        lsb-release \
        gnupg2 \
        curl \
        python3-pip \
        python3-dev \
        software-properties-common \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

# Add ROS 2 GPG key and repository
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 Galactic and essential tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ros-galactic-desktop \
        python3-rosdep \
        python3-colcon-common-extensions \
        ros-galactic-cv-bridge \
        ros-dev-tools \
        git \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init && \
    rosdep update

# Install Python packages
RUN pip3 install --upgrade pip && \
    pip3 install --upgrade numpy && \
    pip3 install networkx==2.5 && \
    pip3 install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cpu && \
    pip3 install opencv-python ultralytics onnx nms ipython

# Source ROS 2 setup script in all shell sessions
RUN echo "source /opt/ros/galactic/setup.bash" >> /etc/bash.bashrc

# Rviz visual dep
RUN apt-get update && apt-get install -y --no-install-recommends \
    libx11-xcb1 \
    libxrender1 \
    libxext6 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    && rm -rf /var/lib/apt/lists/*




    

# #Vam dependencies
# RUN apt update && \
#     apt install -y libsdl2-2.0-0 libsdl2-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev && \
#     apt install -y ros-noetic-sbg-driver && \
#     apt-get -y install ros-noetic-rosserial && \
#     apt-get -y install ros-noetic-rosserial-arduino

# # FSSIM dependencies
# RUN apt install -y python3-catkin-tools && \
#     apt install -y libpcl-dev && \
#     apt install -y python3-pip

# # Install ROS Packages
# RUN apt-get install -y \
#     ros-noetic-gazebo-msgs \
#     ros-noetic-gazebo-ros \
#     ros-noetic-pcl-ros \
#     ros-noetic-camera-info-manager \
#     ros-noetic-hector-gazebo \
#     ros-noetic-velodyne-simulator \
#     ros-noetic-joy
  
# #Vape2
# RUN apt install -y ros-noetic-rviz-visual-tools ros-noetic-ddynamic-reconfigure
# RUN pip3 install shapely
# RUN pip install ipython


# (Optional) Set up entrypoint to source ROS 2 automatically
COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

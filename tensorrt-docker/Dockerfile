# Use the NVIDIA CUDA 11.8 base image
FROM nvidia/cuda:11.8.0-devel-ubuntu20.04


# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TENSORRT_VERSION=8.5.2.2 
ENV CUDNN_VERSION=8.9.7 
ENV CUDA_VERSION=11.8 
ENV TENSORRT_DIR=/usr/local/TensorRT-${TENSORRT_VERSION}

# Install dependencies
RUN apt-get update && \
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
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - && \
    sudo apt update && \
    apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init && \
    rosdep update

# Copy the TensorRT tar file into the container
COPY TensorRT-${TENSORRT_VERSION}.Linux.x86_64-gnu.cuda-${CUDA_VERSION}.cudnn8.6.tar.gz /tmp/

# Extract TensorRT
RUN tar -xzf /tmp/TensorRT-${TENSORRT_VERSION}.Linux.x86_64-gnu.cuda-${CUDA_VERSION}.cudnn8.6.tar.gz -C /usr/local/ && \
    rm /tmp/TensorRT-${TENSORRT_VERSION}.Linux.x86_64-gnu.cuda-${CUDA_VERSION}.cudnn8.6.tar.gz

# Set environment variables for TensorRT
ENV LD_LIBRARY_PATH=${TENSORRT_DIR}/lib:${LD_LIBRARY_PATH} 
ENV PATH=${TENSORRT_DIR}/include:${PATH} 
ENV LIBRARY_PATH=${TENSORRT_DIR}/lib:${LIBRARY_PATH}

# Install TensorRT Python bindings
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install ${TENSORRT_DIR}/python/tensorrt-8.5.2.2-cp38-none-linux_x86_64.whl && \
    python3 -m pip install ${TENSORRT_DIR}/onnx_graphsurgeon/onnx_graphsurgeon-0.3.12-py2.py3-none-any.whl

RUN export LD_LIBRARY_PATH=TensorRT-8.5.2.2/lib:$LD_LIBRARY_PATH

# Conenet dependencies
RUN python3 -m pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cu118 && \
    python3 -m pip install cv_bridge && \
    python3 -m pip install opencv-python && \
    python3 -m pip install ultralytics && \
    python3 -m pip install nvidia-pyindex && \
    python3 -m pip install onnx && \
    python3 -m pip install nms && \
    python3 -m pip install pycuda && \
    sudo apt update && \
    sudo apt install git && \
    sudo apt install ros-noetic-catkin python3-catkin-tools python3-osrf-pycommon

    

#Vam dependencies
RUN sudo apt update && \
    sudo apt install libsdl2-2.0-0 libsdl2-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev && \
    sudo apt install ros-noetic-sbg-driver && \
    sudo apt-get install ros-noetic-rosserial && \
    sudo apt-get install ros-noetic-rosserial-arduino

# FSSIM dependencies
RUN sudo apt-get install && \
    sudo apt install python3-catkin-tools && \
    sudo apt install ibpcl-dev && \
    sudo apt install python3-pip

# Install ROS Packages
RUN sudo apt-get install \
    ros-noetic-gazebo-msgs \
    ros-noetic-gazebo-ros \
    ros-noetic-pcl-ros \
    ros-noetic-camera-info-manager \
    ros-noetic-hector-gazebo \
    ros-noetic-velodyne-simulator \
    ros-noetic-joy
  

RUN pip3 install shapely

# Source ROS setup script for all users
RUN echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

# Set the default command
CMD ["bash"]

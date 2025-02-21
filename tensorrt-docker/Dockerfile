# Use the NVIDIA CUDA 11.8 base image
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04


# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TENSORRT_VERSION=8.5.2.2 
ENV CUDNN_VERSION=8.9.7 
ENV CUDA_VERSION=11.8 
ENV TENSORRT_DIR=/usr/local/TensorRT-${TENSORRT_VERSION}

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

RUN add-apt-repository universe
RUN apt update && apt install curl gnupg lsb-release

# Add ROS 2 GPG key and repository
RUN apt update && apt install -y curl  
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | apt-key add -  
RUN echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list  

# Install ROS 2 humble and essential tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ros-humble-desktop \
        python3-rosdep \
        python3-colcon-common-extensions \
        ros-humble-cv-bridge \
        ros-dev-tools \
        git \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init && \
    rosdep update


# Source ROS 2 setup script in all shell sessions
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc

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
    python3 -m pip install ${TENSORRT_DIR}/python/tensorrt-8.5.2.2-cp310-none-linux_x86_64.whl && \
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
    apt update && \
    apt install git && \
    python3 -m pip install git+https://github.com/catkin/catkin_tools.git && \
    pip install ipython && \
    apt-get install -y libxcb-xinerama0


    

# #Vam dependencies
# RUN apt update && \
#     apt install libsdl2-2.0-0 libsdl2-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev && \
#     apt install ros-noetic-sbg-driver && \
#     apt-get install ros-noetic-rosserial && \
#     apt-get install ros-noetic-rosserial-arduino

# # FSSIM dependencies
# RUN apt-get install && \
#     apt install python3-catkin-tools && \
#     apt install ibpcl-dev && \
#     apt install python3-pip

# # Install ROS Packages
# RUN apt-get install \
#     ros-noetic-gazebo-msgs \
#     ros-noetic-gazebo-ros \
#     ros-noetic-pcl-ros \
#     ros-noetic-camera-info-manager \
#     ros-noetic-hector-gazebo \
#     ros-noetic-velodyne-simulator \
#     ros-noetic-joy
  

RUN pip3 install shapely

# Source ROS 2 setup script in all shell sessions
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc

# Set the default command
CMD ["bash"]

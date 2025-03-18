# Dependencies

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
- **python3-colcon-common-extensions**: A metapackage for colcon, the recommended build tool for ROS 2.

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

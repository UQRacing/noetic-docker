# ROS2 Humble Docker
For those who don't have access to a GPU, please clone the following repo and follow the guide on UQ Racing Wiki for instructions: https://wikiv2.uqcloud.net/books/new-member-resources/page/getting-started-in-the-software-team

## Dependencies 
### General
- wget: allows for fetching of additional resources from the internet during the image build process
- lsb_release: a lightweight utility that provides key information about the Linux distribution. It is used to dynamically obtain the Ubuntu codename (via lsb_release -cs) which is then inserted into the ROS 2 repository configuration. This ensures that when you add the ROS 2 APT repository, it automatically targets the correct version of Ubuntu. 
- gnupg2: a tool for secure communication and data storage. In the context of this Dockerfile, it's used to manage and verify GPG keys. Specifically, it enables you to securely add the ROS 2 repository's signing key, which ensures that the packages you install from that repository are authentic and haven't been tampered with. This step is crucial for maintaining the security and integrity of your container's software environment.
- curl: a command-line tool used for transferring data from or to a server using various protocols (HTTP, HTTPS, FTP, etc.). In this Dockerfile, curl is essential for securely downloading the ROS 2 repository key. Having curl installed in the Docker image makes it possible to automate the secure retrieval of external resources, which is critical for maintaining the integrity and security of the software environment. 
- python3-pip: the package manager for Python 3 which allows easy installation, upgrading and management of Python libraries and dependencies from the Python Package Index (PyPI). It ensures the same version of packages and any extra dependencies of packages are installed. 
- python3-dev: a development package for Python 3 that provides the header files and static libraries necessary for compiling Python modules written in C or C++. In Docker building, it is important as many python packages include native C/C++ extensions that require compilation during installation which python3-dev provides necessary files for.
- locales: a package that provides the data and tools required to configure and generate locale settings on a Linux system. Setting the locale to en_US.UTF-8 properly handles UTF-8 text encoding. For tools and libraries like ROS2 this helps avoid potential errors or warnings during package installations and runtime. 
- software-properties-common: an Ubuntu package that provides a set of tools for managing software sources. In the Dockerfile, add-apt-repository universe from this library is used to enable the Universe repository (a repository that contains a wider range of software packages that might not be available in the default repositories) on Ubuntu.  It also allows for easy add, remove and management of third-part software sources (such as ROS 2); and helps maintain a consistent environment. 
-  build-essential: a meta-package for Ubuntu (and other Debian-based systems) that installs the core development tools necessary to compile software. This includes; compilers such as gcc and g++; Make for build automation with Makefiles; and other essential utilities and header files required for build. 
- git: for use of version control within the team and access of open-source software.  

### Very Accurate Point Cloud Estimation (VAPE2)
- 
### ConeNet 
- 
### Vehicle Actuation Module (VAM) 
- 
### EUFS Simulator
- 

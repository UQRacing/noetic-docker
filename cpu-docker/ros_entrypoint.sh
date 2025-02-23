#!/bin/bash
set -e

# Source ROS 2 setup script
source /opt/ros/galactic/setup.bash

# Execute the command passed to the container
exec "$@"

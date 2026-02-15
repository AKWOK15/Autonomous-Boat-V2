FROM arm64v8/ros:melodic-ros-base

WORKDIR /catkin_ws

# Install system dependencies INCLUDING pip
RUN apt-get update && apt-get install -y \
    git \
    python-pip \
    python-setuptools \
    python-wheel \
    python-catkin-tools \
    ros-melodic-tf \
    ros-melodic-tf2 \
    ros-melodic-tf2-ros \
    ros-melodic-tf2-geometry-msgs \
    ros-melodic-geometry-msgs \
    ros-melodic-sensor-msgs \
    ros-melodic-std-msgs \
    ros-melodic-nav-msgs \
    ros-melodic-visualization-msgs \
    ros-melodic-pcl-ros \
    ros-melodic-pcl-conversions \
    ros-melodic-roscpp \
    ros-melodic-message-generation \
    ros-melodic-message-runtime \
    ros-melodic-rviz \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to latest Python 2.7 compatible version
RUN pip2 install --upgrade pip setuptools wheel

# Now install the RPLidar package
RUN pip2 install rplidar-roboticia



# # Source ROS setup in bashrc
# RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
#     echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

CMD ["/bin/bash"]
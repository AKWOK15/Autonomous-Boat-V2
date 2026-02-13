# Start from ROS Melodic base image, has everything configured 
FROM arm64v8/ros:melodic-ros-base
# Set the working directory to the catkin workspace, the root where I run commmands 

# COPY . .

# Install any additional dependencies
# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
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
    && rm -rf /var/lib/apt/lists/*


WORKDIR /catkin_ws

# Clone the datmo repository into src
RUN mkdir -p /catkin_ws/src && \
    cd /catkin_ws/src && \
    git clone https://github.com/kostaskonkk/datmo.git

# Install ROS dependencies for the package
RUN apt-get update && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y && \
    rm -rf /var/lib/apt/lists/*

# Build the workspace
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
    catkin_make"

# Source ROS setup in bashrc for convenience
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
    echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

# Default command
CMD ["/bin/bash"]
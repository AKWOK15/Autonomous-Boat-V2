cmake_minimum_required(VERSION 3.0.2)
project(launch_pkg)

find_package(catkin REQUIRED)

catkin_package()

# ONLY this - install launch files
#Use install because when deploying to a robot, only copy install package, so new robot won't be able to find launch files under src
install(DIRECTORY launch/
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
)
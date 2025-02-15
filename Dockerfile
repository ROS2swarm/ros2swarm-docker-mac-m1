FROM dorowu/ubuntu-desktop-lxde-vnc:focal-arm64

RUN apt-get update && RTI_NC_LICENSE_ACCEPTED=yes apt-get install -y \
	wget 

WORKDIR /home

RUN wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy.sh
RUN chmod 755 ./install_ros2_foxy.sh
RUN bash ./install_ros2_foxy.sh

RUN apt-get update && RTI_NC_LICENSE_ACCEPTED=yes apt-get install -y \
	ros-foxy-gazebo-* \
	ros-foxy-cartographer \
	ros-foxy-cartographer-ros \
	ros-foxy-navigation2 \
	ros-foxy-nav2-bringup \
	ros-foxy-dynamixel-sdk \
	ros-foxy-turtlebot3-gazebo \ 
 	libudev-dev \
	libxml2-dev \ 
	git \ 
	ros-foxy-diagnostic-updater \
	ros-foxy-xacro \
	ros-foxy-tf-transformations \ 
	ros-foxy-robot-state-publisher \ 
	nano \
	python3-pip

RUN pip3 install transforms3d  

RUN bash -c "source /opt/ros/foxy/setup.bash" && \ 
    mkdir -p colcon_ws/src && \
    cd colcon_ws/src && \
    git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git && \ 
    cd turtlebot3_msgs && \ 
    git checkout cf5c56be94b335b1d2c9817bd2dcaceec21ccc68 && \
    cd .. && \
    git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git && \ 
    cd turtlebot3 && \
    git checkout 8237b796ea1571033bf3230fbc78d1143968ddd1 && \
    cd .. && \ 
    git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
    cd turtlebot3_simulations && \ 
    git checkout f5d86bbeb614f46a176f47b3697c85a8a9b989f9 && \ 
    cd .. && \ 
    cd .. && \ 
    bash -c "source /opt/ros/foxy/setup.bash && colcon build --symlink-install"  


RUN cd /home/colcon_ws && \ 
    bash -c "source /opt/ros/foxy/setup.bash" && \ 
    git clone https://github.com/jeguzzi/ros-aseba.git -b ros2 --recurse-submodules src/ros-aseba && \
    bash -c "source /opt/ros/foxy/setup.bash && colcon build --symlink-install" 

RUN cd /home/colcon_ws && \ 
    bash -c "source /opt/ros/foxy/setup.bash" && \ 
    git clone https://github.com/ROS2swarm/thymio_description.git src/thymio_description && \
    bash -c "source /opt/ros/foxy/setup.bash && colcon build --symlink-install" 

COPY ./bashrc /root/.bashrc



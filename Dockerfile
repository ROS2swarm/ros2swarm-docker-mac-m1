FROM dorowu/ubuntu-desktop-lxde-vnc:focal-arm64

RUN apt-get update && RTI_NC_LICENSE_ACCEPTED=yes apt-get install -y \
	wget 

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
	ros-foxy-turtlebot3-msgs \
	ros-foxy-turtlebot3 \
	ros-foxy-turtlebot3-gazebo 

RUN echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
RUN bash -c "source ~/.bashrc" 

RUN bash -c "source /opt/ros/foxy/setup.bash" && \ 
    mkdir -p colcon_ws/src && \
    cd colcon_ws/src && \
    git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
	cd .. && \ 
    bash -c "source /opt/ros/foxy/setup.bash && colcon build --symlink-install"

RUN bash -c "source ~/.bashrc" 

COPY ./bashrc /root/.bashrc

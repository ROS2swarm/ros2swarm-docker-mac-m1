Docker for using ROS 2 foxy and Gazebo on MacBook with ARM architecture 

Based on: https://github.com/fcwu/docker-ubuntu-vnc-desktop 

1) docker build -t myros2 . 
2) docker run -p 6080:80 -v path/on/your/computer/to/ROS2swarm:/home/ROS2swarm myros2
3) Access via browser: http://127.0.0.1:6080/ 
4) open Terminal
5) cd ../home 
6) colcon build --symlink-install 
7) source ~/.bashrc
8) bash ROS2swarm/start_simulation.sh

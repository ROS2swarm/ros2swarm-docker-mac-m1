Docker for using ROS 2 foxy and Gazebo on MacBooks with ARM architecture 

Based on: https://github.com/fcwu/docker-ubuntu-vnc-desktop 

1) docker build -t myros2 . 
2) docker run -p 6080:80 -v path/on/your/computer/to/ROS2swarm:/home/ROS2swarm myros2
3) Access via browser: http://127.0.0.1:6080/ 
4) open Terminal
5) cd ../home/colcon_ws 
6) colcon build --symlink-install 
7) source ~/.bashrc
8) cd ../ROS2swarm
9) bash start_simulation.sh

The Docker already installs all packages for simulating the TurtleBot3 and the Thymio II robots. 

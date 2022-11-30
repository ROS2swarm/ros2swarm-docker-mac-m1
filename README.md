Docker for using ROS 2 and Gazebo on MacBook with ARM architecture 

Based on: https://github.com/fcwu/docker-ubuntu-vnc-desktop 

1) docker build -t myros2 . 
2) docker run -p 6080:80 -v /dev/shm:/dev/shm myros2
3) Access via browser: http://127.0.0.1:6080/ 

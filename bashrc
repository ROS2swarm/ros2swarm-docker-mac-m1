source /home/colcon_ws/install/setup.bash
source ./install/setup.bash 
export ROS_DOMAIN_ID=30 #TURTLEBOT3
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/home/colcon_ws/src/turtlebot3_simulations/turtlebot3_gazebo/models:/home/colcon_ws/src/thymio_description
export TURTLEBOT3_MODEL=waffle_pi 

FROM ros:kinetic-perception

COPY Onboard-SDK /root/Onboard-SDK/

RUN mkdir -p /root/Onboard-SDK/build && cd /root/Onboard-SDK/build && cmake ../ && make install

RUN mkdir -p /root/ws/src && cd /root/ws/src && /ros_entrypoint.sh catkin_init_workspace

COPY Onboard-SDK-ROS /root/ws/src/

RUN cd /root/ws && /ros_entrypoint.sh catkin_make

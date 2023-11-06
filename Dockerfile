 

FROM ubuntu:latest

ENV development_toolchain="ubuntu_sim_nuttx.sh"
ENV GROUP="dialout"

	#RUN groupadd -f ${GROUP}
	#RUN usermod -aG ${GROUP} $USER
	# ПЕРЕЛОГИН открыть новую консоль оьновить
	#RUN gnome-terminal

COPY ${development_toolchain} /${development_toolchain}
RUN chmod +x ${development_toolchain}
ENTRYPOINT ["sh", /${development_toolchain}]

RUN apt update
RUN apt install -y git
RUN apt install make
RUN git clone https://github.com/PX4/Firmware.git
RUN cd ./Firmware
RUN make check_px4_sitl_default
CMD jmavsim  
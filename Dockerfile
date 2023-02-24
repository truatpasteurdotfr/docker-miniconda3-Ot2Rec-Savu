From continuumio/miniconda3
# update conda and the OS
RUN	conda update conda && \
	conda upgrade --all -y && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -y autoremove && \
	DEBIAN_FRONTEND=noninteractive apt-get -y clean autoclean

RUN	cd /opt && \
	git clone https://github.com/DiamondLightSource/Savu.git && \
	cd Savu && \
	conda create --name o2r_savu --file install/savu_lite37/spec-savu_lite_latest.txt && \
	conda activate o2r_savu && \
	python setup.py install && \
	cd .. && \
	git clone -b savu-lite https://github.com/rosalindfranklininstitute/Ot2Rec.git && \
	cd Ot2Rec && \
	pip install -e .

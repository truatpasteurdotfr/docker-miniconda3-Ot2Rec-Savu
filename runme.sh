#!/bin/sh
# top level where we will install miniconda and Ot2Rec/Savu
DEST=${HOME}/ot2rec
PATH=/sbin:/usr/sbin:/usr/bin:/bin

set -e
set -u

tbindir=$(mktemp -d)
trap "rm -rf \"$tbindir\"" TERM INT EXIT

for _req in curl bzip2 git
do
if [ ! `command -v ${_req}` ]; then
echo ${_req} missing
exit 1
fi
done

[ -d ${DEST} ] || mkdir -p ${DEST}
# install miniconda3 in ${DEST}
cd ${tbindir} && \
curl -qsSLkO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&& bash Miniconda3-latest-Linux-x86_64.sh -b -p ${DEST}/miniconda3 \
&& rm Miniconda3-latest-Linux-x86_64.sh

PATH=${DEST}/miniconda3/bin:$PATH
export PATH

# update conda and the OS
conda update conda -y && \
	conda upgrade --all -y 

# install Ot2Rec/Savu
eval "$(conda shell.bash hook)" && \
	cd ${DEST} && \
	git clone https://github.com/DiamondLightSource/Savu.git && \
	cd Savu && \
	conda create --name o2r_savu --file install/savu_lite37/spec-savu_lite_latest.txt && \
	conda activate o2r_savu && \
	python3 setup.py install && \
	cd .. && \
	git clone -b savu-lite https://github.com/rosalindfranklininstitute/Ot2Rec.git && \
	cd Ot2Rec && \
	python3 -m pip install -e .

echo "finished!"
echo "export PATH=${DEST}/miniconda3/bin:$PATH"
echo 'eval "$(conda shell.bash hook) && conda activate o2r_savu'

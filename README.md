[![Docker build](https://github.com/truatpasteurdotfr/docker-miniconda3-Ot2Rec-Savu/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/truatpasteurdotfr/docker-miniconda3-Ot2Rec-Savu/actions/workflows/docker-publish.yml)


## installing a Ot2Rec/Savu docker image (https://github.com/rosalindfranklininstitute/Ot2Rec/issues/88)

CI produced registry image at ghcr.io/truatpasteurdotfr/docker-miniconda3-Ot2Rec-Savu
## docker usage
```
docker pull  ghcr.io/truatpasteurdotfr/docker-miniconda3-ot2rec-savu:main
```
## singularity conversion if you have singularityCE or apptainer installed
```
singularity build docker-miniconda3-ot2rec-savu.sif  docker://ghcr.io/truatpasteurdotfr/docker-miniconda3-ot2rec-savu:main
```
Running with:
```
singularity exec -B /run -B /pasteur docker-miniconda3-ot2rec-savu.sif bash -c 'eval "$(conda shell.bash hook)"; conda activate o2r_savu; o2r.new'`
libGL error: MESA-LOADER: failed to open swrast: /usr/lib/dri/swrast_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/x86_64-linux-gnu/dri:\$${ORIGIN}/dri:/usr/lib/dri)
libGL error: failed to load driver: swrast
```
-> Harmless warning (imho)

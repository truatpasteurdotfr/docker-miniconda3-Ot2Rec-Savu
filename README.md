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


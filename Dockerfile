# NAME: dclong/jupyterhub-julia
FROM dclong/jupyterhub
# GIT: https://github.com/legendu-net/docker-jupyterhub.git

RUN apt-get -y update \
    && apt-get -y install julia \
    && /scripts/sys/purge_cache.sh

# install IJulia  
ENV JUPYTER=/usr/local/bin/jupyter
RUN julia -e 'empty!(DEPOT_PATH); push!(DEPOT_PATH, "/usr/share/julia"); using Pkg; Pkg.add("IJulia")' \
    && cp -r /root/.local/share/jupyter/kernels/julia-* /usr/local/share/jupyter/kernels/ \
    && chmod -R +rx /usr/share/julia/ \
    && chmod -R +rx /usr/local/share/jupyter/kernels/julia-*/

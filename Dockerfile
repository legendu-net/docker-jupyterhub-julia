FROM dclong/jupyterhub:18.10

RUN apt-get update \
    && apt-get install -y julia \
    && apt-get autoremove -y \
    && apt-get autoclean -y

# install IJulia  
ENV JUPYTER=/usr/local/bin/jupyter
RUN julia -e 'empty!(DEPOT_PATH); push!(DEPOT_PATH, "/usr/share/julia"); using Pkg; Pkg.add("IJulia")' \
    && cp -r /root/.local/share/jupyter/kernels/julia-* /usr/local/share/jupyter/kernels/ \
    && chmod -R +rx /usr/share/julia/ \
    && chmod -R +rx /usr/local/share/jupyter/kernels/julia-*/

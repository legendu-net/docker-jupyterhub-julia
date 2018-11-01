FROM dclong/jupyterhub:18.10

ENV JUPYTER=/usr/local/bin/jupyter

RUN apt-get update \
    && apt-get install -y julia \
    && apt-get autoremove -y \
    && apt-get autoclean -y

# install IJulia  
RUN julia -e 'using Pkg; Pkg.add("IJulia")'

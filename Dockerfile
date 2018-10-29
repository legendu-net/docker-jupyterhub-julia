FROM dclong/jupyterhub

RUN apt-get update \
    && apt-get install -y julia \
    && apt-get autoremove -y \
    && apt-get autoclean -y
FROM dclong/jupyterhub:18.10

RUN apt-get update \
    && apt-get install -y julia \
    && apt-get autoremove -y \
    && apt-get autoclean -y

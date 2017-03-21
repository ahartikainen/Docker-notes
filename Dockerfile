FROM ubuntu:latest

MAINTAINER Ari Hartikainen <ari.hartikainen@aalto.fi>

# Mostly copy from https://github.com/ContinuumIO/docker-images/blob/master/miniconda/Dockerfile
# Added common PyData tools + PyStan and SimPEG

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Create folder later
ENV PATH /opt/conda/bin:$PATH

# Minimize memory usage with one RUN command
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion gcc gfortran g++ vim nano && \
    echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean && \
    conda update conda -y && \
    conda update --all && \
    conda install -y numpy scipy pandas xarray dask matplotlib \
                     bokeh datashader seaborn pillow openpyxl \
                     xlwt xlrd bitarray jupyter notebook ipython \
                     h5py hdf5 && \
    pip --no-cache-dir install SimPEG pystan python-docx discretize && \
    conda clean -y -a

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]

FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-dev \
    curl \
    ca-certificates \
    libglib2.0.0 \
    libsm6 \
    libxext6 \
    build-essential && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# python package
RUN pip --no-cache-dir install \
    jupyter \
    matplotlib \
    keras \
    tensorflow \
    scikit-learn \
    numpy \
    h5py \
    pandas \
    pillow \
    opencv-python

RUN apt-get update && apt-get install -y libopencv-dev



# Set up notebook config
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly: https://github.com/ipython/ipython/issues/7062
COPY run_jupyter.sh /root/

# Expose Ports for TensorBoard (6006), Ipython (8888)
EXPOSE 6006 8888

WORKDIR "/root"
CMD ["/bin/bash"]
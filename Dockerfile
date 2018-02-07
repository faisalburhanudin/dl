FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y python3 python3-dev curl build-essential&& \
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
    pillow

CMD ["sh", "-c", "jupyter notebook --allow-root"]

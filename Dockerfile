# Pull base image
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ARG src=plink2_linux_x86_64_20240820.zip

RUN apt-get update && apt-get install -y unzip wget \
    && wget https://s3.amazonaws.com/plink2-assets/alpha5/${src} \
    && unzip -q ${src} -d /usr/local/bin \
    && rm ${src} \
    && apt-get autoremove -y unzip wget \
    && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["plink2"]
CMD ["--help"]

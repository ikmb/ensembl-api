FROM nfcore/base
LABEL authors="Marc Hoeppner" \
      description="Docker image containing the EnsEMBL PERL Apis"

ARG version=105

COPY environment.yml /
COPY install_api.sh /opt/

ENV PATH="/opt/conda/envs/ensembl-api/bin:$PATH"

RUN apt-get -y update && apt-get -y install wget unzip
RUN conda env create -f /environment.yml && conda clean -a

RUN mkdir -p /opt/ensembl/$version
RUN cd /opt/ensembl/$version && bash /opt/install_api.sh $version
RUN cd /opt/ensembl/$version && wget https://github.com/bioperl/bioperl-live/archive/release-1-6-924.zip \
	&& unzip release-1-6-924.zip && mv bioperl* bioperl-live

ENV PERL5LIB=/opt/ensembl/$version/ensembl/modules:/opt/ensembl/$version/ensembl-compara/modules:/opt/ensembl/$version/ensembl-variation/modules:/opt/ensembl/$version/ensembl-funcgen/modules:$PERL5LIB:/opt/ensembl/$version/bioperl-live:$PERL5LIB


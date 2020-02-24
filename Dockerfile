FROM nfcore/base
LABEL authors="Marc Hoeppner" \
      description="Docker image containing the EnsEMBL PERL Apis"

ARG version=99

COPY environment.yml /
COPY install_api.sh /opt/

RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/ensembl-api/bin:$PATH
ENV PERL5LIB /opt/ensembl/$version/ensembl/modules:/opt/ensembl/$version/ensembl-compara/modules:/opt/ensembl/$version/ensembl-variation/modules:/opt/ensembl/$version/ensembl-funcgen/modules:$PERL5LIB

RUN mkdir -p /opt/ensembl/$version
RUN cd /opt/ensembl/$version && bash /opt/install_api.sh $version

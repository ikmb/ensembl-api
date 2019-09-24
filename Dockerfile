FROM nfcore/base
LABEL authors="Marc Hoeppner" \
      description="Docker image containing the EnsEMBL PERL Apis"

COPY environment.yml /
COPY install_api.sh /opt/
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/ensembl-api/bin:$PATH
ENV PERL5LIB /opt/ensembl/97/ensembl/modules:/opt/ensembl/97/ensembl-compara/modules:/opt/ensembl/97/ensembl-variation/modules:/opt/ensembl/97/ensembl-funcgen/modules:$PERL5LIB

RUN mkdir -p /opt/ensembl/97
RUN cd /opt/ensembl/97 && bash /opt/install_api.sh 97

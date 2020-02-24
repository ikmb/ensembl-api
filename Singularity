Bootstrap:docker
From:nfcore/base

%labels
    MAINTAINER Marc Hoeppner <m.hoeppner@ikmb.uni-kiel.de>
    DESCRIPTION Singularity image containing all requirements for the exome-seq pipeline
    VERSION 1.0

%environment
    PATH=/opt/conda/envs/ensembl-api/bin:$PATH
    export PATH
    PERL5LIB /opt/ensembl/99/ensembl/modules:/opt/ensembl/99/ensembl-compara/modules:/opt/ensembl/99/ensembl-variation/modules:/opt/ensembl/99/ensembl-funcgen/modules:$PERL5LIB
    export PERL5LIB
%files
    environment.yml /
    install_api.sh /opt
%post

    /opt/conda/bin/conda env create -f /environment.yml
    /opt/conda/bin/conda clean -a

    mkdir -p /ifs
    apt-get -y install procps


    mkdir -p /opt/ensembl/99
    cd /opt/ensembl/99 && bash /opt/install_api.sh 99

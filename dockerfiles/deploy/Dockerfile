FROM ghcr.io/itf-solutions/github-actions-runner:base

RUN sudo apt-get update -qq \
    && sudo apt-get install -y --no-install-recommends \
        python3-pip \
        docker-ce-cli \
        docker-compose-plugin \
    && sudo apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --quiet --break-system-packages paramiko pyyaml

ENTRYPOINT ["/home/runner/run.sh"]

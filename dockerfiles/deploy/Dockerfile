FROM ghcr.io/itf-solutions/github-actions-runner-base:latest

RUN sudo apt-get update -qq \
    && sudo apt-get install -y --no-install-recommends \
        python3-pip \
        docker.io \
        docker-compose-v2 \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

RUN pip install --quiet --break-system-packages paramiko pyyaml

RUN curl -1sLf 'https://artifacts-cli.infisical.com/setup.deb.sh' | sudo bash \
    && sudo apt-get install -y --no-install-recommends infisical \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/home/runner/run.sh"]
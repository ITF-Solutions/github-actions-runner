FROM ghcr.io/actions/actions-runner:latest

RUN echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4

ENTRYPOINT ["/home/runner/run.sh"]

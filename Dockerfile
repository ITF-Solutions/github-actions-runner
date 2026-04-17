FROM ghcr.io/actions/actions-runner:latest

# Force apt to use IPv4. Canonical's IPv6 mirror (archive.ubuntu.com AAAA) resolves to a
# US-only PoP with ~44% packet loss from Australia. IPv4 resolves to the same US server
# but via a clean path. Revisit if Canonical improves IPv6 mirror coverage in APAC.
RUN echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4

ENTRYPOINT ["/home/runner/run.sh"]

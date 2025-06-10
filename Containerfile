FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf5 install -y 'dnf5-command(config-manager)'
RUN dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
RUN dnf install -y \
  @server-product \
  @cloud-server \
  @guest-agents \
  firewalld \
  tailscale && \
  dnf clean all
RUN systemctl enable \
  firewalld.service \
  tailscaled.service
RUN bootc container lint

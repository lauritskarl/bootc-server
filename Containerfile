FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf5 install -y 'dnf5-command(config-manager)'
RUN dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
RUN dnf install -y \
  @server-product \
  @container-management \
  cockpit-podman \
  firewalld \
  tailscale \
  tmux \
  bash-completion \
  cockpit \
  cockpit-networkmanager \
  cockpit-storaged \
  cockpit-packagekit \
  cockpit-selinux \
  cockpit-files \
  cockpit-session-recording \
  cockpit-sosreport \
  pcp \
  python3-pcp \
  tuned \
  caddy
RUN dnf clean all
RUN systemctl enable \
  sshd.service \
  firewalld.service \
  tailscaled.service \
  podman.socket \
  podman-restart.service \
  podman-auto-update.timer \
  caddy.service \
  beszel.service \
  beszel-agent.service \
  uptime-kuma.service \
  glance.service \
  ntfy.service \
  gitea.service \
  searxng.service \
  freshrss.service \
  it-tools.service \
  vikunja.service \
  memos.service \
  wallos.service
RUN bootc container lint

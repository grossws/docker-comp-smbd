FROM grossws/centos:7

LABEL org.label-schema.name="CentOS 7 with tianon/gosu, bash helpers & locales" \
  org.label-schema.vcs-url="https://github.com/grossws/docker-comp-smbd" \
  maintainer="Konstantin Gribov <grossws@gmail.com>"

EXPOSE 445
VOLUME ["/data"]

RUN set -o errexit; set -o pipefail; source /root/.bash_helpers; \
  yumi samba ; \
  log "Adding rw user (uid=1000)"; \
  useradd -s /bin/nologin -u 1000 -g users rw; \
  echo -e "test\ntest" | smbpasswd -a rw; \
  smbpasswd -e rw; \
  log "Adding ro user (uid=1001)"; \
  useradd -s /bin/nologin -u 1001 -g users ro; \
  echo -e "test\ntest" | smbpasswd -a ro; \
  smbpasswd -e ro

ADD entrypoint.sh smb.conf /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["smbd"]

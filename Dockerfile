FROM photon:3.0

ADD  log_10_seconds.sh /
WORKDIR /
ENTRYPOINT ["/log_10_seconds.sh"]

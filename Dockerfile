FROM alpine

RUN apk add openssh git

WORKDIR /

# -D flag avoids password generation
# -s flag changes user's shell
RUN mkdir /keys \
  && adduser -D -s /usr/bin/git-shell git \
  && mkdir /home/git/.ssh \
  && echo git:12345 | chpasswd

# This is a login shell for SSH accounts to provide restricted Git access.
# It permits execution only of server-side Git commands implementing the
# pull/push functionality, plus custom commands present in a subdirectory
# named git-shell-commands in the user’s home directory.
# More info: https://git-scm.com/docs/git-shell
RUN mkdir /home/git/git-shell-commands
COPY no-interactive-login /home/git/git-shell-commands/no-interactive-login
COPY create-wrapper /home/git/git-shell-commands/create-wrapper

# sshd_config file is edited for enable access key and disable access password
COPY sshd_config /etc/ssh/sshd_config
COPY start start

EXPOSE 22

CMD ["sh", "start"]

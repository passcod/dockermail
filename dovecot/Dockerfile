#> Dockermail - MTA and IMAP
#? https://github.com/passcod/dockermail
FROM passcod/archlinux
EXPOSE 25 587 143
RUN pacman -S --noconfirm --needed dovecot postfix supervisor
CMD ["/usr/bin/supervisord"]
ADD files/ /

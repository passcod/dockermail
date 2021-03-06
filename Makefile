all: mail-base dovecot rainloop

.PHONY: mail-base dovecot rainloop run-dovecot run-rainloop

mail-base: 
	cd mail-base; docker build -t mail-base .

dovecot: mail-base
	cd dovecot; docker build -t dovecot:2.1.7 .

rainloop: mail-base
	cd rainloop; docker build -t rainloop:1.6.1 .

mailpile: mail-base
	cd mailpile; docker build -t mailpile:0.1.0 .

run-dovecot:
	docker run -d -p 0.0.0.0:25:25 -p 0.0.0.0:587:587 -p 0.0.0.0:143:143 -v /srv/vmail:/srv/vmail dovecot:2.1.7

run-rainloop:
	docker run -d -p 127.0.0.1:33100:80 rainloop:1.6.1

run-mailpile:
	docker run -d -p 127.0.0.1:33411:33411 mailpile:0.1.0

run-all: run-dovecot run-rainloop

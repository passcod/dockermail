FROM mail-base

RUN apt-get install -y --force-yes git

# shallow clone of release tag
RUN git clone --branch v1.6.1.625 --depth=1 https://github.com/RainLoop/rainloop-webmail.git /var/www

RUN apt-get install -y --force-yes apache2 php5 libapache2-mod-php5 php5-curl php5-json

# Force initialization of data directories triggered at first program start
RUN php /var/www/index.php

RUN chown -R www-data:www-data /var/www

ADD ./create_config.sh /create_config.sh

RUN bash ./create_config.sh

ENTRYPOINT apachectl -DFOREGROUND

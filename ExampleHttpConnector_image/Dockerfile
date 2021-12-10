FROM ubuntu:20.04 as extract

# See https://trino.io/docs/current/installation/deployment.html for trino deps
RUN apt-get update -y
RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y python
RUN apt-get install -y python3
RUN apt-get install -y curl

# Install Hive
# mkdir apache-hive-bin
# RUN -O curl apache... | tar -C apache-hive-bin --strip-components=2 -xvzf - apache-hive-2.3.9-bin/bin

#################
# Install Trino #
#################
RUN mkdir /usr/local/trino
WORKDIR /usr/local/trino
RUN curl -LO https://repo1.maven.org/maven2/io/trino/trino-server/365/trino-server-365.tar.gz
# RUN curl -LO https://repo1.maven.org/maven2/io/trino/trino-server/365/trino-server-365.tar.gz \
#     | tar -C /usr/local/trino --strip-components=1 -xvz \
#   && chmod +x /usr/local/trino/bin/launcher \
RUN tar --strip-components=1 -xvzf ./trino-server-365.tar.gz
RUN rm ./trino-server-365.tar.gz
RUN chmod +x /usr/local/trino/bin/launcher

# Add link to trino/bin/launcher to $PATH
ADD ./trino-launcher /usr/local/bin
# Add trino config to image. Trino expects its config files in $INSTALL_PATH/etc by default
# To change config dir: trino-launcher run --etc-dir=/usr/local/trino/config-or-whatever
ADD ./trino-config/* /usr/local/trino/etc/

CMD trino-launcher run 

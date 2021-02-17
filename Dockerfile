FROM openjdk:8-jre-alpine
MAINTAINER Bertrand Roussel <broussel@sierrawireless.com>

RUN mkdir -p /opt/leshan
RUN adduser -S -h /opt/leshan -s /sbin/nologin leshan

ENV VERSION 0.1.11-M14
ENV BASE_URL https://repo1.maven.org/maven2/org/eclipse/leshan

ADD $BASE_URL/leshan-server-demo/$VERSION/leshan-server-demo-$VERSION-jar-with-dependencies.jar /opt/leshan/
ADD $BASE_URL/leshan-bsserver-demo/$VERSION/leshan-bsserver-demo-$VERSION-jar-with-dependencies.jar /opt/leshan/
ADD $BASE_URL/leshan-client-demo/$VERSION/leshan-client-demo-$VERSION-jar-with-dependencies.jar /opt/leshan/

EXPOSE 5683 5684 8080

ADD start.sh /opt/leshan/

RUN chown -R leshan:nogroup /opt/leshan
USER leshan
WORKDIR /opt/leshan
ENTRYPOINT ["/opt/leshan/start.sh"]

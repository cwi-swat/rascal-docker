# Stable Rascal image 
FROM maven:3.6.0-jdk-8 as mavenBuild

ARG RASCAL_USER=guest
ARG RASCAL_UID=1000
ENV USER ${RASCAL_USER}
ENV RASCAL_UID ${RASCAL_UID}
ENV HOME /home/${RASCAL_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${RASCAL_UID} \
    ${RASCAL_USER}

USER guest

WORKDIR $HOME

RUN mkdir example
WORKDIR example

RUN mkdir src
COPY src/HelloWorld.rsc src
COPY pom.xml .
RUN mkdir META-INF
COPY META-INF/RASCAL.MF META-INF/

WORKDIR $HOME
USER root
RUN chown -R guest *
RUN chgrp -R users *

USER guest
WORKDIR example
RUN mvn compile

CMD ["mvn", "rascal:console"]


ARG IMAGE=intersystems/iris-ml-community:2023.1.0.235.0
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY  src src
COPY module.xml module.xml
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly

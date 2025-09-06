FROM ubuntu:24.04
MAINTAINER PraveenKuber 
RUN apt-get update
RUN mkdir testData
RUN cd testData 

WORKDIR testData

RUN touch t1 t2 t3 
COPY testfile .
EXPOSE 8080

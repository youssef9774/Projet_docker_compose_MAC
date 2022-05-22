FROM python:latest

ADD client.py /client/

RUN apt-get update && apt-get install iputils-ping -y

WORKDIR /client/
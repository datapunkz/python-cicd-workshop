FROM python:3.7

RUN mkdir /opt/hello_world/
WORKDIR /opt/hello_world/

COPY requirements.txt .
COPY dist/hello_world /opt/hello_world/

EXPOSE 80

CMD [ "./hello_world" ]

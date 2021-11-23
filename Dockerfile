FROM alpine:latest

MAINTAINER Jeff Clough

RUN apk add --no-cache bash

# Make sure apt-get is up to date.
#RUN apt-get update && apt-get upgrade -y

# Make sure pip is up to date, and install some packages we need.
#RUN /usr/local/bin/python -m pip install --upgrade pip && pip install fastapi uvicorn

# Create the account we're our service will run as.
#RUN useradd -ms /bin/bash srv
#WORKDIR /home/srv

# Install some creature comforts for development purposes.
#RUN apt-get install less vim
#COPY srv/.*rc /home/root

ENTRYPOINT ["/bin/bash"]

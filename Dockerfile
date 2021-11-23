From python:3

MAINTAINER Jeff Clough

# Make sure apt-get is up to date.
RUN apt-get updte && apt-get upgrade -y

# Make sure pip is up to date, and install some packages we need.
RUN /usr/local/bin/python -m pip install --upgrade pip && pip install fastapi uvicorn

# Create the account we're our service will run as.
RUN useradd -ms /bin/bash srv

# Install some creature comforts for development purposes.
apt-get install less vim
copy srv/.*rc /home/root

ENTRYPOINT ["/bin/bash"]

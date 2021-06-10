
FROM ubuntu:latest

RUN apt update
RUN apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt-get install python3.8 python3-venv python3-virtualenv build-essential git  python3-pip -y

CMD bash mkdir /var/www/site
CMD bash cd /var/www/site

WORKDIR /var/www/site
RUN pip3 install Flask Flask-SQLAlchemy

RUN git clone https://github.com/iaroki/omo-devops-test-task.git /var/www/site

CMD python3 /var/www/site/app.py

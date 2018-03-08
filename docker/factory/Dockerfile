FROM python:3
MAINTAINER sean.carroll@epfl.ch

RUN apt-get update && apt-get install -y git python-pip python-dev
RUN pip install --upgrade pip
RUN git clone https://github.com/crowdAI/crowdAI-KIT-energy-challenge-job-factory.git

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN cp config.py.example config.py
EXPOSE "8080"
CMD python run.py && rqworker -c settings

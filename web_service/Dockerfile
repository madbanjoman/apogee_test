FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
WORKDIR /app
COPY app.py /app
COPY requirements.txt /app
RUN pip install -r /app/requirements.txt
ENTRYPOINT ["python3"]
CMD ["app.py"]

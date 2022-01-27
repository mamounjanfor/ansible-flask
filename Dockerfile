FROM python:3.6
MAINTAINER devopsbuddies "support@devopsbuddies.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["sample_flask.py"]

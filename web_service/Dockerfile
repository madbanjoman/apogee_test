FROM python:3-slim 
USER root
RUN adduser app --home /app && chown -R app /app
COPY --chown=app:app app.py /app
COPY --chown=app:app  requirements.txt /app
USER app
WORKDIR /app
RUN pip install -r /app/requirements.txt
ENTRYPOINT ["python3"]
CMD ["app.py"]

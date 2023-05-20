FROM python:3.7
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8000
CMD python3 -m venv venv
CMD source venv/bin/activate
CMD gunicorn -b 0.0.0.0:8000 app:app

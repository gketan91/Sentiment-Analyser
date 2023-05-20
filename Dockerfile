FROM python:3.7
WORKDIR /app
COPY requirements.txt /app/backend
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 8000
CMD python3 -m venv venv
CMD source venv/bin/activate
CMD gunicorn -b 0.0.0.0:8000 index:index

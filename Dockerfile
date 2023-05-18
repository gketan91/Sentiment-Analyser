FROM python:3.7
WORKDIR /app
RUN pip install flask
COPY . /app
EXPOSE 5000
CMD python /app/index.py runserver 0.0.0.0:5000

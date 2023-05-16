FROM python:3.7
WORKDIR /app
RUN pip install flask
COPY . /app
EXPOSE 8000
CMD ["python", "inde.py"]
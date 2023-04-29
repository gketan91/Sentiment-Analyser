FROM python
RUN pip install flask
WORKDIR /app
COPY . /app
EXPOSE 5000
ENTRYPOINT [ "python" , "index.py" ]
FROM python
RUN pip install flask
WORKDIR /app
COPY . /app
ENTRYPOINT [ "python" , "index.py" ]
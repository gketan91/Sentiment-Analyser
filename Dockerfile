FROM python
RUN pip install flask
WORKDIR /app
COPY . /app
EXPOSE 80
ENTRYPOINT [ "python" , "index.py" ]
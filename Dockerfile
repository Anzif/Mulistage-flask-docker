FROM alpine:3.8  As git

RUN mkdir /var/app/

WORKDIR /var/app/

RUN apk update && apk add git

RUN git clone https://github.com/Anzif/flaskapplive.git /var/app/



FROM python:3.6-alpine3.14

MAINTAINER Anzif M Azeez "anzifmazeez@gmail.com"

RUN mkdir /app

WORKDIR /app

COPY --from=git  /var/app/ .

RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python"]

CMD ["/app/app.py"]

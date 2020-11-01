FROM letfn/python

USER root

RUN apt-get update -y && apt-get install -y chrony

COPY service /service

ENTRYPOINT [ "/tini", "--", "/service" ]

CMD [ "-d" ]

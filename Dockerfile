FROM alvistack/chrony:3.2

COPY service /service

ENTRYPOINT [ "/service" ]

CMD ["chronyd", "-d" ]

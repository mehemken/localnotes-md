# Basic flask container

FROM blog-base:1

ADD /app /home/app
WORKDIR /home/app

VOLUME ./app /home/app

EXPOSE 5000

CMD ["gunicorn", "--config=gunicorn.py", "app:app"]

FROM python:3.12-alpine

ARG flask_debug=False

ENV FLASK_DEBUG $flask_debug
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

ADD . .

CMD ["python", "app.py"]

FROM python:3.10-slim

WORKDIR /app

COPY flask_app/ /app/

COPY models/vectorizer.pkl /app/models/vectorizer.pkl

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir python-dotenv

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

#local
CMD ["python", "app.py"]  

#Prod
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]
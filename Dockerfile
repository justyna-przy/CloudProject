FROM python:3

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /code/

RUN python manage.py collectstatic --noinput


EXPOSE 8000

ENV DJANGO_SETTINGS_MODULE=DjangoAuth.settings

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
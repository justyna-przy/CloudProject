# Use an official Python runtime as a parent image
FROM python:3

# Prevent Python from writing .pyc files to disc
ENV PYTHONDONTWRITEBYTECODE=1

# Prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file into the container
COPY requirements.txt /code/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /code
COPY . /code/
COPY .env /code/

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variables
ENV DJANGO_SETTINGS_MODULE=DjangoAuth.settings

# Run the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
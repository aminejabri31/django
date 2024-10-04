# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy Pipfile and Pipfile.lock to the container
COPY Pipfile Pipfile.lock ./

# Install pipenv
RUN pip install pipenv

# Install dependencies
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the project files
COPY mydjangoproject .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["pipenv", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]

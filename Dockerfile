# pull official base image
FROM python:3.11.2-slim-buster

# set working directory
WORKDIR /usr/src/app


# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update \
  && apt-get -y install netcat gcc \
  && apt-get clean

COPY poetry.lock pyproject.toml /usr/src/app/
# Install Poetry
RUN pip install poetry

# Install dependencies using Poetry
RUN poetry install --no-root --no-dev

# add app
COPY . .
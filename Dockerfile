# Get the basic stuff in there
FROM python:alpine AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apk add git git-lfs

# Run and monitor
FROM base AS dev
CMD ["mkdocs","serve","-a","0.0.0.0:80"]
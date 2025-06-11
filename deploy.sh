#!/bin/bash
docker login
docker build -t react-ecommerce-app
docker tag react-ecommerce-app:latest ravneeth123/react-ecommerce-app:latest
docker push ravneeth123/react-ecommerce-app:latest


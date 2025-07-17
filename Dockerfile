FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY build/ .
EXPOSE 80
CMD [&quot;nginx&quot;, &quot;-g&quot;, &quot;daemon off;&quot;]

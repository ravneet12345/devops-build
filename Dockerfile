# Use official Nginx image as base
FROM nginx:alpine

# Copy custom static website files into the nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]



 


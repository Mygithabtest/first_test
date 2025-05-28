# Simple test with nginx to verify deployment works
FROM nginx:alpine

# Create a simple index page
RUN echo '<h1>Hello from GitHub Actions POC!</h1><p>Java app deployment successful!</p><p>Version: BUILD_VERSION</p>' > /usr/share/nginx/html/index.html

# Change default port to 8080 to match your service
RUN sed -i 's/listen       80/listen       8080/' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
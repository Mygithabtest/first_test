
FROM nginx:alpine

RUN echo '<html><head><title>GitHub Actions POC Success</title></head><body style="font-family: Arial; text-align: center; margin-top: 100px;"><h1 style="color: green;">🎉 GitHub Actions POC Successful!</h1><h2>GitLab → GitHub Actions Migration</h2><p><strong>Pipeline Components Working:</strong></p><ul style="display: inline-block; text-align: left;"><li>✅ Java Build (Windows Self-hosted Runner)</li><li>✅ Docker Build & Push (GitHub Linux Runner)</li><li>✅ Kubernetes Deployment (Windows Self-hosted Runner)</li><li>✅ Helm Chart Deployment</li><li>✅ DockerHub Integration</li><li>✅ Resource Management</li></ul><p><strong>Image:</strong> teegawende/hello-java-app:BUILD_VERSION</p><p><strong>Namespace:</strong> azuredeploytest</p><p style="margin-top: 50px; color: #666;">Complete CI/CD pipeline demonstrated successfully!</p></body></html>' > /usr/share/nginx/html/index.html

RUN sed -i 's/listen       80/listen       8080/' /etc/nginx/conf.d/default.conf
RUN sed -i 's/listen  \[::\]:80/listen  [::]:8080/' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
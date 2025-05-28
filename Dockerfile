FROM alpine:latest

RUN apk add --no-cache python3

RUN echo 'import http.server' > /app.py && \
    echo 'import socketserver' >> /app.py && \
    echo 'PORT = 8080' >> /app.py && \
    echo 'class Handler(http.server.SimpleHTTPRequestHandler):' >> /app.py && \
    echo '    def do_GET(self):' >> /app.py && \
    echo '        self.send_response(200)' >> /app.py && \
    echo '        self.send_header("Content-type", "text/html")' >> /app.py && \
    echo '        self.end_headers()' >> /app.py && \
    echo '        html = "<h1>GitHub Actions POC Success!</h1><p>Complete CI/CD pipeline working!</p>"' >> /app.py && \
    echo '        self.wfile.write(html.encode())' >> /app.py && \
    echo 'with socketserver.TCPServer(("", PORT), Handler) as httpd:' >> /app.py && \
    echo '    print("Server running on port", PORT)' >> /app.py && \
    echo '    httpd.serve_forever()' >> /app.py

RUN addgroup -g 1001 appgroup && adduser -u 1001 -D appuser -G appgroup
USER appuser

EXPOSE 8080

CMD ["python3", "/app.py"]
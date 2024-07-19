The five Docker security practices are as follows:-
a) Use minimal base images: Start with a minimal base image like Alpine Linux to reduce the attack surface.
b) IRun Containers as Non-Root Users: By default, Docker containers run as root. Running containers as     non-root users reduces the risk of privilege escalation attacks.
c) Scan images for vulnerabilities: Use tools like Trivy or Clair to scan for known vulnerabilities.
d) Use multi-stage builds: Reduce image size and potential vulnerabilities by using multi-stage builds.
e) Never store secrets in Docker images: Use secret management solutions instead of hardcoding secrets.
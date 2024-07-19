# azure-security-and-cicd-task

Documenting information about the repo here.

## Repository Structure

- `part1-container-security/`: Solutions for Part 1 of the challenge
  - `docker/`: Docker security best practices and implementation
  - `kubernetes/`: Kubernetes security features and configuration
  - `iaas-security.md`: Explanation of IaaS and its security implications
- `part2-cicd-pipeline/`: Solutions for Part 2 of the challenge
  - `infrastructure/`: Terraform script for web server deployment
  - `.github/workflows/`: GitHub Actions workflow for CI/CD
- `src/`: Application source code
  - `tests/`: Test files

## Part 1: Container Security Implementation

### 1. Docker Security Best Practices

Located in `part1-container-security/docker/`

- `README.md`: Lists and explains five Docker security best practices
- `Dockerfile`: Implements one of the security practices

### 2. Kubernetes Security Configuration

Located in `part1-container-security/kubernetes/`

- `README.md`: Describes three Kubernetes security features
- `secure-pod.yaml`: Kubernetes YAML configuration with securityContext settings

### 3. IaaS Security Measures

Located in `part1-container-security/iaas-security.md`

Explains the concept of Infrastructure as a Service (IaaS) and its security implications.

## Part 2: CI/CD Pipeline Setup

### 1. Configuration Management with Terraform

Located in `part2-cicd-pipeline/infrastructure/`

- `main.tf`: Terraform script to automate the deployment of a web server on Azure
- `README.md`: Instructions on how to use the Terraform script

### 2. CI/CD Pipeline Configuration

Located in `part2-cicd-pipeline/.github/workflows/`

- `ci-cd.yml`: GitHub Actions workflow for building and deploying a serverless application to Azure

## Setup and Usage Instructions

### Prerequisites

- Docker
- Kubernetes CLI (kubectl)
- Terraform
- Azure CLI
- Node.js and npm

### Running the Docker Container

1. Navigate to the Docker directory: `cd part1-container-security/docker`
2. Build the Docker image: `docker build -t secure-app .`
3. Run the container: `docker run -p 3000:3000 secure-app`
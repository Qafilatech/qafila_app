# 🐳 Docker Setup for Qafila Flutter App

## Files Created:

1. **`Dockerfile`** - Multi-stage build for Flutter web app
2. **`docker-compose.yml`** - Orchestrate services
3. **`.dockerignore`** - Exclude unnecessary files
4. **`nginx.conf`** - Nginx configuration for serving the app
5. **`docker-entrypoint.sh`** - Startup script

## 🚀 Quick Start

### Option 1: Using Docker Compose (Recommended)

```bash
# Build and run
docker-compose up --build

# Run in background
docker-compose up -d

# Stop
docker-compose down

# View logs
docker-compose logs -f flutter-web
```

Your app will be available at: **http://localhost:8080**

### Option 2: Using Docker Directly

```bash
# Build the image
docker build -t qafila-flutter-app .

# Run the container
docker run -p 8080:80 \
  -e API_BASE_URL=http://localhost:3001/api/v1 \
  qafila-flutter-app

# Run in background
docker run -d -p 8080:80 \
  --name qafila-app \
  -e API_BASE_URL=http://localhost:3001/api/v1 \
  qafila-flutter-app

# Stop the container
docker stop qafila-app

# Remove the container
docker rm qafila-app
```

## 🔧 Configuration

### Environment Variables

You can configure the API URL using environment variables:

**Using docker-compose:**
```bash
# Create .env file
echo "API_BASE_URL=https://api.yourdomain.com/api/v1" > .env.docker

# Run with custom env
docker-compose --env-file .env.docker up
```

**Using Docker:**
```bash
docker run -p 8080:80 \
  -e API_BASE_URL=https://api.yourdomain.com/api/v1 \
  qafila-flutter-app
```

### Custom Nginx Configuration

The `nginx.conf` file is already configured with:
- ✅ Gzip compression
- ✅ Static asset caching
- ✅ Security headers
- ✅ Health check endpoint at `/health`

To use custom nginx config, uncomment this line in `Dockerfile`:
```dockerfile
COPY nginx.conf /etc/nginx/nginx.conf
```

## 📦 What Gets Built

### Build Process:
1. **Stage 1:** Flutter builds the web app
   - Installs dependencies
   - Builds production web bundle
   - Optimized and minified

2. **Stage 2:** Nginx serves the static files
   - Lightweight nginx:alpine image
   - Only includes built web files
   - Final image ~50MB

### Output:
- Optimized JavaScript bundles
- Compressed assets
- Service worker for caching
- Fast loading times

## 🌐 Deployment

### Deploy to Cloud Platforms:

#### **Docker Hub**
```bash
# Login
docker login

# Tag image
docker tag qafila-flutter-app yourusername/qafila-app:latest

# Push
docker push yourusername/qafila-app:latest
```

#### **Google Cloud Run**
```bash
# Build and push
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/qafila-app

# Deploy
gcloud run deploy qafila-app \
  --image gcr.io/YOUR_PROJECT_ID/qafila-app \
  --platform managed \
  --set-env-vars API_BASE_URL=https://api.yourdomain.com/api/v1
```

#### **AWS ECR + ECS**
```bash
# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

# Tag and push
docker tag qafila-flutter-app:latest ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/qafila-app:latest
docker push ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/qafila-app:latest
```

#### **Azure Container Registry**
```bash
# Login
az acr login --name yourregistry

# Tag and push
docker tag qafila-flutter-app yourregistry.azurecr.io/qafila-app:latest
docker push yourregistry.azurecr.io/qafila-app:latest
```

#### **DigitalOcean App Platform**
```bash
# Push to Docker Hub first, then:
# 1. Go to DigitalOcean App Platform
# 2. Create new app
# 3. Select Docker Hub
# 4. Enter: yourusername/qafila-app:latest
```

## 🔒 Production Best Practices

### 1. Use Environment-Specific Builds

```bash
# Development
docker build -t qafila-app:dev --build-arg ENV=development .

# Production
docker build -t qafila-app:prod --build-arg ENV=production .
```

### 2. Health Checks

Add to `docker-compose.yml`:
```yaml
services:
  flutter-web:
    # ... other config
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

### 3. Resource Limits

```yaml
services:
  flutter-web:
    # ... other config
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
```

### 4. Security Scanning

```bash
# Scan for vulnerabilities
docker scan qafila-flutter-app

# Or use Trivy
trivy image qafila-flutter-app
```

## 🛠️ Development with Docker

### Hot Reload Development Container

Create `Dockerfile.dev`:
```dockerfile
FROM ghcr.io/cirruslabs/flutter:stable

WORKDIR /app

# Install dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy source
COPY . .

# Expose Flutter web port
EXPOSE 8080

# Run in debug mode
CMD ["flutter", "run", "-d", "web-server", "--web-hostname", "0.0.0.0", "--web-port", "8080"]
```

Run development container:
```bash
docker build -f Dockerfile.dev -t qafila-dev .
docker run -p 8080:8080 -v $(pwd):/app qafila-dev
```

## 🧹 Maintenance

### Clean Up Docker

```bash
# Remove unused images
docker image prune -a

# Remove unused containers
docker container prune

# Remove unused volumes
docker volume prune

# Clean everything
docker system prune -a --volumes
```

### Update Base Image

```bash
# Pull latest Flutter image
docker pull ghcr.io/cirruslabs/flutter:stable

# Rebuild
docker-compose build --no-cache
```

## 🔍 Troubleshooting

### Issue: Build fails

**Solution:**
```bash
# Clear Docker cache
docker builder prune -a

# Rebuild without cache
docker build --no-cache -t qafila-flutter-app .
```

### Issue: App doesn't connect to API

**Solution:**
Check the API_BASE_URL:
```bash
# Check running container environment
docker exec qafila-app env | grep API

# Update environment variable
docker run -p 8080:80 -e API_BASE_URL=http://YOUR_API_URL qafila-flutter-app
```

### Issue: Port already in use

**Solution:**
```bash
# Find what's using port 8080
lsof -i :8080

# Use different port
docker run -p 9090:80 qafila-flutter-app
```

### Issue: Container exits immediately

**Solution:**
```bash
# Check logs
docker logs qafila-app

# Run interactively to debug
docker run -it qafila-flutter-app sh
```

## 📊 Monitoring

### View Logs

```bash
# Real-time logs
docker logs -f qafila-app

# Last 100 lines
docker logs --tail 100 qafila-app

# With timestamps
docker logs -t qafila-app
```

### Container Stats

```bash
# Resource usage
docker stats qafila-app

# Detailed inspection
docker inspect qafila-app
```

## 🌍 Multi-Environment Setup

Create multiple compose files:

**`docker-compose.prod.yml`:**
```yaml
version: '3.8'
services:
  flutter-web:
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - API_BASE_URL=https://api.production.com/api/v1
    restart: always
```

**`docker-compose.dev.yml`:**
```yaml
version: '3.8'
services:
  flutter-web:
    build:
      context: .
      dockerfile: Dockerfile.dev
    environment:
      - API_BASE_URL=http://localhost:3001/api/v1
    volumes:
      - .:/app
```

Run with:
```bash
# Development
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up

# Production
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up
```

## 📝 CI/CD Integration

### GitHub Actions Example

Create `.github/workflows/docker-build.yml`:
```yaml
name: Build and Push Docker Image

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build Docker image
        run: docker build -t qafila-app .
      
      - name: Push to Docker Hub
        run: |
          echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin
          docker tag qafila-app:latest yourusername/qafila-app:latest
          docker push yourusername/qafila-app:latest
```

## 🎯 Summary

Your Flutter web app is now:
- ✅ Containerized with Docker
- ✅ Served by Nginx
- ✅ Optimized for production
- ✅ Ready to deploy anywhere

**Access your app at:** http://localhost:8080

**Health check:** http://localhost:8080/health

---

For more help, see:
- Docker documentation: https://docs.docker.com
- Flutter web deployment: https://docs.flutter.dev/deployment/web
- Nginx documentation: https://nginx.org/en/docs/


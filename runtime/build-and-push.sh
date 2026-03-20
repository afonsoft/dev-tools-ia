#!/bin/bash

# Build and push custom OpenHands runtime image

echo "Building custom OpenHands runtime image..."

# Build the Docker image
docker build -t dev-dotnet-tools-runtime:latest ./runtime

# Tag for registry (optional)
# docker tag dev-dotnet-tools-runtime:latest your-registry/dev-dotnet-tools-runtime:latest

echo "Build completed!"
echo ""
echo "To use this image with OpenHands:"
echo "1. The docker-compose files are already configured with SANDBOX_BASE_CONTAINER_IMAGE"
echo "2. Run: docker-compose up -d"
echo "3. Or run: docker-compose -f docker-compose.low-resource.yml up -d"
echo ""
echo "To push to registry (optional):"
echo "docker push your-registry/dev-dotnet-tools-runtime:latest"

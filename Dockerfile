# Use Node.js 24 base image
FROM node:24-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for layer caching)
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy application code
COPY . .

# Build the application
RUN npm run build

# Default command (for CDK projects, this is typically used for development)
CMD ["npm", "test"]

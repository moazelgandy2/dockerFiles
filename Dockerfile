# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Install git (required to clone the repository)
RUN apk add --no-cache git

# Clone the app repository
RUN git clone https://github.com/moazelgandy2/bel-masry .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Copy the .env file into the container
COPY ./.env .env

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

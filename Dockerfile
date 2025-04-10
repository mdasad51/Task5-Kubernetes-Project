# Use an official Node.js runtime as a parent image
FROM node:12.22.12

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run tests
RUN npm test -- Mycomponent.test.js

# Build the application
RUN npm run build

# Install serve globally
RUN npm install -g serve

# Expose the port that serve will run on
EXPOSE 3000

# Specify the command to run the application
CMD ["serve", "-s", "build"]

CMD ["npm", "start" ]

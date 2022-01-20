
FROM node:12.22.9-alpine3.14 as build

# Specify where our app will live in the container
WORKDIR /app

# Copy the React App to the container
COPY . .

# Prepare the container for building React
RUN npm ci
# We want the production version

EXPOSE 8080:8080

CMD ["npm" , "start"]


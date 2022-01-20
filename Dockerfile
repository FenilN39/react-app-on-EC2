
 #FROM node:12.22.9-alpine3.14 as build

# Specify where our app will live in the container
#WORKDIR /app

# Copy the React App to the container
#COPY . .

# Prepare the container for building React
#RUN npm ci
# We want the production version

#EXPOSE 8080:8080

#CMD ["npm" , "start"]

FROM node:16.13.2-alpine3.14
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm install
RUN npm run build
RUN npm install -g serve
RUN npm install -g pm2
CMD ["pm2", "serve", "build","3000" "--spa"]
EXPOSE 3000

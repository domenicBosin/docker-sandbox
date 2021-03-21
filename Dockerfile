# Specify a base image
FROM node:alpine

# Install some depedencies
WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

# Default command
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

FROM node:alpine AS build_code
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build_code /app/build /usr/share/nginx/html
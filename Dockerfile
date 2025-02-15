FROM node:lts-alpine AS builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

#copy from builder stage (previous FROM block) to nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 




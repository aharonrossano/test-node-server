FROM node:alpine
WORKDIR /app
COPY src/package.json /app
RUN npm install
COPY ./src /app
CMD node index.js
EXPOSE 3000


# # Stage 0, "build-stage", based on Node.js, to build and compile the frontend
# FROM node:alpine as build-stage
# WORKDIR /app
# COPY src/package*.json /app/
# RUN npm install
# COPY ./src/ /app/
# # RUN npm run build
# CMD ["npm", "run", "start"]

# # Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
# FROM nginx:1.15
# COPY --from=build-stage /app/build/ /usr/share/nginx/html
# COPY --from=build-stage /nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 3000
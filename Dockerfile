FROM nginx:alpine
COPY . /usr/share/nginx/html
ENV PORT 8080
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

# Dockerfile

FROM node:14.15.4-alpine
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser -D -g '' app
COPY sample-project/ .
RUN npm cache clean --force
RUN npm install  --no-bin-links 
RUN chown -R app:app /opt/app
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]
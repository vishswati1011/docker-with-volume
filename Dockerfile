FROM node:18

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

# VOLUME [ "/app/feedback" ]
# instead od volume we are using addind volumne tage in docker run command -v /app/node_modules

CMD ["npm","start"]
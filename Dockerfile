FROM node:16-alpine3.11
ENV NODE_ENV=production
WORKDIR /app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm i -g @nestjs/cli
# RUN npm install --production --silent && mv node_modules ../
RUN npm install
COPY . .
RUN npm run build
CMD ["npm", "run", "start:prod"]

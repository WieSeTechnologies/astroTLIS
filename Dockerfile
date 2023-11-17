FROM node:lts AS runtime

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

# Node Server
ENV HOST=0.0.0.0
ENV PORT=4321
EXPOSE 4321

# DB Server
EXPOSE 3306

CMD node ./dist/server/entry.mjs
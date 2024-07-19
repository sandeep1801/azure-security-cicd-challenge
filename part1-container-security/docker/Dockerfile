FROM node:14
WORKDIR /app
COPY package*.json ./

RUN npm install

COPY . .

RUN useradd -m myuser
# Running as non-root user
USER myuser
EXPOSE 3000

ENTRYPOINT ["node", "index.js"]

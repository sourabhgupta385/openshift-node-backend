FROM node:8

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser


# Create app directory
WORKDIR /usr/src/app

RUN ls

# Bundle app source
COPY . .

RUN npm install --only=production

EXPOSE 8080

ENV PORT=8080 DB_URL=mongodb://admin:admin@mongodb:27017/employee?authSource=admin

USER appuser

CMD [ "npm", "start" ]

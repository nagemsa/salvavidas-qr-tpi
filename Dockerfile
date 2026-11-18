FROM node:22-alpine

WORKDIR /app

COPY package.json tsconfig.json ./
COPY src ./src

RUN mkdir -p /app/data && chown -R node:node /app

USER node

ENV PORT=8080
ENV DB_PATH=/app/data/salvavidas.sqlite

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:8080/health || exit 1

CMD ["node", "--no-warnings", "src/main.ts"]

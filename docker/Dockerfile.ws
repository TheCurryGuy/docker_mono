FROM node:23-alpine

RUN npm install -g pnpm

WORKDIR /usr/src/app


COPY ./packages ./packages
COPY ./pnpm-lock.yaml ./pnpm-lock.yaml

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/ws-server ./apps/ws-server

RUN pnpm install
RUN pnpm run db:generate

EXPOSE 8081

CMD ["pnpm", "run", "start:ws"]
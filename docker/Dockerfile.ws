FROM node:23-alpine

RUN npm install -g pnpm

WORKDIR /usr/src/app


ARG DATABASE_URL
COPY ./packages ./packages
COPY ./pnpm-lock.yaml ./pnpm-lock.yaml
COPY ./pnpm-workspace.yaml ./pnpm-workspace.yaml

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/ws-server ./apps/ws-server

RUN echo "DATABASE_URL=${DATABASE_URL}" > .env
RUN pnpm run db:generate
RUN pnpm install


EXPOSE 8081

CMD ["pnpm", "run", "start:ws"]
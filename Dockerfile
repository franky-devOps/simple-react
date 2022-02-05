# ========= Dependencies stage =========
FROM node:14-alpine3.14 AS dependencies

WORKDIR /opt/app

# Install dependencies
COPY package.json yarn.lock ./

RUN yarn cache clean && yarn install

# ========= Build stage =========
FROM dependencies AS build

WORKDIR /opt/app

# Copy all local root files to intermediate container
COPY . /opt/app

RUN yarn build

# ========= Release stage =========
FROM build AS realease

# Copy all source files
WORKDIR /opt/app

COPY --from=build /opt/app/build .

EXPOSE 3000

# start application
CMD ["yarn", "start"]
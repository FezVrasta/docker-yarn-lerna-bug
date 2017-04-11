FROM mhart/alpine-node:7.5

# Install Git
RUN apk update && apk upgrade && apk add --no-cache bash git openssh

# Install Yarn (version 24 compiled from master fb40251c5b10bf3b43eed2daaaab53a1aab86f31)
#RUN npm install --global yarn
COPY yarn /opt/yarn
RUN ln -s /opt/yarn/bin/yarn /bin/yarn

WORKDIR /app

# Copy package.json
COPY ./package.json /app/package.json

# Install dependencies
RUN yarn install --pure-lockfile

# Copy project
COPY . /app

# Bootstrap Lerna
RUN yarn bootstrap

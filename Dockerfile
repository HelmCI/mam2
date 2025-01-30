# syntax=docker/dockerfile:1.7-labs
ARG REG=reg..
ARG NODE=23
ARG NGINX=1


FROM --platform=$BUILDPLATFORM ${REG}/dhub/library/node:${NODE} AS node
ARG MAM=/mam
ARG NS=gd
ARG APP=demo

WORKDIR ${MAM}

COPY --exclude=g* . .
RUN ln -s ../mol_icon mol/icon
RUN npm install
RUN	cat mam_fix/mam.js >> node_modules/mam/node.js
RUN npm run mam2
RUN	cat mam_fix/mam.js >> mol/build/-/node.js

# COPY gd/ gd/
# RUN node ./gd/snap.npm/cli.mjs gd/snap.npm

# COPY g2/ g2/
# RUN npm start ${NS}/${APP}/app


FROM ${REG}/dhub/library/nginx:${NGINX}
ARG MAM=/mam
ARG NS=gd
ARG APP=demo

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=node ${MAM}/${NS}/${APP}/app/-/ /usr/share/nginx/html/

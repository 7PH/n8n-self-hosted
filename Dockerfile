FROM node:16-alpine
CMD ["/bin/sh", "start.sh"]
EXPOSE 80

ARG DOCKER_USER
ARG DOCKER_UID
ARG DOCKER_GID

# Install NPM dependencies
RUN npm i n8n -g

ENV N8N_PORT=80
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_HIRING_BANNER_ENABLED=false

# Switch to /app
WORKDIR /app

# Workaround to remove the node user, potentially conflicting with DOCKER_UID
RUN deluser node

# Copy required files
COPY start.sh start.sh

# Setup user
RUN addgroup -g $DOCKER_GID $DOCKER_USER && \
    adduser -u $DOCKER_UID -G $DOCKER_USER -D $DOCKER_USER && \
    chown -R $DOCKER_USER:$DOCKER_USER .

USER $DOCKER_UID:$DOCKER_GID

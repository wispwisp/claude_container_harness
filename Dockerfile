FROM node:20-slim

RUN apt-get update && apt-get install -y \
    curl git \
    && rm -rf /var/lib/apt/lists/*

ARG USER_ID
ARG GROUP_ID

# Change the existing node user's ID in container
# from 1000 to something else (e.g., 2000)
# Then create your 'claudeuser' with ID match your host
RUN usermod -u 2000 node && groupmod -g 2000 node

RUN groupadd -g $GROUP_ID claudegroup && \
    useradd --uid $USER_ID --gid $GROUP_ID -m claudeuser

USER claudeuser

RUN curl \
    -x http://127.0.0.1:8080 \
    -fsSL https://claude.ai/install.sh | bash
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

WORKDIR /home/claudeuser/workspace
ENTRYPOINT ["bash"]


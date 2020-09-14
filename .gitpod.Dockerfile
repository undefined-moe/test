FROM gitpod/workspace-full

RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN sudo add-apt-repository -y ppa:neovim-ppa/unstable
RUN sudo apt-get update \
 && sudo apt-get install -y google-chrome-stable mongodb-org \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/*
 
RUN sudo mkdir -p /data/db \
 && sudo chown gitpod:gitpod -R /data/db

RUN bash -c ". .nvm/nvm.sh && nvm install 14 && nvm alias default 14"

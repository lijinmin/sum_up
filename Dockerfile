# 基于镜像 ubuntu
From registry.cn-hangzhou.aliyuncs.com/ubuntu-14-04/ubuntu14.04
RUN apt-get update -q
RUN apt-get install -qy curl libmysqlclient-dev nodejs

# Install rvm, ruby, bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.2.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Copy the Gemfile and Gemfile.lock into the image. 
# Temporarily set the working directory to where they are. 
WORKDIR /tmp 
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "bundle install"

# Add rails project to project directory
ADD ./ /webapps/app

# set WORKDIR
WORKDIR /webapps/app

# bundle install
# RUN /bin/bash -l -c "bundle install"

# Add configuration files in repository to filesystem
ADD scripts/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Publish port 80
EXPOSE 5001

# Startup commands
ENTRYPOINT /usr/bin/start-server

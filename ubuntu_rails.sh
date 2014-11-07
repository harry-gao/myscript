#!/bin/bash

#install ruby dependencies
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

#install ruby with rvm
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.3
rvm use 2.1.3 --default
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

#install node
sudo apt-get install nodejs

# Install Phusion's PGP key to verify packages
gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
gpg --armor --export 561F9B9CAC40B2F7 | sudo apt-key add -

# Add HTTPS support to APT
sudo apt-get install apt-transport-https

# Add the passenger repository
sudo sh -c "echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main' >> /etc/apt/sources.list.d/passenger.list"
sudo chown root: /etc/apt/sources.list.d/passenger.list
sudo chmod 600 /etc/apt/sources.list.d/passenger.list
sudo apt-get update

# Install nginx and passenger
sudo apt-get install nginx-full passenger


#install postgres sql
sudo apt-get install postgresql postgresql-contrib libpq-dev


#config phusion passenger
#sudo vi /etc/nginx/nginx.conf
    #uncomment row:
    #passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
    # passenger_ruby /home/deploy/.rvm/wrappers/ruby-2.1.3/ruby;


#adding nginx host

# server {
#         listen 80 default_server;
#         listen [::]:80 default_server ipv6only=on;

#         server_name mydomain.com;
#         passenger_enabled on;
#         rails_env    production;
#         root         /home/deploy/myapp/current/public;

#         # redirect server error pages to the static page /50x.html
#         error_page   500 502 503 504  /50x.html;
#         location = /50x.html {
#             root   html;
#         }
# }



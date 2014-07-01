#
# Cookbook Name:: nodechef::app
# Recipe:: default
#
# Copyright (C) 2014 NodeChef
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nodechef::default'

# Install Nginx
include_recipe 'nginx'
nginx_site 'default' do
  enable false
end

template node['nginx']['dir'] + '/sites-available/node.conf' do
  source 'nginx.conf.erb'
  notifies :restart, 'service[nginx]'
end

nginx_site 'node.conf' do
  enable true
end

# Install NodeJS
include_recipe 'nodejs'

npm_package 'coffee-script'
npm_package 'mocha'
npm_package 'bower'
npm_package 'gulp'

#logrotate_app 'node' do
  #path      '/apps/node/shared/log/*.log'
  #size      '100M'
  #options   ['missingok', 'delaycompress', 'notifempty', 'copytruncate', 'compress']
  #frequency 'daily'
  #rotate    30
  #create    '644 root adm'
  #su
#end


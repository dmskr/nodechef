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

# Set the projects directory
['/var/www', '/var/www/' + node['project_name']].each do |dir|
  directory dir do
    mode '0770'
    owner 'node'
    group 'node'
  end
end

directory "/home/node/.ssh" do
  owner 'node'
  group 'node'
  mode '0700'
end

template "/home/node/.ssh/id_rsa" do
  source 'deploy.id_rsa'
  owner 'node'
  group 'node'
  mode '0600'
end

template "/home/node/.ssh/id_rsa.pub" do
  source 'deploy.id_rsa.pub'
  owner 'node'
  group 'node'
  mode '0600'
end

git "/var/www/#{node['project_name']}" do
  repository node[:git][:repository]
  action :checkout
  user 'node'
end

#logrotate_app 'node' do
  #path      '/apps/node/shared/log/*.log'
  #size      '100M'
  #options   ['missingok', 'delaycompress', 'notifempty', 'copytruncate', 'compress']
  #frequency 'daily'
  #rotate    30
  #create    '644 root adm'
  #su
#end


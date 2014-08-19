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

# Setup SSH
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

# Setup Project Directory
git '/home/node/' + node['project_name'] do
  repository node[:git][:repository]
  action :checkout
  user 'node'
end

# Upstart script
template "/etc/init/#{node['project_name']}.conf" do
  source "upstart.conf.erb"
  owner "root"
  group "root"
  mode 0644
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

# Firewall
include_recipe 'ufw'


#
# Cookbook Name:: nodechef::db
# Recipe:: default
#
# Copyright (C) 2014 NodeChef
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nodechef::default'

# Install mongodb from 10gen repo
include_recipe 'mongodb::mongodb_org_repo' # Set the packages repos
include_recipe 'mongodb' # Install MongoDB

# Install python used by mms console (not installed)
include_recipe 'python'

# Set extended user limits for mongodb and node users
include_recipe 'ulimit'
['mongodb', 'node'].each do |user|
  user_ulimit user do
    filehandle_limit 64000
    process_limit 32000
  end
end


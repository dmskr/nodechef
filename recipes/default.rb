#
# Cookbook Name:: nodechef
# Recipe:: default
#
# Copyright (C) 2014 NodeChef
#
# All rights reserved - Do Not Redistribute
#

# Packages
include_recipe 'apt'
include_recipe 'build-essential'

package "screen"
package "tmux"
package "htop"
package "sysstat"
package "zip"
package "unzip"
package "curl"
package "wget"
package "lsof"
package "vim-nox"
package "libxml2-dev" # required by nokogori, etc...
package "libxslt-dev" # required by nokogori, etc...
package "libmagickwand-dev"
package "mailutils"
package "apache2-utils"
package "s3cmd"

# Node User
group 'node'

user 'node' do
  group 'node'
  shell '/bin/bash'
  home '/home/node'
end

directory '/home/node' do
  mode '0760'
  owner 'node'
  group 'node'
end

directory '/home/node/.ssh' do
  mode '0700'
  owner 'node'
  group 'node'
end

template '/home/node/.ssh/authorized_keys' do
  mode '0700'
  owner 'node'
  group 'node'
  source 'authorized_keys.erb'
end

# Known Hosts
include_recipe 'ssh_known_hosts'

node['known_hosts'].each do |host|
  ssh_known_hosts_entry host
end

include_recipe 'hostname'

# Set passwordless sudo
include_recipe 'sudo'

# Set the 'mail' command configuration
include_recipe 'ssmtp'

# Firewall
include_recipe 'ufw'

# LogRotate
include_recipe 'logrotate'


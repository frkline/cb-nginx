#
# Cookbook Name:: cb-nginx
# Recipe:: nginx
#

# Create nginx group
node.normal['nginx']['group'] = 'nginx'
group node['nginx']['group']

# Create nginx user
node.normal['nginx']['user'] = 'nginx'
user node['nginx']['user'] do
  supports :manage_home => true
  group node['nginx']['group']
  system true
  home '/home/nginx'
  shell '/bin/bash'
  comment 'NGINX user'
end

# Configure nginx
# https://supermarket.getchef.com/cookbooks/nginx
node.normal['nginx']['init_style'] = 'init'
include_recipe 'nginx::source'

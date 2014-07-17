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

# Upgrade OpenSSL
yum_package 'openssl' do
  action :upgrade
end

# Configure nginx
# https://supermarket.getchef.com/cookbooks/nginx
node.normal['nginx']['repo_source'] = 'nginx'
node.normal['nginx']['default_site_enabled'] = false
node.normal['nginx']['sendfile'] = 'off'
include_recipe 'nginx'

#
# Cookbook Name:: delivery-cli-install
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

packagecloud_repo node['delivery_build']['repo_name'] do
  type value_for_platform_family(debian: 'deb', rhel: 'rpm')
end

package 'delivery-cli' do
  version node['delivery_build']['delivery-cli']['version']
  provider Chef::Provider::Package::Dpkg if node['platform_family'].eql?('debian')
  action :upgrade
end
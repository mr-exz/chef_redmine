#
# Cookbook Name:: chef_redmine
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'epel-release' do
  action :install
end

include_recipe 'chef_redmine::01_open_ports'
include_recipe 'chef_redmine::02_add_redmine_user'
include_recipe 'chef_redmine::03_config_selinux'

include_recipe 'chef_redmine::11_install_mariadb'
include_recipe 'chef_redmine::12_install_nginx'
include_recipe 'chef_redmine::13_install_ruby'
include_recipe 'chef_redmine::14_install_redmine_packages'

include_recipe 'chef_redmine::21_create_db'
include_recipe 'chef_redmine::22_config_http'
#include_recipe 'chef_redmine::23_config_https'

include_recipe 'chef_redmine::31_download_redmine'
include_recipe 'chef_redmine::32_config_god'
include_recipe 'chef_redmine::33_install_redmine'




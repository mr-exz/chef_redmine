execute 'generate dhparam' do
  command 'openssl dhparam -out /etc/nginx/dhparam.pem 2048'
end

template "/etc/nginx/conf.d/https_#{node["nginx"]["server_name"]}.conf" do
  source "nginx_redmine_https.conf.erb"
  owner "root"
  group "root"
  mode 0600
end

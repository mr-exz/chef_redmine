
template "/etc/nginx/conf.d/http_#{node["nginx"]["server_name"]}.conf" do
  source "nginx_redmine_http.conf.erb"
  owner "root"
  group "root"
  mode 0600
end

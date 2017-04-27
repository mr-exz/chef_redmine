
script 'god_create_logfile' do
  interpreter "bash"
  code <<-EOH
    touch #{node["god"]["log"]}
    chmod 666 #{node["god"]["log"]}
  EOH
end

template "#{node["redmine"]["home"]}/redmine.god" do
  source "god_redmine.erb"
  owner "root"
  group "root"
  mode 0600
end
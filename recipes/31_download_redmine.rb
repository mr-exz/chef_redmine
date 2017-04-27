%w{
  wget
  unzip
}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

execute 'redmine download archive' do
  command "wget http://www.redmine.org/releases/redmine-#{node["redmine"]["version"]}.zip"
end

execute 'redmine extract archive' do
  command "unzip redmine-#{node["redmine"]["version"]}.zip -d /opt/"
end

execute 'redmine mv folder' do
  command "mv /opt/redmine-#{node["redmine"]["version"]} #{node["redmine"]["home"]}"
end
yum_package "mariadb-server" do
  action :install
end

yum_package "mariadb-devel" do
  action :install
end

service "mariadb" do
  action [:enable, :start]
end


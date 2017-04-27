execute 'redmine create database' do
  command "mysql -e \"CREATE DATABASE #{node["mariadb"]["db_name"]} /*\!40100 DEFAULT CHARACTER SET utf8 */;\""
end

execute 'redmine create database user' do
  command "mysql -e \"CREATE USER #{node["mariadb"]["db_user"]}@localhost IDENTIFIED BY \'#{node["mariadb"]["db_password"]}\';\""
end

execute 'redmine grant database priveleges' do
  command "mysql -e \"GRANT ALL PRIVILEGES ON #{node["mariadb"]["db_name"]}.* TO #{node["mariadb"]["db_user"]}@localhost;\""
end

execute 'redmine flush databsae priveleges' do
  command 'mysql -e "FLUSH PRIVILEGES;"'
end
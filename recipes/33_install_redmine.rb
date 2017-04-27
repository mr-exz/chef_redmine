
template "#{node["redmine"]["home"]}/config/database.yml" do
  source "redmine_database.yml.erb"
  owner "redmine"
  group "redmine"
  mode 0600
end

template "#{node["redmine"]["home"]}/config/configuration.yml" do
  source "redmine_configuration.yml.erb"
  owner "redmine"
  group "redmine"
  mode 0600
end

template "#{node["redmine"]["home"]}/config/unicorn.rb" do
  source "redmine_unicorn.rb.erb"
  owner "redmine"
  group "redmine"
  mode 0600
end

script 'redmine_install_gems' do
  interpreter "bash"
  code <<-EOH
    source /etc/bashrc
    export PKG_CONFIG_PATH="/usr/lib64/pkgconfig"
    cd #{node["redmine"]["home"]}
    echo 'gem "unicorn"' >> Gemfile
    bundle install
    bundle exec rake generate_secret_token
    bundle exec rake db:migrate RAILS_ENV=production
    mkdir /opt/redmine/tmp/pids
    chown #{node["system"]["user"]}:#{node["system"]["group"]} -R #{node["redmine"]["home"]}
    god -c #{node["redmine"]["home"]}/redmine.god
  EOH
end

service "nginx" do
  action :restart
end

package 'firewalld'

service 'firewalld' do
  action [:enable, :start]
end

firewalld_port "#{node['firewalld']['http']}/tcp" do
  action :add
  zone   'public'
end

firewalld_port "#{node['firewalld']['https']}/tcp" do
  action :add
  zone   'public'
end
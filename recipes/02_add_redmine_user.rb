
user "#{node["system"]["user"]}" do
  comment 'System user for Redmine'
  system true
  shell '/bin/false'
  home node["redmine"]["home"]
end
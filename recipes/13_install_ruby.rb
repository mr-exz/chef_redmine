bash 'install_ruby' do
  user 'root'
  code <<-EOH
    source /etc/bashrc
    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -L get.rvm.io | bash -s stable
    source /etc/profile.d/rvm.sh
    rvm reload
    rvm requirements run
    rvm install #{node["ruby"]["version"]}
    rvm use #{node["ruby"]["version"]} --default
  EOH
end
%w{
  libticonv-devel
  xz-devel
  libxml2
  zlib-devel
  nodejs
  mysql++-devel
  ImageMagick-c++-devel
}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

script 'redmine_install_init_gems' do
  interpreter "bash"
  code <<-EOH
    source /etc/bashrc
    gem install bundler
    gem install prawn
    gem install god
  EOH
end
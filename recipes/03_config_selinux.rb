execute 'turn selinux to permissive' do
  command 'setenforce 0'
end
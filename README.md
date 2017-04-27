# chef redmine 

## Environment

* OS: CentOS 7
* Ruby: 2.3.4
* Redmine: 3.3.3
* cookbook: firewalld

## Attributes

```
# open ports for http/https
default['firewalld']['https'] = "443"
default['firewalld']['http'] = "80"

# choose ruby version
default["ruby"]["version"] = "2.3.4"

# choose hostname, after converge redmine will available from this address
default["nginx"]["server_name"] = 'redmine.exz.su'

# redmine will work under this user/group
default["system"]["user"] = "redmine"
default["system"]["group"] = "redmine"

# settings for db access
default["mariadb"]["db_name"] = "redmine"
default["mariadb"]["db_user"] = "redmine"
default["mariadb"]["db_password"] = "123456"

# god log file
default["god"]["log"] = "/var/log/god.log"

# choose redmine version
default["redmine"]["version"] = "3.3.3"

# redmine home
default["redmine"]["home"] = "/opt/redmine"

# setting for sending e-mail from redmine
default["redmine"]["configuration"]["smtp_address"] = "smtp.yandex.ru"
default["redmine"]["configuration"]["smtp_port"] = 587
default["redmine"]["configuration"]["domain"] = "exz.su"
default["redmine"]["configuration"]["smtp_user"] = "redmine@exz.su"
default["redmine"]["configuration"]["smtp_password"] = "123456"

``` 

## Recipes

* 01_open_ports - in firewalld open http/https ports
* 02_add_redmine_user - create system user redmine
* 03_config_selinux - turn selinux to permissive (comment if you disable selinux)
* 11_install_mariadb - install mariadb
* 12_install_nginx - install nginx
* 13_install_ruby - install ruby (only for kitchen)
* 14_install_redmine_packages - adititional packages for redmine
* 21_create_db - init db for redmine
* 22_config_http - crate http config for redmine
* 23_config_https - create https config for redmine (uncomment if you want use https)
* 31_download_redmine - download redmine from redmine.org
* 32_config_god - configure god
* 33_install_redmine - install redmine


## Kitchen

```
# git clone https://github.com/mr-exz/chef_redmine.git
# cd chef_redmine
# kitchen converge
# kitchen login
```

## Usage

### Chef solo

```
# curl -sSL https://rvm.io/mpapis.asc | gpg --import -
# curl -L get.rvm.io | bash -s stable
# source /etc/profile.d/rvm.sh
# rvm reload
# rvm requirements run
# rvm install 2.3.4
# rvm use 2.3.4 --default
# gem install chef
# gem install --no-rdoc --no-ri berkshelf
# mkdir /tmp/chef-solo
# cd /tmp/chef-solo
# git clone https://github.com/mr-exz/chef_redmine.git
# cd ./chef_redmine/
# berks vendor cookbooks
# chef-solo -c solo/solo.rb -j solo/redmine.json
```
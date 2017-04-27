default['firewalld']['https'] = "443"
default['firewalld']['http'] = "80"

default["ruby"]["version"] = "2.3.4"

default["nginx"]["server_name"] = 'redmine.exz.su'

default["system"]["user"] = "redmine"
default["system"]["group"] = "redmine"

default["mariadb"]["db_name"] = "redmine"
default["mariadb"]["db_user"] = "redmine"
default["mariadb"]["db_password"] = "123456"

default["god"]["log"] = "/var/log/god.log"

default["redmine"]["version"] = "3.3.3"
default["redmine"]["home"] = "/opt/redmine"
default["redmine"]["configuration"]["smtp_address"] = "smtp.yandex.ru"
default["redmine"]["configuration"]["smtp_port"] = 587
default["redmine"]["configuration"]["domain"] = "exz.su"
default["redmine"]["configuration"]["smtp_user"] = "redmine@exz.su"
default["redmine"]["configuration"]["smtp_password"] = "123456"


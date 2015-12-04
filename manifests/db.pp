define zabbix_app::db (
  $zabbix_server,
  $zabbix_web,
  $database_name,
  $database_user,
  $database_password,
  $database_host = $::fqdn,
  $database_port = '3306',
)
{

  class { 'mysql::server':
        override_options => {
          'mysqld' => {
              'bind_address' => '0.0.0.0',
            },
        }
  }

  class { 'zabbix::database':
    zabbix_server     => $zabbix_server,
    zabbix_web        => $zabbix_web,
    database_type     => 'mysql',
    database_name     => $database_name,
    database_user     => $database_user,
    database_password => $database_password,
  }
}
Zabbix_app::Db produces Zabbixdb {
  host => $::fqdn,
  port => $database_port,
  user => $database_user,
  pass => $database_password,
  name => $database_name,
}

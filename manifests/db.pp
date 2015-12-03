define zabbix_app::db (
  $zabbix_server,
  $zabbix_web,
  $database_name,
  $database_user,
  $database_password,
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
  zabbix_db_host => $::fqdn,
  zabbix_db_user => $database_user,
  zabbix_db_pass => $database_password,
  zabbix_db_name => $database_name,
}

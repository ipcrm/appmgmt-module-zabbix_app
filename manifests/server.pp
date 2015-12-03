define zabbix_app::server (
    $zabbix_db_host,
    $zabbix_db_name,
    $zabbix_db_user,
    $zabbix_db_pass,
)
{
  class { 'mysql::client': }
  class { 'zabbix::server':
    database_type     => 'mysql',
    database_host     => $zabbix_db_host,
    database_name     => $zabbix_db_name,
    database_user     => $zabbix_db_user,
    database_password => $zabbix_db_pass,
  }

  Zabbix_app::Server consumes ZabbixDb {
    zabbix_db_host => $zabbix_db_host,
    zabbix_db_user => $zabbix_db_user,
    zabbix_db_pass => $zabbix_db_pass,
    zabbix_db_name => $zabbix_db_name,
  }
}

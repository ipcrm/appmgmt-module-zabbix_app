define zabbix_app::server (
    $zabbix_db_host,
    $zabbix_db_port,
    $zabbix_db_name,
    $zabbix_db_user,
    $zabbix_db_pass,
    $zabbix_server_port = '10051',
)
{
  class { 'mysql::client': }
  class { 'zabbix::server':
    database_type     => 'mysql',
    database_host     => $zabbix_db_host,
    database_port     => $zabbix_db_port,
    database_name     => $zabbix_db_name,
    database_user     => $zabbix_db_user,
    database_password => $zabbix_db_pass,
    listenport        => $zabbix_server_port,
    manage_firewall   => true,
  }

}
Zabbix_app::Server produces Zabbixsrv {
  host => $::fqdn,
  port => $zabbix_server_port,
}
Zabbix_app::Server consumes Zabbixdb {
  zabbix_db_host => $host,
  zabbix_db_port => $port,
  zabbix_db_user => $user,
  zabbix_db_pass => $pass,
  zabbix_db_name => $dbname
}

define zabbix_app::web (
  $zabbix_server,
  $zabbix_server_port,
  $zabbix_db_host,
  $zabbix_db_port,
  $zabbix_db_name,
  $zabbix_db_user,
  $zabbix_db_pass,
){
  class { 'apache':
      mpm_module => 'prefork',
  }
  class { 'apache::mod::php': }
  class { 'zabbix::web':
    zabbix_url        => $::fqdn,
    zabbix_server     => $zabbix_server,
    zabbix_listenport => $zabbix_server_port,
    database_type     => 'mysql',
    database_host     => $zabbix_db_host,
    database_port     => $zabbix_db_port,
    database_name     => $zabbix_db_name,
    database_user     => $zabbix_db_user,
    database_password => $zabbix_db_pass,
  }

}
Zabbix_app::Web consumes Zabbixsrv {
  zabbix_server      => $host,
  zabbix_server_port => $port,
}
Zabbix_app::Web consumes Zabbixdb {
  zabbix_db_host => $host,
  zabbix_db_port => $port,
  zabbix_db_user => $user,
  zabbix_db_pass => $pass,
  zabbix_db_name => $dbname
}

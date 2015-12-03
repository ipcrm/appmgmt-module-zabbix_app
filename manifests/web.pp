define zabbix_app::web (
  $zabbix_server,
  $zabbix_db_host,
  $zabbix_db_name,
  $zabbix_db_user,
  $zabbix_db_pass,
){
  class { 'apache':
      mpm_module => 'prefork',
  }
  class { 'apache::mod::php': }
  class { 'zabbix::web':
    zabbix_url    => $::fqdn,
    zabbix_server => $zabbix_server,
    database_type => 'mysql',
    database_host => $zabbix_db_host,
    database_name => $zabbix_db_name,
    database_user => $zabbix_db_user,
    database_pass => $zabbix_db_pass,
  }

  Zabbix_app::Web consumes ZabbixDb {
    zabbix_db_host => $zabbix_db_host,
    zabbix_db_user => $zabbix_db_user,
    zabbix_db_pass => $zabbix_db_pass,
    zabbix_db_name => $zabbix_db_name,
  }
}

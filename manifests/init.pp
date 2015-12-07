application zabbix_app(
  $zabbix_server_fqdn,
  $zabbix_web_fqdn,
  $database_name,
  $database_user,
  $database_password,
){
  zabbix_app::db{ $name:
    zabbix_server_fqdn => $zabbix_server_fqdn,
    zabbix_web_fqdn    => $zabbix_web_fqdn,
    database_name      => $database_name,
    database_user      => $database_user,
    database_password  => $database_password,
    export             => Zabbixdb["zbx-${name}"]
  }

  zabbix_app::server { $name:
    consume => Zabbixdb["zbx-${name}"],
    export  => Zabbixsrv["zbxsrv-${name}"]
  }

  zabbix_app::web { $name:
    zabbix_server => $zabbix_server,
    consume       => [
      Zabbixdb["zbx-${name}"],
      Zabbixsrv["zbxsrv-${name}"],
      ]
  }

  zabbix_app::agent { $name:
    consume => Zabixsrv["zbxsrv-${name}"]
  }

}

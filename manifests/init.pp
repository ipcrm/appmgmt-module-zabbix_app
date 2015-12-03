application zabbix_app(
  $zabbix_server,
  $zabbix_web,
  $database_name,
  $database_user,
  $database_password,
){
  zabbix_app::db{ $name:
    zabbix_server     => $zabbix_server,
    zabbix_web        => $zabbix_web,
    database_name     => $database_name,
    database_user     => $database_user,
    database_password => $database_password,
    export            => ZabbixDb["zbx-${name}"]
  }

  zabbix_app::server { $name:
    consume => ZabbixDb["zbx-${name}"]
  }

  zabbix_app::web { $name:
    zabbix_server => $zabbix_server,
    consume       => ZabbixDb["zbx-${name}"]
  }

}

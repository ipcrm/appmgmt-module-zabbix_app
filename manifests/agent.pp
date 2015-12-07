define zabbix_app::agent(
  $zabbix_server,
) {
    class{'zabbix::agent':
      server => $zabbix_server
    }
}
Zabbix_app::Agent consumes Zabbixsrv {
  zabbix_server => $host
}

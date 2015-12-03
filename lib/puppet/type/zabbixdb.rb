Puppet::Type.newtype :zabbixdb, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :zabbix_db_host
  newparam :zabbix_db_user
  newparam :zabbix_db_pass
  newparam :zabbix_db_name
end

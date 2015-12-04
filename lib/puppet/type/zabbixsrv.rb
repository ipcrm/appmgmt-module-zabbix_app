Puppet::Type.newtype :zabbixsrv, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :host
  newparam :port
end

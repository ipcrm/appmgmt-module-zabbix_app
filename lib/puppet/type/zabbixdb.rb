Puppet::Type.newtype :zabbixdb, :is_capability => true do
  newparam :name, :is_namevar => true
  newparam :host
  newparam :port
  newparam :user
  newparam :pass
  newparam :name
end

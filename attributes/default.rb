
default['set_fqdn'] = 'localhost'

default['public_keys'] = [
  'Your public key goes here'
]
default['known_hosts'] = [
  'github.com'
]

default['authorization']["sudo"]["passwordless"] = true
default['authorization']["sudo"]["users"] = ["node", "vagrant"]


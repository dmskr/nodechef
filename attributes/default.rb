# Mandatory for customization on each node level
default['set_fqdn'] = 'localhost'

default['public_keys'] = [
  'Your public key goes here'
]
default['known_hosts'] = [
  'github.com'
]

default['ssmtp'] = {
  :root => '',
  :mailhub_name => '',
  :mailhub_port => 587,
  :hostname => '',
  :from_line_override => true,
  :use_starttls => true,
  :auth_username => '',
  :auth_password => '',
  :credential_method => 'plain'
}

# Optional
default['authorization']["sudo"]["passwordless"] = true
default['authorization']["sudo"]["users"] = ["node", "vagrant"]

default['firewall']['rules'] = [
  'ssh' => {
    'port' => 22
  }
]


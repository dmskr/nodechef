
# Customize
default['project_name'] = 'node'
default['git'] = {
  'repository' => 'please specify',
  'deploy_public_key' => 'please specify',
  'deploy_private_key' => 'please specify'
}

# Optional
default['nodejs'] = {
  'version' => '0.10.29',
  'install_method' => 'package'
}

default['firewall']['rules'] = [
  'http' => {
    'port' => 80
  },
  'ssh' => {
    'port' => 22
  }
]


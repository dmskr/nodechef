
default['nodejs'] = {
  'version' => '0.10.29',
  'install_method' => 'package'
}

default['firewall']['rules'] = [
  'http' => {
    'port' => 80
  }
]

class foreman_certs::params {

  $pki_dir = '/etc/pki/foreman'

  $ca_expiration = 7305 # 20 years
  $cert_expiration = 7305 # 20 years
  
  $country              = 'US'
  $state                = 'NC'
  $locality             = 'Raleigh'
  $organization         = 'Foreman'
  $organizational_unit  = undef

  # OS specific paths
  case $::osfamily {
    'RedHat': {
      $puppet_home = '/var/lib/puppet'
    }
    'Debian': {
      $puppet_home = '/var/lib/puppet'
    }
    'Linux': {
      case $::operatingsystem {
        'Amazon': {
          $puppet_home = '/var/lib/puppet'
        }
        default: {
          fail("${::hostname}: This module does not support operatingsystem ${::operatingsystem}")
        }
      }
    }
    /^(FreeBSD|DragonFly)$/: {
      $puppet_home = '/var/puppet'
    }
    'windows': {
      $puppet_home = undef
    }
    default: {
      fail("${::hostname}: This module does not support osfamily ${::osfamily}")
    }
  }

  $use_puppet_certs = false
  $lower_fqdn = downcase($::fqdn)
  
  $puppet_ca_cert     = "${puppet_home}/ssl/certs/ca.pem"
  $puppet_ssl_chain   = "${puppet_home}/ssl/certs/ca.pem"
  $puppet_server_cert = "${puppet_home}/ssl/certs/${lower_fqdn}.pem"
  $puppet_server_key  = "${puppet_home}/ssl/private_keys/${lower_fqdn}.pem"
  $puppet_server_crl  = "${puppet_home}/ssl/ca/ca_crl.pem"

}

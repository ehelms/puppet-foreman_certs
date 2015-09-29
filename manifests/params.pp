class foreman_certs::params {

  $pki_dir = '/etc/pki/foreman'

  $ca_expiration = 7305 # 20 years
  $cert_expiration = 7305 # 20 years
  
  $country              = 'US'
  $state                = 'NC'
  $city                 = 'Raleigh'
  $organization         = 'Foreman'
  $organizational_unit  = undef

}

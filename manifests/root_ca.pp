class foreman_certs::root_ca {

  openssl::certificate::authority { 'ca':
    pki_dir      => '/etc/pki/foreman',
    country      => $foreman_certs::country,
    organization => $foreman_certs::organization,
    commonname   => $fqdn,
    days         => 365*20,
  }

}

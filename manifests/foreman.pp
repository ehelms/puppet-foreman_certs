class foreman_certs::foreman {

  Class['foreman_certs::root_ca'] ->
  ssl_pkey { "${::foreman_certs::pki_dir}/private/${fqdn}.pem":
    ensure => 'present',
  } ~>
  x509_request { "${::foreman_certs::pki_dir}/requests/${fqdn}.csr":
    ensure      => 'present',
    private_key => "${::foreman_certs::pki_dir}/private/${fqdn}.pem",
    template    => "${::foreman_certs::pki_dir}/ca.cnf",
  } ~>
  x509_cert { "${::foreman_certs::pki_dir}/certs/${fqdn}.pem":
    ensure      => 'present',
    server      => true,
    private_key => "${::foreman_certs::pki_dir}/private/${fqdn}.pem",
    request     => "${::foreman_certs::pki_dir}/requests/${fqdn}.csr",
    template    => "${::foreman_certs::pki_dir}/ca.cnf",
    req_ext     => false,
  }

}

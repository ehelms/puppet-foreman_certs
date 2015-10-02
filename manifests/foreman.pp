class foreman_certs::foreman {

  if $::foreman_certs::use_puppet_certs {
    $server_cert = $::foreman_certs::puppet_server_cert
    $server_key  = $::foreman_certs::puppet_server_key
    $server_crl  = $::foreman_certs::puppet_server_crl
    $ca_cert     = $::foreman_certs::puppet_ca_cert
    $ssl_chain   = $::foreman_certs::puppet_ssl_chain
  } else {
    $ca_cert     = "${::foreman_certs::pki_dir}/certs/ca_cert.crt"
    $ssl_chain   = "${::foreman_certs::pki_dir}/certs/ca_cert.crt"
    $server_cert = "${::foreman_certs::pki_dir}/certs/${fqdn}.crt"
    $server_key  = "${::foreman_certs::pki_dir}/private/${fqdn}.key"
    $server_csr  = "${::foreman_certs::pki_dir}/requests/${fqdn}.csr"

    Class['foreman_certs::root_ca'] ->
    ssl_pkey { $server_key:
      ensure => 'present',
    } ~>
    x509_request { $server_csr:
      ensure      => 'present',
      private_key => $server_key,
      template    => "${::foreman_certs::pki_dir}/ca.cnf",
    } ~>
    x509_cert { $server_cert:
      ensure      => 'present',
      server      => true,
      private_key => $server_key,
      request     => $server_csr,
      template    => "${::foreman_certs::pki_dir}/ca.cnf",
      req_ext     => false,
    }
  }
}

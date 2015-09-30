class foreman_certs::foreman {

  ssl_pkey { "${pki_dir}/private/${fqdn}.pem":
    ensure => 'present',
  } ~>
  x509_request { "${pki_dir}/requests/${fqdn}.csr":
    ensure      => 'present',
    private_key => "${pki_dir}/private/${fqdn}.pem",
  } ~>
  x509_cert { "${pki_dir}/certs/${fqdn}.pem":
    ensure      => 'present',
    private_key => "${pki_dir}/private/${fqdn}.pem",
    request     => "${pki_dir}/requests/${fqdn}.csr",
  }

}

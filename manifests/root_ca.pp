class foreman_certs::root_ca {

  if !$use_puppet_certs {
    openssl::certificate::authority { 'ca':
      pki_dir      => $foreman_certs::pki_dir,
      country      => $foreman_certs::country,
      organization => $foreman_certs::organization,
      state        => $foreman_certs::state,
      locality     => $foreman_certs::locality,
      common_name  => $fqdn,
      days         => $foreman_certs::ca_expiration,
      cnf_tpl      => 'foreman_certs/openssl.cnf.erb'
    }
  }

}

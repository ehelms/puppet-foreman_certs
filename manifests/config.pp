class foreman_certs::config {

  file { $foreman_certs::pki_dir:
    ensure => directory,
    owner  => 'foreman',
    group  => 'foreman',
    mode   => '0755',
  } ~>
  file { "${foreman_certs::pki_dir}/certs":
    ensure => directory,
    owner  => 'foreman',
    group  => 'foreman',
    mode   => '0755',
  } ~>
  file { "${foreman_certs::pki_dir}/private":
    ensure => directory,
    owner  => 'foreman',
    group  => 'foreman',
    mode   => '0755',
  } ~>
  file { "${foreman_certs::pki_dir}/openssl.cnf":
    ensure  => file,
    content => template('foreman_certs/openssl.cnf.erb'),
    owner   => 'foreman',
    group   => 'foreman',
    mode    => '0640'
  }

}

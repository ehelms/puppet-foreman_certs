# Manage your foreman server certificates
#
# === Parameters:
#
# $use_puppet_ca::  Whether to use Puppet as the certificate CA and not generate a custom,
#                   self-signed CA
#
class foreman_certs  (

  $use_puppet_certs = $::foreman_certs::params::use_puppet_certs,

) inherits foreman_certs::params {

  include ::openssl

  class { '::foreman_certs::root_ca': }

}

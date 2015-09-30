# Manage your foreman server certificates
#
# === Parameters:
#
# $use_puppet_ca::  Whether to use Puppet as the certificate CA and not generate a custom,
#                   self-signed CA
#
class foreman_certs  (

  $use_puppet_ca = foreman_certs::params::use_puppet_ca,

) inherits foreman_certs::params {

  class { '::foreman_certs::root_ca': }

}

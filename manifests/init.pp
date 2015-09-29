# Manage your foreman server certificates
#
# === Parameters:
#
# $log_dir::              When the log files should go
#
# $node_fqdn::            The fqdn of the host the generated certificates
#                         should be for
#
# $generate::             Should the generation of the certs be part of the
#                         configuration
#                         type: boolean
#
# $regenerate::           Force regeneration of the certificates (excluding
#                         ca certificates)
#                         type: boolean
#
# $regenerate_ca::        Force regeneration of the ca certificate
#                         type: boolean
#
# $deploy::               Deploy the certs on the configured system. False means
#                         we want apply it on a different system
#                         type: boolean
#
# $ca_common_name::       Common name for the generated CA certificate
#                         type: string
#
# $country::              Country attribute for managed certificates
#                         type: string
#
# $state::                State attribute for managed certificates
#                         type: string
#
# $city::                 City attribute for managed certificates
#                         type: string
#
# $org::                  Org attribute for managed certificates
#                         type: string
#
# $org_unit::             Org unit attribute for managed certificates
#                         type: string
#
# $expiration::           Expiration attribute for managed certificates
#                         type: string
#
# $ca_expiration::        Ca expiration attribute for managed certificates
#                         type: string
#
# $server_ca_cert::       Path to the CA that issued the ssl certificates for https
#                         if not specified, the default CA will be used
#
# $server_cert::          Path to the ssl certificate for https
#                         if not specified, the default CA will generate one
#
# $server_key::           Path to the ssl key for https
#                         if not specified, the default CA will generate one
#
# $server_cert_req::       Path to the ssl certificate request for https
#                         if not specified, the default CA will generate one
#
# $pki_dir::              The PKI directory under which to place certs
#
# $ssl_build_dir::        The directory where SSL keys, certs and RPMs will be generated
#
# $user::                 The system user name who should own the certs;
#
# $group::                The group who should own the certs;
#
# $password_file_dir::    The location to store password files
#
# $default_ca_name::      The name of the default CA
#
# $server_ca_name::       The name of the server CA (used for https)
#
class foreman_certs  (
  $pki_dir              = $foreman_certs::params::pki_dir,
  $country              = $foreman_certs::params::country,
  $state                = $foreman_certs::params::state,
  $city                 = $foreman_certs::params::city,
  $organization         = $foreman_certs::params::organization,
  $organizational_unit  = $foreman_certs::params::organizational_unit,

  $ca_expiration  = $certs::params::ca_expiration,
) inherits foreman_certs::params {

  class { '::foreman_certs::config': }

}

# Class: vpnc
#
# This module manages vpnc
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class vpnc {

    $secrets = hiera("secrets_vpnc", {})
    $user = $secrets["user"]
    $password = $secrets["password"]
    $secret = $secrets["secret"]

    if $user == "" or $password == "" or $secret == "" {
        fail("Some secrets are blank. Refusing to work to avoid overwriting
        your configuration. Please check your hieradata/secrets.yaml")
    }

    package { "vpnc":
        ensure    => present
    }

    file { "/etc/vpnc/":
        ensure => directory,
        owner  => root,
        group  => root,
        mode   => 700,
    }
}

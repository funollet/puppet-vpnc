define vpnc::profile (
  $id,
  $gateway,
  $secret,
  $username,
  $password,
  $options = {},
  $create_init = false,
  $on_boot = false,
) {

  file {"/etc/vpnc/${name}.conf":
    ensure  => file,
    content => template('vpnc/profile.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '600',
    require => Package['vpnc'],
  }

  if $create_init {

    file {"/etc/init.d/vpnc-${name}":
      ensure  => file,
      content => template('vpnc/initscript.erb'),
      mode    => '0755',
    }

    service {"vpnc-${name}":
      enable     => $onboot,
      hasrestart => false,
      hasstatus  => false,
      require    => File["/etc/init.d/vpnc-${name}"],
    }
  }

}

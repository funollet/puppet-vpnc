define vpnc::conf (
    $id,
    $gateway,
    $template = "vpnc/default.conf",
) {

    file { "${name}.conf":
        path    => "/etc/vpnc/${name}.conf",
        content => template($template),
        owner   => "root",
        group   => "root",
        mode    => 600,
    }

}

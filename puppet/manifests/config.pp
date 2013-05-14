class config {
    host {'self':
        ensure       => present,
        name         => $fqdn,
        host_aliases => ['puppet', $hostname],
        ip           => $ipaddress,
    }
        
    file {'motd':
        ensure  => file,
        path    => '/etc/motd',
        mode    => 0644,
        content => "Host: ${hostname}, OS: ${operatingsystem}, IP: ${ipaddress}\nVagrant config: vagrant-javadev-box | https://github.com/rob-murray/vagrant-javadev-box\n",
    }
}


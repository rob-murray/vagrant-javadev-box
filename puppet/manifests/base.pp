#
# base.pp
# Build Vagrant box configuration from modules
# 
# vagrant-javadev-box
# https://github.com/rob-murray/vagrant-javadev-box
#

# Include linux box config
include config

# Install latest jdk
class { 'java':
  distribution => 'jdk',
  version      => 'latest',
}

# Install and configure Postgresql
class { 'postgresql::server':
  config_hash => {
    'ip_mask_deny_postgres_user' => '0.0.0.0/32',
    'ip_mask_allow_all_users'    => '0.0.0.0/0',
    'listen_addresses'           => '*',
    'ipv4acls'                   => ['hostssl all johndoe 10.200.17.0/24 cert'],
    'manage_redhat_firewall'     => true,
    'postgres_password'          => 'letmein',
  },
}

# Install Maven to the vagrant users home dir and shell
maven::setup { "maven":
  ensure        => 'present',
  source        => 'apache-maven-3.0.5-bin.tar.gz',
  deploymentdir => '/home/vagrant/apache-maven',
  user          => 'vagrant',
  pathfile      => '/home/vagrant/.bashrc'
}

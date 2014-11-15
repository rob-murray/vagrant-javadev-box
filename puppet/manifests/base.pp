#
# base.pp
# Build Vagrant box configuration from modules
#
# vagrant-javadev-box
# https://github.com/rob-murray/vagrant-javadev-box
#


# Install latest jdk
class { 'java':
  distribution => 'jdk',
  version      => 'latest',
}

# Postgresql general config
class { 'postgresql':
  version => '9.3',
  manage_package_repo => true,
  charset => 'UTF8',
  locale  => 'en_US.UTF-8'
}

# Postgresql server config
class { 'postgresql::server':
  config_hash => {
    'ip_mask_deny_postgres_user' => '0.0.0.0/32',
    'ip_mask_allow_all_users'    => '0.0.0.0/0',
    'listen_addresses'           => '*',
    'manage_redhat_firewall'     => true,
    'postgres_password'          => 'change_me',
  },
}

# Postgresql database config
# If necessary, config here to build application specific database

# Install Maven to the vagrant users home dir and shell
maven::setup { "maven":
  ensure        => 'present',
  source        => 'apache-maven-3.2.3-bin.tar.gz',
  deploymentdir => '/home/vagrant/apache-maven',
  user          => 'vagrant',
  pathfile      => '/home/vagrant/.bashrc'
}

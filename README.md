vagrant-javadev-box
================

Build a basic Vagrant box set for Java development with Postgres and Maven installed via puppet.

## Installation

* If you haven't already, go over to [http://www.vagrantup.com/](http://www.vagrantup.com/) and follow the installation instructions
* Add the box `precise64` via `vagrant box add precise64 http://files.vagrantup.com/precise64.box`
* Clone this repo `git clone https://github.com/rob-murray/vagrant-javadev-box.git`
* Init the submodules `git submodule update --init`
* Download the Maven archive `apache-maven-3.0.5-bin.tar.gz` from [http://maven.apache.org](http://maven.apache.org) to `puppet/modules/maven/files` directory
* All done; `vagrant up`

## Usage

Feel free to customise further or use as is.

The directory `webapp` is sync'd to `/vagrant` so place your code in there and hack away.

Jump onto the VM by `vagrant ssh`.

E.g. `mvn -v` or `psql -h localhost -U postgres` to test installations

You may want to edit Postgres config.

Ports 8080 and 5432 are mapped to their respective ports on the VM.


## Installed modules

All as git submodules unless otherwise stated. Also not listing dependancies, only major modules.

* [Java](https://github.com/puppetlabs/puppetlabs-java)
* [Postgresql](https://github.com/puppetlabs/puppet-postgresql)
* [Maven](https://github.com/7terminals/puppet-maven)


## Contributions

Please use the GitHub pull-request mechanism to submit contributions.

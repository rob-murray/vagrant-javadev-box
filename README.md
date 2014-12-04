vagrant-javadev-box
================

Build a basic Vagrant box set for Java development with Jdk, Postgres and Maven installed via puppet.


## Installed modules

All as git submodules unless otherwise stated. Also not listing dependancies, only major modules.

* [Java : latest jdk](https://github.com/puppetlabs/puppetlabs-java)
* [Postgresql: 9.3](https://github.com/puppetlabs/puppet-postgresql)
* [Maven : 3.2.3](https://github.com/7terminals/puppet-maven)


## Installation

* If you haven't already, go over to [http://www.vagrantup.com/](http://www.vagrantup.com/) and follow the installation instructions
* Add the box `precise64` via `vagrant box add precise64 http://files.vagrantup.com/precise64.box`
* Clone this repo `git clone https://github.com/rob-murray/vagrant-javadev-box.git`
* Init the submodules `git submodule update --init`
* `mkdir -p puppet/modules/maven/files`
* Download the Maven archive `apache-maven-3.1.1-bin.tar.gz` from [http://maven.apache.org](http://maven.apache.org) to `puppet/modules/maven/files` directory
* All done; `vagrant up`


## Usage

Feel free to customise further or use as is.

The directory `project` is sync'd to `/vagrant` so place your code in there and hack away.

Ports 8080 and 5432 are mapped to their respective ports on the VM.

Jump onto the VM by `vagrant ssh`.

Test it out with `java -version`, `mvn -v` or `psql -h localhost -U postgres`.

You may want to edit Postgres config in the `puppet/manifests/base.pp` file.


## Changelog

#### 15-11-2014

* Update Postgres to 9.3
* Update Maven to 3.2.3
* Rename host project directory to `project`

#### 21-2-2014

* Update Postgres to 9.2
* Update Maven to 3.1.1
* Update Vagrant version 2 config.

#### 14-6-2013

* Add Postgres, Jdk and Maven.
* Initial commit with Vagrant version 1 config.


## Contributions

Please use the GitHub pull-request mechanism to submit contributions.

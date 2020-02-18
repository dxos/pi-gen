# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "debian/contrib-buster64"

  # TODO: investigate whethere we build docker on run here
  config.vm.provision "docker"

  # Install packages required for build directly
  config.vm.provision :shell, path: "bootstrap.sh"

end


# $run = <<"SCRIPT"
# echo ">>> Generating rpi image ... $@"
# export DEBIAN_FRONTEND=noninteractive
# export RPIGEN_DIR="${1:-/home/vagrant/rpi-gen}"
# export APT_PROXY='http://127.0.0.1:3142' 
# # Prepare. Copy the repo to another location to run as root
# rsync -a --delete --exclude 'work' --exclude 'deploy' /vagrant/  ${RPIGEN_DIR}/
# cd ${RPIGEN_DIR}
# # Clean previous builds. Start always from scratch (the proxy helps here!)
# sudo umount --recursive work/*/stage*/rootfs/{dev,proc,sys} || true
# # Delete old builds
# sudo rm -rf work/*
# # Build it again
# sudo --preserve-env=APT_PROXY ./build.sh
# # Copy images back to host
# [ -d deploy ] && cp -vR deploy /vagrant/
# SCRIPT

# Vagrant.configure("2") do |config|
#   # All Vagrant configuration is done here. The most common configuration
#   # options are documented and commented below. For a complete reference,
#   # please see the online documentation at vagrantup.com.  

#   config.vm.define :rpigen do |rpigen|
#       # Every Vagrant virtual environment requires a box to build off of.
#       rpigen.vm.box = "jriguera/rpibuilder-buster-10.1-i386"
#       rpigen.vm.provision "shell" do |s|
#         s.inline = $run
#         s.args = "#{ENV['WORK_DIR']}"
#       end
#   end
# end
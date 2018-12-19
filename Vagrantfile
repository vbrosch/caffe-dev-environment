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
  config.vm.box = "ubuntu/bionic64"

  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.disksize.size = '25GB'

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "8192"

    vb.customize ["modifyvm", :id, "--accelerate3d", "on", "--accelerate2dvideo", "on", "--vram", "256"]
  end

  config.vm.provision "file", source: "install_conda.sh", destination: "~/install_conda.sh"
  config.vm.provision "file", source: "make_caffe.sh", destination: "~/make_caffe.sh"
  config.vm.provision "file", source: "install_docker.sh", destination: "~/install_docker.sh"
  config.vm.provision "file", source: "install_pycharm.sh", destination: "~/install_pycharm.sh"

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y ubuntu-desktop virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 git apt-transport-https ca-certificates curl software-properties-common zsh fonts-powerline

     echo "Making caffe script executable"
     chmod +x /home/vagrant/make_caffe.sh

     echo "Installing docker..."
     chmod +x /home/vagrant/install_docker.sh
     /home/vagrant/install_docker.sh

     echo "Installing PyCharm..."
     chmod +x /home/vagrant/install_pycharm.sh
     /home/vagrant/install_pycharm.sh

     echo "Copying conda script"
     chmod +x /home/vagrant/install_conda.sh

     echo "Activating VBoxClient extensions..."
     VBoxClient --clipboard
     VBoxClient --display
     VBoxClient --draganddrop
     VBoxClient --checkhostversion
     VBoxClient --check3d
     VBoxClient --seamless
     VBoxClient --vmsvga

     service gdm3 start
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo "Cloning and making of caffe..."
    /home/vagrant/make_caffe.sh
    echo "Installing oh-my-zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "Setting agnoster theme"
    sed -i -e 's/robbyrussell/agnoster/g' /home/vagrant/.zshrc
    echo "Setting default shell to zsh"
    sudo chsh -s /bin/zsh vagrant
    echo "Installing conda"
    /home/vagrant/install_conda.sh
  SHELL
end

# caffe-dev-environment
A vagrant box for easing the installation and development with caffe.

You'll find a preconfigured vagrant box with:
* Ubuntu 18.04. LTS
* Python 3.5-3.7 (available via [conda](https://conda.io))
* Caffe (recent version, directly build from source) for Python 3
* PyCharm Community Edition
* Docker
* GIT
* zsh as a default shell with oh-my-zsh installed

## Installation
Before running, you'll first have to [install vagrant](https://www.vagrantup.com/downloads.html), [VirtualBox](https://www.virtualbox.org/) and then additionally a vagrant plugin via the terminal: `$ vagrant plugin install vagrant-disksize`. Afterwards `cd` into the cloned repository and run `vagrant up`. This should automatically setup and configure the vm for you (please be patient, this can take a really long time).

It requires at least `8192 MB` RAM to run. If that is an issue, you can modify the line `vb.memory = "8192"` in the `Vagrantfile`.

After completion, you can login to the vm via `vagrant/vagrant` (Username, Password) and you'll find caffe in `~/caffe`, PyCharm in `/opt/pycharm-community-2018.1.3` and you can switch between the different python environments by using `conda activate python3.5`, `conda activate python3.6` and `conda activate python3.7`.

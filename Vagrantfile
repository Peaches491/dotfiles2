vagrant_box = ENV.fetch("DOTFILES_VAGRANT_BOX")
vagrant_disksize = ENV.fetch("DOTFILES_VAGRANT_DISKSIZE")
setup_dir = ENV.fetch("DOTFILES_SETUP_DIR")

is_ci = ENV.fetch("TRAVIS", false)
provision_step = ENV.fetch("DOTFILES_PROVISION_STAGE", "all")

Vagrant.configure("2") do |config|
  # Note: Make sure all listed plugins are installed in .travis.yml

  config.vm.box = vagrant_box

  config.vm.synced_folder './', '/vagrant', type: 'rsync'

  if not is_ci
    config.vm.provider "virtualbox" do |vm|
      config.vagrant.plugins = ["vagrant-disksize"]
      config.disksize.size = vagrant_disksize
      vm.memory = 4096
      vm.cpus = 2
    end
  else
    config.vm.provider "libvirt" do |vm|
    end
  end

  config.vm.provision "shell", inline: "ls -alh /"
  config.vm.provision "shell", inline: "ls -alh $HOME"

  # Setup as root user.
  if provision_step == "setup" or provision_step == "all"
    config.vm.provision "shell", inline: "/vagrant/#{setup_dir}/setup.sh"
  end
  # Configure as root user.
  if provision_step == "config" or provision_step == "all"
    config.vm.provision "shell", inline: "/vagrant/config/config.sh"
  end
  # Configure as non-root user.
  if provision_step == "config_root" or provision_step == "all"
    config.vm.provision "shell", inline: "/bin/su --command '/vagrant/config/config.sh' vagrant"
  end
end

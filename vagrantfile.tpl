Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.insert_key = false
end

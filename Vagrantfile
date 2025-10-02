Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  NET = "192.168.56."

  # Define your machines
  NODES = {
    elk:    {ip: 10, cpu: 3, mem: 8192},
    wazuh:  {ip: 11, cpu: 2, mem: 4096},
    ids:    {ip: 12, cpu: 2, mem: 3072},   # IDS will also have NAT (default)
    vpn:    {ip: 13, cpu: 1, mem: 1024},
    client: {ip: 14, cpu: 1, mem: 2048}
  }

  # Build each VM
  NODES.each do |name, r|
    config.vm.define name do |n|
      n.vm.hostname = name.to_s

      # Host-only NIC for lab traffic
      n.vm.network "private_network", ip: "#{NET}#{r[:ip]}"

      # NAT NIC is already created automatically by Vagrant (no need to define)

      n.vm.provider :virtualbox do |vb|
        vb.cpus = r[:cpu]
        vb.memory = r[:mem]
      end
    end
  end

  # Hook: after vagrant up, auto-sync keys into WSL ~/.vagrant_keys
  config.trigger.after :up do |trigger|
    trigger.name = "Sync Vagrant keys into WSL"
    trigger.run = {
      inline: "wsl bash -c 'cd /mnt/c/Users/ahmed/PFE/soc-lab && ./sync_keys.sh'"
    }
  end
end

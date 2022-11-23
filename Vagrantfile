MACHINES = {
    :master => {
        :box_name => "centos/7",
        :ip_addr => '192.168.1.2',
        :script => './master.sh'
    },
    :slave => {
        :box_name => "centos/7",
        :ip_addr => '192.168.1.3',
        :script => './slave.sh'
    },
}
 

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.define boxname do |box|
        config.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s
        box.vm.network "private_network", ip: boxconfig[:ip_addr], netmask: "255.255.255.0", virtualbox__intnet: "tensor"
        box.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        box.vm.provision "shell", inline: <<-SHELL
          echo -en "192.168.1.2 master\n192.168.1.3 slave\n\n" | sudo tee -a /etc/hosts
          sudo localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8
          sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
          sudo yum install -y postgresql13 postgresql13-server
          SHELL
        box.vm.provision "shell", path: boxconfig[:script]
    end
  end
end

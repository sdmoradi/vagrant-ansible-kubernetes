IMAGE_NAME = "bento/ubuntu-20.04"
$instance_name_prefix ||= "k8s"
$num_instances ||= 3
$vm_memory ||= 12288
$vm_cpus ||= 6
$Ex_disk_size ||= 50

Vagrant.configure("2") do |config|
  (1..$num_instances).each do |i|
    config.vm.box = IMAGE_NAME
    config.vm.define vm_name = "%s-%01d" % [$instance_name_prefix, i] do |node|
      node.vm.provider :virtualbox do |vb|
        vb.memory = $vm_memory
        vb.cpus = $vm_cpus
        file_disk = "/DataStore/Extera_disk_#{i}.vdi"
        vb.customize ['createhd', '--filename', file_disk, '--size', $Ex_disk_size * 1024]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_disk]
      end
      node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
      node.vm.hostname = "k8s-#{i}"
      if i == $num_instances
        node.vm.provision "ansible" do |ansible|
          ansible.playbook = "cluster.yaml"
          ansible.inventory_path = "hosts.ini"
          ansible.become = true
        end
      end
    end
  end
end

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|
  config.vm.define "pycharm-test" do |a|
    a.vm.provider "docker" do |d|
	  d.vagrant_machine = "dockerhost2"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
	  
      d.build_dir = "."
      d.build_args = ["-t=pycharm-test"]
      d.ports = ["33:22"]
      d.name = "pycharm-test2"
      d.remains_running = false
      #d.has_ssh = true
      #d.cmd = ["vertx", "run", "vertx-examples/src/raw/java/httphelloworld/HelloWorldServer.java"]
      d.volumes = ["/vagrant/:/home/docker/pycharm-test"]
    end
  end
end

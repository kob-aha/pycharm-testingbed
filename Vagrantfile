ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|
  config.vm.define "pycharm-test" do |a|
    a.vm.provider "docker" do |d|
	  d.vagrant_machine = "dockerhost"
      d.vagrant_vagrantfile = "./DockerHostVagrantfile"
	  
      d.build_dir = "."
      d.build_args = ["-t=pycharm-test"]
      d.ports = ["8080:8080"]
      d.name = "pycharm-test"
      d.remains_running = false
      #d.cmd = ["vertx", "run", "vertx-examples/src/raw/java/httphelloworld/HelloWorldServer.java"]
      #d.volumes = ["/src/vertx/:/usr/local/src"]	  
    end
  end
end
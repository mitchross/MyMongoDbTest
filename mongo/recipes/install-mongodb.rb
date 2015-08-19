bash "install_mongodb_custom" do
	interpreter "bash"
	user "root"
	code <<-EOH
		echo "Installing MongoDB" &&
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 2>&1 &&
		echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' 2>&1 | sudo tee /etc/apt/sources.list.d/mongodb.list 2>&1 &&
		sudo apt-get -y update 2>&1 && 
		sudo apt-get -y install mongodb-10gen 2>&1 &&
		echo "Installed MongoDB"

		sudo sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/' /etc/mongod.conf &&
		echo "start Mongo" 2>&1
		sudo service mongodb stop 2>&1
		sudo service mongod -f /etc/mongodb.conf start 2>&1
	EOH
end
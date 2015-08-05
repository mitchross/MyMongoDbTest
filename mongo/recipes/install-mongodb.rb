bash "install_mongodb_custom" do
	interpreter "bash"
	user "root"
	code <<-EOH
		echo "Installing MongoDB" &&
		apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 &&
		echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list &&
		apt-get -y update &&
		# Install MongoDB 2.6, not the old 2.4 installed by mongodb-10gen
		apt-get install -y mongodb-org &&
		echo "Installed MongoDB"

		sudo sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/' /etc/mongod.conf &&
		echo "start Mongo"
		stop mongod
		sudo service mongod -f /etc/mongodb.conf start
	EOH
end
bash "install mongodb" do
user "root"
code <<-EOH
echo "Installing MongoDB" &&
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 &&
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list &&
apt-get -y update &&
# Install MongoDB 2.6, not the old 2.4 installed by mongodb-10gen
apt-get install -y mongodb-org &&
echo "Installed MongoDB"
echo "start Mongo"
stop mongod
sudo service mongod start
EOH
end
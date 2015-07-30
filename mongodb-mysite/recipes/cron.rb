package 's3cmd' do
  action :install
end

package 'mongodb-org-tools' do
  action :install
end

package 'mongodb-org-shell' do
  action :install
end

template 'mongobackup.sh' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    path "/etc/cron.daily/mongobackup.sh"
  when 'debian','ubuntu'
    path "/etc/cron.daily/mongobackup.sh"
  end
  source 'mongobackup.sh.erb'
  owner 'root'
  group 'root'
  mode 0744
end

template 's3cfg.sh' do
  case node[:platform]
  when 'centos','redhat','fedora','amazon'
    path "/root/.s3cfg"
  when 'debian','ubuntu'
    path "/root/.s3cfg"
  end
  source 's3cfg.erb'
  owner 'root'
  group 'root'
  mode 0600
end

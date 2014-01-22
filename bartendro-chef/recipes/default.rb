# nginx and uwsgi
cookbook_file "/etc/uwsgi/apps-available/bartendro.ini" do
  source "bartendro.ini"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/nginx/sites-available/default" do
  source "nginx-default"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  group "root"
  owner "root"
  mode "0755"
end

link "/etc/nginx/sites-enabled/default" do
  to "/etc/nginx/sites-available/default"
end

git "/home/bartendro/bartendro" do
   repository "https://github.com/partyrobotics/bartendro.git"
   action :sync
end

execute "checkout master" do
  command "git checkout master"
  cwd "/home/bartendro/bartendro"
end

execute "copy bartendro.db" do
  command "cp /home/bartendro/bartendro/ui/bartendro.db.default /home/bartendro/bartendro/ui/bartendro.db"
end

execute "chown bartendro.db" do
  command "chown -R bartendro:bartendro /home/bartendro/bartendro"
end

link "/etc/uwsgi/apps-enabled/bartendro.ini" do
  to "/etc/uwsgi/apps-available/bartendro.ini"
end

service "uwsgi" do
  action :restart
end

service "dnsmasq" do
  action :restart
end

service "hostapd" do
  action :restart
end

service "nginx" do
  action :restart
end

# must be run after reboot
user "pi" do
    action :remove
end

bash "set the time, save to hardware clock" do
  code <<-EOL
  ntpdate ntp.ubuntu.com
  hwclock -w
  EOL
end

# nginx and uwsgi
cookbook_file "/etc/nginx/sites-enabled/default" do
  source "nginx-default"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/uwsgi/apps-available/bartendro.ini" do
  source "bartendro.ini"
  group "root"
  owner "root"
  mode "0755"
end


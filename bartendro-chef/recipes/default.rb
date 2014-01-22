include_recipe "sudo"
package "libshadow-ruby1.8"

user "bartendro" do
    comment "Bartendro"
    home "/home/bartendro"
    supports :manage_home => true
    shell "/bin/bash"
    password "$6$gknhrhy8$BH4nVjq4QMk0HOw1GSjbo.7K17zTuuD6OCMDMildlbjRdrKsfHjPi3UUbbZgk.BmmuQl3th8TpmdQMb1fHB9D."
end

sudo "bartendro" do
    user "bartendro"
end

user "pi" do
    action: remove
end

directory "/usr/local/logstash" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

# run this
ntpdate
sudo hwclock -w

# install specific system files
cookbook_file "/boot/cmdline.txt" do
  source "cmdline.txt"
  group "root"
  owner "root"
  mode "0755"
end
cookbook_file "/etc/inittab" do
  source "inittab"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/modules" do
  source "modules"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/modprobe.d/raspi-blacklist.conf" do
  source "raspi-blacklist.conf"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/rc.local" do
  source "rc.local"
  group "root"
  owner "root"
  mode "0755"
end

# install networking related files
cookbook_file "/etc/hosts" do
  source "hosts"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/network/interfaces" do
  source "interfaces"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/iptables.rules" do
  source "iptables.rules"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/dnsmasq.conf" do
  source "dnsmasq.conf"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/hostapd/hostapd.conf" do
  source "hostapd.conf"
  group "root"
  owner "root"
  mode "0755"
end

cookbook_file "/etc/default/hostapd" do
  source "hostapd-default"
  group "root"
  owner "root"
  mode "0755"
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


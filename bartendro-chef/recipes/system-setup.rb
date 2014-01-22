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

directory "/etc/hostapd" do
  owner "root"
  group "root"
  mode 0755
  action :create
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

user "pi" do
    action: remove
end

bash "set the time, save to hardware clock" do
  code <<-EOL
  ntpdate ntp.ubuntu.com
  hwclock -w
  EOL
end

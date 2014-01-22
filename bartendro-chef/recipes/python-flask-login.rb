file_dir = "/root"
file_name = "Flask-Login-0.1.3.tar.gz"
file_path = File.join(file_dir,file_name)
uncompressed_file_dir = File.join(file_dir, file_name.split(".tar.gz").first)

directory file_dir do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

remote_file file_path do
  source "https://pypi.python.org/packages/source/F/Flask-Login/Flask-Login-0.1.3.tar.gz"
  mode "0644"
  not_if { File.exists?(file_path) }
end

execute "gunzip sqlalchemy" do
  command "gunzip -c #{file_name} | tar xf -"
  cwd file_dir
  not_if { File.exists?(uncompressed_file_dir) }
end

installed_file_path = File.join(uncompressed_file_dir, "installed")

execute "install python sqlalchemy module" do
  command "python setup.py install"
  cwd uncompressed_file_dir
  not_if { File.exists?(installed_file_path) }
end

execute "touch #{installed_file_path}" do
  action :run
end

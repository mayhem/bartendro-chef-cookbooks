package "nginx"
package "ntp"
package "uwsgi"
package "uwsgi-plugin-python"
package "python-werkzeug"
package "python-jinja2"
package "python-setuptools"
package "python-wtforms"
package "python-serial"
package "python-smbus"
package "python-sqlite"
package "python-sqlalchemy"
package "memcached"
package "python-memcache"
package "python-rpi.gpio"
package "python-flask"
package "sqlite3"

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


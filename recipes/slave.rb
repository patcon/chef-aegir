#
# Cookbook Name:: aegir
# Recipe:: slave
#
# Copyright 2011, Patrick Connolly (Myplanet Digital)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#



%w{ apt rsync apache2 apache2::mod_php5 apache2::mod_rewrite php php::module_mysql mysql::client postfix sudo }.each do |recipe|
  require_recipe recipe
end

user "aegir" do
  system true
  home "/var/aegir"
  gid "www-data"
  shell "/bin/sh"
end

link "#{node[:apache][:dir]}/conf.d/aegir.conf" do
  to "/var/aegir/config/apache.conf"
end

#
# Cookbook Name:: aegir
# Recipe:: package
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

apt_repository "koumbit-stable" do
  uri "http://debian.koumbit.net/debian"
  components ["stable", "main"]
  key "http://debian.koumbit.net/debian/key.asc"
  action :add
end

apt_repository "debian-backports" do
  uri "http://backports.debian.org/debian-backports"
  components ["squeeze-backports", "main"]
  action :add
end

bash "Creating pref for deb backports apt repo (drush)" do
  cwd "/etc/apt"
  code <<-EOH
  echo "Package: drush" > preferences
  echo "Pin: release a=squeeze-backports" >> preferences
  echo "Pin-Priority: 1001" >> preferences
  EOH
end

require_recipe "apt"

package "aegir"

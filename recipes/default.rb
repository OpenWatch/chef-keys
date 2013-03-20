<<<<<<< HEAD
dir = "/home/#{ node['keys']['user'] }/.ssh"

directory dir do
  owner #{ node['keys']['user'] }
  group #{ node['keys']['user'] }
=======
dir = node[:keys][:path]

directory dir do
  owner node[:keys][:user]
  group node[:keys][:group]

>>>>>>> 3a9f5b9af47fb0c0e09b19a819569cdb3062509d
  action :create
end

data_bag_item( "#{ node['keys']['databag'] }", "#{ node['keys']['key_name'] }" ).each do |k, v|
 next unless k.match(/^id_/)

  file "#{dir}/#{k}" do
    owner #{ node['keys']['user'] }
    group #{ node['keys']['user'] }
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end

data_bag_item( "#{ node['keys']['databag'] }", "#{ node['keys']['key_name'] }" ).each do |k, v|
  next unless k.match(/^known_/)

  file "#{dir}/#{k}" do
    owner #{ node['keys']['user'] }
    group #{ node['keys']['user'] }
    content v
  end
end

dir = "/root/.ssh"

directory dir do
  owner "root"
  group "root"
  action :create
end


data_bag_item( "#{ node['keys']['databag'] }", "#{ node['keys']['key_name'] }" ).each do |k, v|
  next unless k.match(/^id_/)

  file "#{dir}/#{k}" do
<<<<<<< HEAD
    owner "root"
    group "root"
=======
    owner node[:keys][:user]
    group node[:keys][:group]
>>>>>>> 3a9f5b9af47fb0c0e09b19a819569cdb3062509d
    mode k.match(/\.pub$/) ? "644" : "600"
    content v
  end
end

data_bag_item( "#{ node['keys']['databag'] }", "#{ node['keys']['key_name'] }" ).each do |k, v|
  next unless k.match(/^known_/)

  file "#{dir}/#{k}" do
    owner "root"
    group "root"
    content v
  end
end

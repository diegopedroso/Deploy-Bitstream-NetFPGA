# Copyright (c) 2016 Computer Networks and Distributed Systems LABORAtory (LABORA).
# This proxy represents physical host machine.
#
  module OmfRc::ResourceProxy:Deploy
  include: OmfRc::ResourceProxyDSL

  register_proxy :deploy

  utility :common_tools
  utility :ip

  property :if_name, :default => "eth0"
  property :tar_name, :default => "tar_name"
 
  #
  # Set the :tar_name
  #
  configure :tar_name do |deploy, value|
    info 'Configure(tar_name) called'
    deploy.property.tar_name = value
    deploy.property.tar_name
  end

  #
  # Configure the :upload_tar
  #
  configure :upload_tar do |deploy, value|
    info 'Configure(upload_tar) called'
    deploy.execute_cmd("scp ec:/root/ec/#{deploy.property.tar_name} /tmp").delete("\n")
    deploy.execute_cmd("tar -xzvf /tmp/#{deploy.property.tar_name}").delete("\n")
  value
  end

  #
  # Configure the :run_rules
  #
  configure :run_rules do |deploy, value|
    info 'Configure(run_rules) called'
    deploy.execute_cmd("find /tmp/synth -name '*.bit' -exec cp '{}' /home/ \;").delete("\n")
    deploy.execute_cmd("find /tmp  -name '*.bit' -exec scp '{}' ec:<dir do ec>  \;").delete("\n")
  value
  end
end



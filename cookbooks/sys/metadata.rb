maintainer       "RightScale, Inc."
maintainer_email "support@rightscale.com"
license          "All rights reserved"
description      "Installs/Configures RightScale system utilities."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "sys::do_reconverge_list_enable", "Enable list of recipes to run every 15 minutes."
recipe "sys::do_reconverge_list_disable", "Disable recipe reconverge list."
recipe "sys::install_swap_space", "Install swap space."

attribute "sys/reconverge_list",
  :display_name => "Reconverge List",
  :description => "A space-separated list of recipes to run every 15 minutes.  This is used to enforce system consistency.  Ex: app::do_firewall_request_open lb_haproxy::do_attach_all",
  :required => "optional",
  :default => "",
  :recipes => [ "sys::default", "sys::do_reconverge_list_enable", "sys::do_reconverge_list_disable" ]

attribute "sys/swap_size",
  :display_name => "Swap size (GB)",
  :description => "Create and install swap file.  Select '0' to disable swap.",
  :type => "string",
  :choice => ["0","2.0"],
  :default => "0",
  :recipes => [ "sys::install_swap_space"]

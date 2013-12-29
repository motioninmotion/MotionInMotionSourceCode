require 'osx/plist'

Given(/^location services are turned (on|off)$/) do |location_switch|
  quit_simulator
  sleep 10 # wait for simulator to quit - unfortunate
  key = 'com.yourcompany.FMLL'
  sdk = '7.0'
  location_clients_plist = "#{ENV['HOME']}/Library/Application Support/iPhone Simulator/#{sdk}/Library/Caches/locationd/clients.plist"
  clients_list, format = OSX::PropertyList.load_file(location_clients_plist, true)
  clients_list[key]['Authorized'] = (location_switch == 'on' ? true : false)
  OSX::PropertyList.dump_file(location_clients_plist, clients_list, format)
end
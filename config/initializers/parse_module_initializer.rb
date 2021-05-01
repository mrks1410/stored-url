unless FileTest.exist? Rails.root.to_s + '/app/parse_modules/load-module-config.xml'
    puts '[error]: config file (load-module-config.xml) not found.'
    puts '[note]: please following command will be run.'
    puts '    rails module:create_config'
    exit!
end

ParseModule::ParseModule.instance

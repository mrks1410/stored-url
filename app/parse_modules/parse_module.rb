require 'singleton'
require 'rexml/document'

module ParseModule
    class ParseModule
        include Singleton

        def initialize
            path = File.dirname(__FILE__) + '/' + 'load-module-config.xml'
            conf = REXML::Document.new(File.new(path))
            # insert struct to array
            @module_set = Set.new
            Struct.new("Module", :instance, :module_name, :class_name)
            conf.elements.each 'Modules/Module' do |element|
                module_name = element.elements['ModuleName'].text
                class_name = element.elements['ClassName'].text
                @module_set.add?(Struct::Module.new(nil, module_name, class_name))
            end

            #puts module_set

            # convert module_set to each module instance from Struct::Module
            @module_set.map! do |mod|
                if mod.instance == nil
                    Object.const_get(mod.module_name + '::' + mod.class_name).new
                end
            end

            #puts module_set
=begin
            module_set.map! do |mod|
                puts mod.parse
            end
            a = Object.const_get('Example::Example').new
            # a = Example::Example.new
            puts a.parse
            puts 'ok!'
=end
        end

        def parse(uri)
            @module_set.each do |mod|
                if mod.match_check uri
                    return mod.parse uri
                end
                # base module return
            end
        end
    end
end
namespace :module do
    desc 'generate configuration for parsing module.'
    task :create_config do
        config_text = <<-EOS
<!-- for template
    <Module>
        <ModuleName></ModuleName>
        <ClassName></ClassName>
    </Module>
-->

<Modules>
    <!-- for example
    <Module>
        <ModuleName>Example</ModuleName>
        <ClassName>Example</ClassName>
    </Module>
    -->

    <!-- add here your custom modules. -->

    <!--
        DO NOT EDIT BELOW LINES.
        A module that is imported by default.
        If added your cutom module, it's not working because the Regexp of this module as .*.
    -->
    <Module>
        <ModuleName>Base</ModuleName>
        <ClassName>Parse</ClassName>
    </Module>
</Modules>
        EOS
        path = Rails.root.to_s + '/app/parse_modules/load-module-config.xml'
        unless FileTest.exist? path
            File.open(path, 'w') do |file|
                file.print(config_text)
            end
        else
            puts '[note]: config file already exist. be skipped.'
        end
    end
end

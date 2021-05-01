module Example
    class Example
        REG_URI = /^example$/

        def parse(uri)
            'example'
        end

        def match_check(uri)
            reg_uri = /^example$/
            begin
                return unless reg_uri === uri
            rescue TypeError
                false
            end
            true
        end
    end
end
require 'json'
require 'open-uri'

module Base
    class Parse
        def parse(url)
            opt = {}
            opt['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36'
    
            begin
                charset = nil
                html = URI.open(url) do |f|
                    charset = f.charset
                    f.read
                end
                doc = Nokogiri::HTML(html, nil, charset)
                title = doc.title
                puts title
                return title
            rescue OpenURI::HTTPError => error
                error.io.status
            end
        end

        def match_check(uri)
            reg_uri = /.*/
            begin
                return unless reg_uri === uri
            rescue TypeError
                false
            end
            true
        end
    end
end
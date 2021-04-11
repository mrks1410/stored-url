require('json')

class UrlController < ApplicationController
    def new
    end

    def create
        Thread.new {
            hash = JSON.parse(params[:upload].read)
            hash['url_list'].each do |url_str|
                title = get_title url_str
                url = Url.new(url: url_str, title: title)
                url.save
            end
        }

        redirect_to '/url/new'
    end

    def get_title(url)
        opt = {}
        opt['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36'
        
        case url
        when /^https:\/\/twitter.com\/.*/ then
            return 'twitter.com'
        else
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
            rescue => error
                puts error
            end
        end
    end
end
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
        ParseModule::ParseModule.instance.parse url
=begin        
        case url
        when /^https:\/\/twitter.com\/.*/ then
            return 'twitter.com'
        else
        end
=end
    end
end
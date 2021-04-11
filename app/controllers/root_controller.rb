require 'open-uri'
require 'nokogiri'

class RootController < ApplicationController
    def index
        @urls = Url.where.not(title: nil)
    end
end

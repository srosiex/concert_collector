require 'open-uri'
require 'nokogiri'

class Scraper


@img_url = ''
    def self.image_url
       @img_url
    end

    def self.scrape_image(url)
        doc = Nokogiri::HTML(open(url))
        doc.css("div.header-new-background").each do |i|
        @img_url << i.css('div.header-new-background-image').attr('content').value
    end
end

 

end
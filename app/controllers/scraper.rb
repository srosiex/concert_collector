
class Scraper

URL = "https://www.last.fm/music/"


    def self.image_url
       @img_url
    end

    def self.scrape_image(url)
        html = open(url)
        doc = Nokogiri::HTML(html)
        doc.css("div.header-new-background").each do |i|
        @img_url = i.css('div.header-new-background-image').attr('content').value
    end
end

    def self.scrape
        html = open(url)
        doc = Nokogiri::HTML(html)
        doc.css("div.header-new-background").each do |i|
            @img_url = i.css('div.header-new-background-image').attr('content').value

        end
    end

end
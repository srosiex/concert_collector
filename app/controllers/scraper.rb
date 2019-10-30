
class Scraper

URL = "https://www.last.fm/music/"

@img_url = ''


    def self.image_url
        @image_url
    end

    def run
        html = open("https://www.last.fm/music/")
        doc = Nokogiri::HTML(html)
        doc.css("div.header-new-background").each do |i|
            @img_url = i.css('div.header-new-background-image').attr('content').value
        binding.pry
        end
    end

end
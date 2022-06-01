class Guitar
    attr_accessor :model, :url, :price

    @@all = []

    def initialize(details)
        details.each do |key, value|
            send("#{key}=", value)
        end
        @@all << self
    end

    def item_desc
        puts "===#{@model.upcase}==="
        Scraper.new.scrape_content(@url)
        puts ""
        puts "~Price (AUD)~"
        puts ""
        puts @price
    end

    def self.all
        @@all
    end
end
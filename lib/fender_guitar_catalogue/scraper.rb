class Scraper

    GUITAR_TYPE = { 
        "bass" => "electric-basses/?start=0&sz=200",
        "electric" => "electric-guitars/?start=0&sz=200",
        "acoustic" => "acoustic-guitars/?start=0&sz=200"
    }
    
    BASE_URL = "https://www.fender.com/en-AU/"

    def get_page(url = BASE_URL)
        Nokogiri::HTML(URI.open(url))
    end

    def scrape(type)
        doc = get_page(url = "#{BASE_URL}#{GUITAR_TYPE[type]}")
    
        doc.css(".product-tile").each.with_index(1).map do |guitar, i|
            model = guitar.css(".pdp-link").text.strip
            price = guitar.css(".price").text.strip
            url = guitar.css("a.product-tile-image").attr("href").value

            puts "#{i}. #{model}"
            Guitar.new(model: model, price: price, url: url)
        end
    end

    def scrape_content(url)
        page_url = "#{BASE_URL}#{url}"
        doc = get_page(page_url)

        puts "#{doc.css(".row.long-description p").text.strip.gsub("Click here to learn more about this artist model.", "")}"
        puts ""
        puts "~Features~"
        puts ""
        li = "#{doc.css(".js-feature-bullets li")}"
        puts li.gsub("<li>","* ").gsub("</li>","")
    end

end
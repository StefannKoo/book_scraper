module Extractors
    class Amazon
        def initialize
        end

        def extract(response,book_platform)
            puts "<<<<<<<<<<<<<<<<<<<<<<DAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
             parsed= Nokogiri::HTML(response)
            # titles = parsed.search('.s-result-item')
            puts response
            # titles.each do |tile|
            #     name=tile.search('.product-shelf-info .product-shelf-title a').text
            #     image= tile.search('.product-image-container .product-shelf-image-cont .product-shelf-image a img').attr('src')
            #     url=tile.search('.product-shelf-image-cont .product-shelf-image a').attr('href')
            #     puts name

            # end
            # parsed.search('.product-shelf-info .product-shelf-title a').each do |el|
            #     puts el.text
            # end
        end
    end
end
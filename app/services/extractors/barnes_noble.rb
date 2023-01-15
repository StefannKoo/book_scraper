require 'open-uri'
require 'nokogiri'
module Extractors
    class BarnesNoble

        def initialize
        end
        def extract(response,book_platform)

            platform_book=PlatformBook.find(book_platform)
            platform_book.state_machine.transition_to(:locating)
            begin
            parsed= Nokogiri::HTML(response)
            titles = parsed.search('.product-shelf-tile-book')
            titles.each do |tile|
                name=tile&.search('.product-shelf-info .product-shelf-title a').text
                image=tile.search('.product-shelf-image-cont .product-shelf-image a img').attr('src')
                url=tile.search('.product-shelf-image-cont .product-shelf-image a').attr('href')
               
                @location_candidate=LocationCandidate.new(name:name,image:image,url:url,platform_book_id:book_platform)
                 if @location_candidate.save
                    puts "radi"
                 else 
                    puts "Ne"
                 end
            end
            platform_book.transition_to(:located)
            rescue
                platform_book.transition_to(:error)
            end
            
        end
    end
end
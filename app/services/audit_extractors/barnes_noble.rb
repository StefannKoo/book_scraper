require 'open-uri'
require 'nokogiri'

module AuditExtractors
    class BarnesNoble
        def extract(response,platform_book,scan_id,audit_id)
             parsed=Nokogiri::HTML(response)
             price=parsed.css('.commerce-zone-section').css('.commerce-zone').css('.header-zone').css('.d-sm-none').css('.price-current-old-details').css('span').text
             image=parsed.css('.pdp-product-image-container').css('.pdp-product-image').css('a').css('img').attr('src')

             prices=parsed.css('.pdp-commerce-format')

             if price.match?(/Current price is (?<price>[$.\d]+),/)
                price=price.match(/Current price is (?<price>[$.\d]+),/)[:price]
             end
             
             if !audit_id
             audit=Audit.new(image:image,price:price,platform_book_id:platform_book.id,scan_id:scan_id)
             if audit.save
               create_or_refresh_prices(prices,audit.id)
             else
                puts "Unsave"
                puts scan_id
             end
            else
               create_or_refresh_prices(prices,audit_id)
            end
        end

        def create_or_refresh_prices(prices,audit_id)
            prices.each do |p|
               format=p.css('a').css('p').text.strip
               amount=p.css('a').css('span').text

               amount=amount.match(/\d+\.?\d+/)
               
               if format=="Paperback"
                  variant="paperback"
               elsif format=='Hardcover'
                  variant='hardcover'
               elsif format=='eBook'
                  variant='e_book'
               elsif format=='Audio CD' || format=='Audiobook'
                  variant='audio_cd'
               elsif format=='Large Print'
                  variant='large_print'
               else
                  variant='hardcover'
               end
                           
                  price=AuditPrice.new(audit_id:audit_id,amount:amount,variant:variant)
                  price.save!            
            end
        end
    end
end
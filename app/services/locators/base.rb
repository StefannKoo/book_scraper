module Locators
    class Base
        include HTTParty

        attr_reader :book_name,:platform,:book_platform
        def initialize(book_name,platform,book_platform)
            @book_name=book_name
            @platform=platform
            @book_platform=book_platform
        end
        
        def locate
            #Pozvati http reques ?
            puts "Url: #{self.request_configuration[:url]}"
            puts "RAddddddiii"
            response=HTTParty.get(self.request_configuration[:url],headers:headers)
            extractor.extract(response,book_platform)
        end
    end
end
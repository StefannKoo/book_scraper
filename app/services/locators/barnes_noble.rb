module Locators
    class BarnesNoble<Base
        require 'cgi'
        def request_configuration
            {
                method: :get,
                url: "https://www.barnesandnoble.com/s/#{CGI.escape(book_name)}",
               # proxy_api_key: api_key
            }
        end
        def responsible?
            platform.code.to_sym==:barnes_noble
        end      
        def extractor 
            @extractor||=Extractors::BarnesNoble.new
        end

        def headers
            {

            }
        end
        
    end
end
module AuditScans
    class Base
        include HTTParty

        attr_reader :platform_book,:platform,:scan_id,:audit_id
        def initialize(platform,platform_book,scan_id,audit_id)
           @platform=platform
           @platform_book=platform_book
           @scan_id=scan_id
           @audit_id=audit_id
        end
       
        def locate
            puts "LOCATE!!!!"
            puts request_configuration[:url]
            response=HTTParty.get(request_configuration[:url])
            extractor.extract(response,platform_book,scan_id,audit_id)
            
        end
        def url
            platform_book.url
        end
    end
end
module AuditScans
    class BarnesNoble<Base
        def request_configuration
            {
              url:"https://www.barnesandnoble.com/#{url}"
            }
        end
        def responsible?
            platform.code.to_sym==:barnes_noble
        end      
        def extractor 
            @extractor||=AuditExtractors::BarnesNoble.new
        end
    end
end
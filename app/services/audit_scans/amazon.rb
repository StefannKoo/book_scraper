module AuditScans
    class Amazon<Base
        def request_configuration
            {
              
            }
        end
        def responsible?
            platform.code.to_sym==:amazon
        end      
        def log
            puts "AMAZONS"
        end
    end
end
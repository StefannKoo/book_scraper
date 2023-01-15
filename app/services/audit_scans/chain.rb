module AuditScans
    class Chain
        def initialize
            @chain=[
                AuditScans::BarnesNoble,
                AuditScans::Amazon
            ]
        end
        def locate(platform,platform_book,scan_id,audit_id)
            @chain.each do |klass|
                locator=klass.new(platform,platform_book,scan_id,audit_id)
                if locator.responsible?
                    locator.locate 
                end
            end
        end
    end
end
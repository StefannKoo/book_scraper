class AuditScanWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(pb_id,scan_id,audit_id=nil)
        platform_book=PlatformBook.find(pb_id)
        platform=Platform.find(platform_book.platform_id)
        instance=AuditScans::Chain.new
        instance.locate(platform,platform_book,scan_id,audit_id)
    end
end
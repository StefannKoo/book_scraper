class AuditsController<ApplicationController

    def show 
        @audit=Audit.find(params[:id])
    end
    
    def reset
        audit=Audit.find(params[:id])
        if AuditPrice.where(audit_id:audit.id)&.destroy_all
            AuditScanWorker.perform_async(audit.platform_book.id,audit.scan_id,audit.id)
            redirect_to publisher_scan_audit_path(params[:publisher_id],params[:scan_id],params[:id])
        end
    end
end
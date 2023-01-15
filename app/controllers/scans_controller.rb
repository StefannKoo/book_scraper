class ScansController<ApplicationController

    require 'fast_excel'
    require 'date'

    def index
        @publisher=Publisher.find(params[:publisher_id])
        @scans=Scan.where(publisher_id:params[:publisher_id]).paginate(page: params[:page], per_page: 8)
    end
    def show
        @scan=Scan.find(params[:id])
        @publisher=Publisher.find(params[:publisher_id])
    end
    def create
        d=Time.now.strftime("%d/%m/%Y %H:%M")
        @publisher=Publisher.find(params[:publisher_id])
        scan=Scan.new(date:d,publisher_id:params[:publisher_id])
        if scan.save
            @publisher.books.each do |b|
                b.platform_books.each do |pb|
                    if pb.in_state?(:approved)
                        AuditScanWorker.perform_async(pb.id,scan.id)
                    end
                end
            end
        end       
    end
    def analyze
       scan=Scan.find(params[:id])
       scan.audits.each do |a|
            a.audit_prices.each do |ap|   
                    platform_book=PlatformBook.find(a.platform_book_id)
                    platform_book.prices.each do |p|
                        if ap.variant==p.variant
                            if !ap.amount
                                action=AuditAction.new(price_id:p.id,audit_price_id:ap.id,audit_id:a.id,message:"There is no price for that format!")                       
                            elsif p.amount>ap.amount
                                action=AuditAction.new(price_id:p.id,audit_price_id:ap.id,audit_id:a.id,message:"Actual price is lower!")    
                            elsif p.amount<ap.amount
                                action=AuditAction.new(price_id:p.id,audit_price_id:ap.id,audit_id:a.id,message:"Actual price is higher!")    
                            end
                            AuditAction.find_by(price_id:p.id,audit_price_id:ap.id,audit_id:a.id)&.destroy
                            action.save
                        end
                    end
            end
       end
       redirect_to publisher_scan_path(params[:publisher_id],scan)
    end

    def export
        workbook = FastExcel.open("audit_info.xlsx", constant_memory: true)
        worksheet = workbook.add_worksheet("Example Report")
        worksheet.write_number(row = 0, col = 5, 1_234_567, format = nil)
        workbook.close
        puts workbook
        redirect_to publisher_scan_path(params[:publisher_id],params[:id])
    end
end
class PublisherPlatformsController<ApplicationController

    def create
        @publisher_platform=PublisherPlatform.new(publisher_id:params[:publisher_id],platform_id:params[:platform])
        if @publisher_platform.save
            redirect_to publisher_path(params[:publisher_id])
        else
            if !@publisher_platform.valid?
                flash[:notice]="That platform was added !"
                redirect_to publisher_path(params[:publisher_id])
            end
        end
    end
    def destroy
        puts params
    end
end
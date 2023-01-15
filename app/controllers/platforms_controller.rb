class PlatformsController<ApplicationController

    before_action :set_platform, only:[:edit,:update,:destroy]

    def index
        @platforms=Platform.includes(:territory)
    end

    def new
        @platform=Platform.new
    end

    def create
        @platform=Platform.new(platform_params.merge(territory_id:params[:territory][:territory_id]))
        if @platform.save
            redirect_to platforms_path
        else
            render:new
        end
    end

    def edit
    end

    def update
        
        if @platform.update(platform_params.merge(territory_id:params[:territory][:territory_id]))
            redirect_to platforms_path
        else
            render:edit
    
        end
    end

    def destroy
       # if !params[:publisher_id]
    #        @publisher_platform=PublisherPlatform.where(publisher_id:params[:id],platform_id:params[:publisher_id])
    #        if @publisher_platform.destroy
    #          puts "Obrisana platforma"
    #        else
    #        puts "Gresla pri brisanju "
    #       end
    #    else
    #        set_platform
           if @platform.destroy
                 flash[:notice]="Destroyed"
           else
                flash[:notice]="Not destroyed"
            end
            redirect_to platforms_path
      #  end
      #  end
       
    end
    
    private

    def set_platform
        @platform=Platform.find(params[:id])
    end

    def platform_params
        params.require(:platform).permit(:name,:code,:logo)
    end
end
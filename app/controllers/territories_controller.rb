class TerritoriesController<ApplicationController
    before_action :set_territory, only: [:edit,:update,:destroy]
    def index 
        @territories=Territory.all
    end

    def new 
        @territory=Territory.new
        @territory.platforms.build
    end

    def create 
        @territory=Territory.new(territory_params)
        if @territory.save && @territory.valid?
            flash[:notice]="The territory is added"
            redirect_to territories_path
        else
            flash[:notice]="There is some problems"
            redirect_to new_territory_path
        end
    end

    def edit
    end

    def update
       if @territory.update(territory_params)
        flash[:notice]="Territory is updated"
        redirect_to territories_path
       else
        flash[:notice]="Unsucess !"
        render:edit
       end
    end
    def destroy
        if @territory.destroy 
            flash[:notice]="Territory was destroyed"
        else
            flash[:notice]="Unable to delete #{@territory.name}"
        end
        redirect_to territories_path
    end

    private

    def territory_params
        params.require(:territory).permit(:name,:currency,:flag, platforms_attributes:[:name,:code,:logo])
    end

    def set_territory
        @territory=Territory.find(params[:id])
    end
end
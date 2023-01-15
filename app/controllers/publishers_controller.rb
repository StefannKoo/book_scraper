class PublishersController<ApplicationController
    before_action :set_publisher,  only: [:show,:destroy,:edit]

    def index     
        @publishers=Publisher.all  
    end  

    def new
        @publisher=Publisher.new
        @platform=Platform.new
    end

    def create
        @publisher=Publisher.new(publisher_params)

        if @publisher.save
            flash[:notice]='Publishes is sucessfull added !'
            redirect_to publishers_path
        else
            render :new,status: :unprocessable_entity
        end      
  
    end

    def show     
        @platform=Platform.new
    end

    def destroy

     # @books=Book.where(publisher_id:params[:id])
     if @publisher.destroy
        flash[:notice]="Publisher #{@publisher.name} was deleted sucessfully !"
        redirect_to publishers_path
     end
    end

    def edit
        
    end

    private 

    def publisher_params
        params.require(:publisher).permit(:name,:adress,:photo)
    end

    def set_publisher
        @publisher=Publisher.find(params[:id])
    end

end

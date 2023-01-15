class LocationCandidatesController<ApplicationController

    def index
    @publisher=Publisher.find(params[:publisher_id])
    if !params[:book_id]
      # @book_platform=BooksPlatforms.where(book_id:params[:book_id])
    else
        @book_platform=PlatformBook.where(book_id:params[:book_id])
       render:show
    end
        
    end

    def update

       platform_book=PlatformBook.find(params[:platform_book_id])
       location_candidate=LocationCandidate.find(params[:id])
       platform_book.name=location_candidate.name
       platform_book.url=location_candidate.url
       platform_book.image=location_candidate.image

       platform_book.transition_to(:approved)
       book=Book.find(platform_book.book_id)
       publisher=Publisher.find(book.publisher_id)

       if platform_book.save
             redirect_to publisher_location_candidates_path(publisher.id)
       else
            render:show
       end
    end
end
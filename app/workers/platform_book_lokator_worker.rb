   class PlatformBookLokatorWorker
        include Sidekiq::Worker
        sidekiq_options retry: false

        def perform(book_platform,search_term)
            book_platf=PlatformBook.find(book_platform)
            platform=Platform.find(book_platf.platform_id)
            instance=Locators::Chain.new
            instance.locate(search_term,platform,book_platform)
        end
    end


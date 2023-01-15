module Locators
    class Chain
        def initialize
            @chain=[
                Locators::BarnesNoble,
                Locators::Amazon
            ]
        end
        def locate(book_name,platform,book_platform)
            @chain.each do |klass|
                locator=klass.new(book_name,platform,book_platform)
                if locator.responsible?
                    locator.locate #metoda za lociranje
                end
            end
        end
    end
end
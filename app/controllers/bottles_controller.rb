class BottlesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
        @bottle = Bottle.new 
    end
end

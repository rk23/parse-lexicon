class ErrorsController < ApplicationController
  	skip_before_filter :require_login

	def not_found
		respond_to do |format|
      format.html { render status: 404 }
   	end

   	def forbidden	
   		
   	end
  	rescue ActionController::UnknownFormat
    	render status: 404, text: "nope"
  end
end

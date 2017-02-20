class StaticPagesController < ApplicationController

	def home
		@user_id = params[:user_id] unless params[:user_id].blank?
	end

end

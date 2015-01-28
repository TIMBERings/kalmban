class HomeController < ApplicationController
  before_action :current_user

  def show
  	puts "Current User = #{@current_user}"
  	if @current_user
  		redirect_to(controller: 'boards', action: 'index')
   	end
  end
end

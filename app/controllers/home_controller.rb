class HomeController < ApplicationController
  before_action :current_user

  def show
  	puts "Current User = #{@current_user}"
  	if @current_user
  		redirect_to(controller: 'boards', action: 'index')
   	end
  end

  def about
    respond_to do |format|
      format.html
      format.js
    end
  end

  def contact

  end
end

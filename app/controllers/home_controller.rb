class HomeController < ApplicationController

=begin
  @apiVersion 0.1.0

  @apiGroup Home
  @api {get} /
  @apiName Home#get_index
  @apiDescription return index page
=end
  def get_index
    render :index
  end

end

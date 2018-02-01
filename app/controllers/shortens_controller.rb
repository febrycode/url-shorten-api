class ShortensController < ApplicationController

  def show
    shorten = Shorten.find_by_shortcode(params[:shortcode])

    if shorten.nil?
      render json: {
        error: true,
        message: 'Data not found'
      }, status: :not_found
    else
      render json: {
        error: false,
        Location: shorten.url
      }, status: :found 
    end
  end
end

class UrlsController < ApplicationController

	def index
		@url = Url.all
	end

	def show
		# byebug
    	@url = Url.find(params[:id])
	end

	def new
  		@url = Url.new
	end

	def create
		# @url = Url.new(params[:url])
		#<ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"9xuPsmao0l0of8Hg59BGZXwc3AyX5VbAsMt0Hx/XTXAk5V1n7U65TRehxlYSarHT1uFHYHfptmQa1I4Jkz0gwQ==", "url"=>{"long_url"=>"nutrivelo.com"}, "commit"=>"Shorten URL!", "controller"=>"urls", "action"=>"create"} permitted: false>
		@url = Url.new(url_params)
		@url.shorten
  		if @url.save
    		redirect_to @url  
  		else
    		render 'new'
  		end   
	end

	
	def destroy
    	@url = Url.find(params[:id])
    	@url.destroy
    	redirect_to urls_path
	end

	def short
    	url = Url.find(params[:id])
    	redirect_to url.long_url    	
	end 





	private 

	#strong parameters permits long_url to be exposed, no authenticity token
	#<ActionController::Parameters {"long_url"=>"nutrivelo.com"} permitted: true>
	def url_params
    	params.require(:url).permit(:long_url)
	end



end

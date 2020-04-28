class PagesController < ApplicationController
	def about
		@heading = 'About us'
		@text = 'Some text.'
	end
end

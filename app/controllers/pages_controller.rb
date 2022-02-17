class PagesController < ApplicationController

	def home
		puts params.inspect
		@gossips = Gossip.all
	end

	def welcome
		@first_name = params[:first_name]
		puts params[:first_name]
	end

	def gossips
		@gossips = Gossip.all
		@id = params[:id]
	end

	def team
	end

	def contacts
	end

end
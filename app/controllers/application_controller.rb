require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      # @team_name = params[:team][:name]
      # @team_motto = params[:team][:motto]
      #
      # @hero_name = []
      # @hero_power = []
      # @hero_bio = []
      #
      # @members = params[:team][:members]
      # @members.each do |m|
      #   @hero_name << m[:name]
      #   @hero_power << m[:power]
      #   @hero_bio << m[:bio]
      # end

      @team = Team.new(params[:team])
      members = params[:team][:members]
      @team_members = members.map do |hero_hash|
        SuperHero.new(name: hero_hash[:name], power: hero_hash[:power], bio: hero_hash[:bio])
      end
      
      erb :team
    end


end

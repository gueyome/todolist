class EmailsController < ApplicationController

  def index
    @emails=Email.all
  end

  def create
    @email=Email.create(object: Faker::Coffee.blend_name, body: Faker::ChuckNorris.fact)
    respond_to do |format|
      format.html { 
        redirect_to root }
      format.js {
        puts "******requete format JS"
      }
    end
  end

end

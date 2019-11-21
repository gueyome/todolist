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

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to email_path }
      format.js {
        puts "******OK JS****"
       }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    if @email.destroy
      respond_to do |format|
        format.html { redirect_to root }
        format.js {
          puts "******OK JS****"
         }
      end
    end
  end

end

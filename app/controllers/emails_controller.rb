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

  def update
    @email = Email.find(params[:id])
    puts "***"*60
    puts params
    if params[:origin] == "object"
      puts "#"*60
      puts "origin object"
      puts "#"*60
      @email.update(read: true)
    elsif params[:origin] == "btn"
      if @email.read == false
      puts "#"*60
      puts "origin btn false"
      puts "#"*60
        @email.update(read: true)
      else
      puts "#"*60
      puts "origin btn true"
      puts "#"*60
        @email.update(read: false)
      end
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

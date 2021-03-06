require 'twilio-ruby'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def home
  end
  def show
    @url = user_url(@user)
    @finder = User.new
    @message = Message.new
    if current_user.present?
      @messages = Message.where(owner_id: current_user.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_qrcode(@user)
      session[:user_id] = @user.id
      redirect_to(@user, :notice => 'Successfully created your acconut.  Here is your unique QR code to print and place on valuables!')
    else
      render :new
    end
  end

  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'Your profile has been sucessfully updated.'
      else
        render action: 'edit'
      end
    end

  def destroy
    @user.destroy
    redirect_to user_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :cell_number, :email, :password, :password_confirmation, :qrcode, :ip_address, :latitude, :longitude)
    end

  end

  # geolocation
  # delayed jobs
  # priettier emails
  # profile page
  # redo show page - break up in controller
  # annomoius email
  # fedex /wedeliver
  # lose a phone experiement
  # get stickers printer - api stickermuel
  # cooler qrcodes




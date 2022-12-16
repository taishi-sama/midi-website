class UserfilesController < ApplicationController
  before_action :authenticate_user
  def new
    @files = User.find(session[:user_id]).midi_files.all
  end
  def create

  end
  def delete

  end
end

class HomesController < ApplicationController

  def top
    flash[:success] = "signed out successfully."
  end
end

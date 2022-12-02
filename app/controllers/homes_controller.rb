class HomesController < ApplicationController
  # GET /homes
  def index
    return unless user_signed_in?

    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Logged in successfully' }
    end
  end
end

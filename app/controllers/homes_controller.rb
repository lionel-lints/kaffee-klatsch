class HomesController < ApplicationController
  layout 'home'
  before_action :authenticate

  def show
  end

end

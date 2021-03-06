class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  include Pundit
  def home
  end
  def first
  end

  def docs
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  include Pundit
  def home
  end
end

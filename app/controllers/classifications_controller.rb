class ClassificationsController < ApplicationController
  def index
    @classifications = Classification.all
  end
end

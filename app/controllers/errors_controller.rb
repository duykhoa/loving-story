class ErrorsController < ApplicationController
  include Gaffe::Errors

  layout 'errors'

  def show
  end
end

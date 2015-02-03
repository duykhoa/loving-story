class ErrorsController < ApplicationController
  include Gaffe::Errors

  layout 'errors'

  def show
    render '404'
  end
end

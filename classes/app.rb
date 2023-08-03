require 'singleton'
require_relative './usuario.rb'

class App
  include Singleton
  attr_reader :users, :current_user

  def initialize
    @users = []
    @current_user = nil
  end

  def register user
    @users << user
  end

  def login user
    @current_user = user
  end
end

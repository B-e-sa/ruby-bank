require 'singleton'
require_relative './usuario.rb'
require_relative './string.rb'

class App
  include Singleton
  attr_reader :users, :current_user

  def initialize
    @users = []
    @current_user = nil
  end

  def teste user
    @users << user
    @current_user = user
  end

  def register
    print "Seu nome: "
    nome = Logger::get_input

    while true
      print "Seu cpf: "
      cpf = Logger::get_input

      if cpf.match(/^(\d{3}).?(\d{3}).?(\d{3})-?(\d{2})$/)
        break
      end

      Logger::limpar
      puts "Seu nome: "
      Logger::log_line "> #{nome}"
      Logger::log_line "\n"
      Logger::log_line "* CPF Inválido\n".red
    end

    user = ::Usuario.new nome, cpf

    @users << user
    @current_user = user
  end

  def excluir_usuario
    @users.delete(current_user)
  end

  def login
    while true
      Logger::log_line 'Para entrar, insira o CPF de sua conta: '

      cpf = Logger::get_input

      App.instance.users.each do |item|
          if item.cpf == cpf
              return item
          end
      end

      Logger::limpar
      Logger::log 'Usuário não encontrado'
      Logger::User::deseja_continuar

      if Logger::get_input == 2
          return nil
      end

      Logger::limpar
    end

    @current_user = user
  end
end

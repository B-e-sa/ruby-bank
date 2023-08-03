require_relative './log'
require_relative '../classes/usuario'

module App 
    include Log

    module Usuario
        def self.cadastrar users
            print "Seu nome:"
            nome = Log::get_input

            print "Seu cpf:"
            cpf = Log::get_input

            users.push ::Usuario.new nome, cpf
        end

        def self.login users
            Log::User::insira_login
           
            names.each do |item|
                puts item
            end
        end
    end
end
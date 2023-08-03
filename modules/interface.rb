require_relative './Logger'
require_relative '../classes/usuario'

module Interface
    include Logger

    def self.init
        while true
            if App.instance.users.empty?
                Logger::User::nenhum_usuario_cadastrado

                if Logger::get_int == 1
                    Logger::limpar
                    Interface::Usuario::cadastrar

                    Logger::limpar
                    Logger::log 'Usuário cadastrado com sucesso!'
                end
            end

            #if !App.instance.current_user
                #currentUser = Interface::Usuario::login
            #end

            # O que deseja fazer ?
            #   1: Meu usuário
            #   2: Minha Conta
            #   3: Meus cartões
            #   4: Encerrar a aplicação
            Logger::limpar
            Logger::opcoes
            case Logger::get_int
            when 1
                # > Usuário
                #   - Nome: [nome]
                #   - CPF: [cpf]
                #
                # 1: Alterar meu nome
                # 2: Excluir meu usuário
                Logger::limpar
                App.instance.register 'pedrooo'
                puts App.instance.users
                Logger::User::informacao_usuario currentUser
                Logger::User::opcoes

                if Logger::get_int == 1
                    Logger::log_line 'Seu novo nome: '
                    currentUser.trocar_nome Logger::get_input
                    Logger::log 'Nome alterado com sucesso!'
                    next
                else
                    # TODO:
                end
            when 2
                # > Conta
                #   1: Adicionar saldo
                #   2: Retirar dinheiro
                Logger::limpar
                Logger::Conta::opcoes

                if Logger::get_int == 1
                    Logger::log_line 'Insira o valor que deseja adicionar: '
                    currentUser.conta.adicionar_saldo Logger::get_int
                else
                    Logger::log_line 'Insira o valor que deseja retirar: '
                    currentUser.conta.subtrair_saldo Logger::get_int
                end
            when 3
                # > Cartões
                #   1: Consultar informações de um cartão
                #   2: Criar novo cartão
                Logger::limpar
                Logger::Cartao::opcoes

                if Logger::get_input == 1

                else

                end
            else
                break
            end

            break
        end
    end

    module Usuario
        def self.cadastrar
            print "Seu nome: "
            nome = Logger::get_input

            print "Seu cpf: "
            cpf = Logger::get_input

            App.instance.register ::Usuario.new nome, cpf
        end

        def self.login
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
        end
    end
end

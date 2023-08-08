require_relative './Logger'
require_relative '../classes/usuario'
require_relative '../classes/cartao'
require_relative '../modules/tipo_cartao'

module Interface
    include TipoCartao
    include Logger

    # O que deseja fazer ?
    #   1: Meu usuário
    #   2: Minha Conta
    #   3: Meus cartões
    #   4: Encerrar a aplicação
    def self.inicio
        Logger::limpar
        Logger::opcoes
    end

    # Ainda não há usuários cadastrados. Deseja criar um?
    #   1: Sim
    #   2: Não, sair
    def self.no_users
        Logger::limpar
        Logger::User::nenhum_usuario_cadastrado

        if Logger::get_int == 1
            Logger::limpar
            App.instance.register

            # Usuário cadastrado com sucesso!
            Logger::clear_n_log 'Usuário cadastrado com sucesso!'

            return 0
        else
            return nil
        end
    end

    # > Usuário
    #   - Nome: [nome]
    #   - CPF: [cpf]
    #
    # 1: Alterar meu nome
    # 2: Excluir meu usuário
    def self.usuario
        Logger::limpar
        Logger::User::informacao_usuario
        Logger::User::opcoes
    end

    # > Conta
    #   - Saldo atual: [saldo_atual]
    #   - Fatura Atual: [fatura_atual]
    #
    #   1: Adicionar saldo
    #   2: Retirar dinheiro
    def self.conta
        Logger::limpar
        Logger::Conta::informacao_conta
        Logger::Conta::opcoes
    end

    def self.cartao
        Logger::limpar
        Logger::Cartao::opcoes
    end

    module Cartao
        # > Cartão
        #  1: Consultar informações de um cartão
        #  2: Criar novo cartão
        #  3: Voltar ao início
        def self.loop
            while true
                Interface::cartao
                if Logger::get_int == 1
                    App.instance.current_user.cartoes.each do |cartao|
                        puts cartao.numero
                    end
                    Logger::log "Qual cartão deseja ver?"
                    Logger::get_input
                    return
                else
                    App.instance.current_user.adicionar_cartao ::Cartao.new TipoCartao::CREDITO
                    return
                end
            end
        end
    end

    module Conta
        def self.adicionar_saldo
            Logger::clear_n_log_line 'Insira o valor que deseja adicionar: '
            valorDiferenteDeZero = App.instance.current_user.conta.adicionar_saldo Logger::get_int

            Logger::limpar

            if !valorDiferenteDeZero
                Logger::log_line "Você não pode adicionar um saldo nulo"
                return
            end

            Logger::log 'Saldo adicionado com sucesso'
            Logger::log "Seu saldo atual: #{App.instance.current_user.conta.saldo_disponivel}"
            Logger::log_line "Você será redirecionado em 3s"
        end

        def self.retirar_saldo
            Logger::clear_n_log_line 'Insira o valor que deseja retirar: '

            temSaldoSuficiente = App.instance.current_user.conta.subtrair_saldo Logger::get_int
            if !temSaldoSuficiente
                Logger::clear_n_log 'Você não possui saldo suficiente para essa transação'
                return
            end

            Logger::limpar
            Logger::log_line 'Valor retirado com sucesso!'
        end

        def self.loop
            while true
                Interface::conta
                opcao = Logger::get_int
                if opcao == 1
                    Interface::Conta::adicionar_saldo
                    sleep 3
                elsif opcao == 2
                    Interface::Conta::retirar_saldo
                    sleep 3
                else
                    break
                end
            end
        end
    end

    module Usuario
        def self.alterar_nome
            Logger::clear_n_log_line 'Seu novo nome: '
            App.instance.current_user.trocar_nome Logger::get_input
            Logger::limpar
            Logger::log 'Nome alterado com sucesso! Você vai ser redirecionado em 3s'
        end

        def self.excluir
            Logger::limpar
            Logger::log 'Você está prestes a deletar seu usuário. Tem certeza disso?'
            Logger::tem_certeza

            if Logger::get_int == 1
                App.instance.excluir_usuario
                return
            end

            Logger::limpar
            Logger::log 'Exclusão cancelada. Voltando ao menu'
            sleep 3
        end

        def self.loop
            while true
                Interface::usuario
                opcao = Logger::get_int
                if opcao == 1
                    Interface::Usuario::alterar_nome
                    sleep 3
                elsif opcao == 2
                    Interface::Usuario::excluir
                    sleep 3
                    break
                else
                    break
                end
            end
        end
    end

    def self.init
        while true
            if App.instance.users.empty?
                deseja_se_logar = Interface::no_users
                if !deseja_se_logar
                    return
                end
            end

            if !App.instance.current_user
                Interface::Usuario::login
            end

            Logger::limpar
            Interface::inicio
            case Logger::get_int
            when 1
                Interface::Usuario::loop; next
            when 2
                Interface::Conta::loop; next
            when 3
                Interface::Cartao::loop; next
            else
                break
            end
        end
    end
end

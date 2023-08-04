require_relative './Logger'
require_relative '../classes/usuario'
require_relative '../modules/tipo_cartao'

module Interface
    include TipoCartao
    include Logger

    def self.init
        Logger::limpar
        while true
            # Ainda não há usuários cadastrados. Deseja criar um?
            #   1: Sim
            #   2: Não, sair
            if App.instance.users.empty?
                Logger::User::nenhum_usuario_cadastrado

                if Logger::get_int == 1
                    Logger::limpar
                    App.instance.register

                    # Usuário cadastrado com sucesso!
                    Logger::limpar
                    Logger::log 'Usuário cadastrado com sucesso!'
                end
            end

            if !App.instance.current_user
                Interface::Usuario::login
            end

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
                Logger::User::informacao_usuario
                Logger::User::opcoes

                if Logger::get_int == 1
                    Logger::log_line 'Seu novo nome: '
                    App.instance.current_user.trocar_nome Logger::get_input
                    Logger::log 'Nome alterado com sucesso!'
                    next
                else
                    Logger::log 'Você está prestes a deletar seu usuário. Tem certeza disso?'
                    Logger::tem_certeza

                    if Logger::get_int == 1
                        App.instance.excluir_usuario
                        next
                    end

                    # TODO:
                    # Voltar ao menu de usuário
                    # await de 3s
                    Logger::log 'Exclusão cancelada. Voltando ao menu'
                    next
                end
            when 2
                # > Conta
                #   - Saldo atual: [saldo_atual]
                #   - Fatura Atual: [fatura_atual]
                #
                #   1: Adicionar saldo
                #   2: Retirar dinheiro
                Logger::limpar
                Logger::Conta::informacao_conta
                Logger::Conta::opcoes

                if Logger::get_int == 1
                    Logger::log_line 'Insira o valor que deseja adicionar: '
                    App.instance.current_user.conta.adicionar_saldo Logger::get_int
                else
                    Logger::log_line 'Insira o valor que deseja retirar: '
                    App.instance.current_user.conta.subtrair_saldo Logger::get_int
                end
            when 3
                # > Cartões
                #   1: Consultar informações de um cartão
                #   2: Criar novo cartão
                Logger::limpar
                Logger::Cartao::opcoes
                if Logger::get_int == 1

                else
                    User.new TipoCartao::CREDITO
                    App.current_user.adicionar_cartao
                end
            else
                break
            end
            break
        end
    end
end

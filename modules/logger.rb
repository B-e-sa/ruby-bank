module Logger
    def self.introducao
        puts 'Olá! Bem-vindo(a) ao nosso banco. Em que podemos lhe ajudar?'
    end

    def self.line
        puts("--------------------------------------")
    end

    def self.intercalar_bloco &block
        self.line
            block.call
        self.line
    end

    def self.get_input
        print "\n> "
        return gets.chomp
    end

    def self.get_int
        print "\n> "
        return gets.chomp.to_i
    end

    def self.opcoes
        puts 'O que deseja fazer ?'
        puts ' 1: Meu usuário'
        puts ' 2: Minha Conta'
        puts ' 3: Meus cartões'
        puts ' 4: Encerrar a aplicação'
    end

    def self.clear_n_log message
        Logger::limpar
        puts message
    end

    def self.clear_n_log_line message
        Logger::limpar
        puts message
    end

    def self.log message
        puts message
    end

    def self.log_line message
        print message
    end

    def self.tem_certeza
        puts ' 1: Sim'
        puts ' 2: Não'
    end

    def self.deseja_continuar
        puts "Deseja continuar?"
        puts " 1: Sim"
        puts " 2: Não, sair"
    end

    module User
        def self.mostrar_cartoes
            App.instance.current_user.cartoes.each do |cartao|
                puts cartao.numero
            end
        end

        def self.informacao_usuario
            puts "> Usuário"
            puts "  - Nome: #{App.instance.current_user.nome}"
            puts "  - CPF: #{App.instance.current_user.cpf}"
        end

        def self.nenhum_usuario_cadastrado
            puts "Ainda não há usuários cadastrados. Deseja criar um?"
            puts " 1: Sim"
            puts " 2: Não, sair"
        end

        def self.opcoes
            puts ' 1: Alterar meu nome'
            puts ' 2: Excluir meu usuário'
            puts ' 3: Voltar ao início'
        end

        def self.mostrar_usuario
            puts "Nome: #{App.instance.current_user.nome}"
            puts "Cpf: #{App.instance.current_user.cpf}"
        end
    end

    module Cartao
        def self.opcoes
            puts '> Cartão'
            puts ' 1: Consultar informações de um cartão'
            puts ' 2: Criar novo cartão'
            puts ' 3: Voltar ao início'
        end
    end

    module Conta
        def self.informacao_conta
            puts '> Conta'
            puts "  - Saldo atual: #{App.instance.current_user.conta.saldo_disponivel}"
            puts "  - Fatura atual: #{App.instance.current_user.conta.saldo_disponivel}"
        end

        def self.opcoes
            puts ' 1: Adicionar saldo'
            puts ' 2: Retirar dinheiro'
            puts ' 3: Voltar ao início'
        end
    end

    def self.limpar
        if Gem.win_platform?
            system 'cls'
        else
            system 'clear'
        end
    end
end

class Log
    def self.limpar
        if Gem.win_platform?
            system 'cls'
        else
            system 'clear'
        end
    end

    def self.introducao
        puts 'Olá! Bem-vindo(a) ao nosso banco. Em que podemos lhe ajudar?'
    end

    def self.escolha_nome
        puts 'Escolha seu novo nome de usuário:'
    end

    def self.line 
        puts("--------------------------------------")
    end

    def self.get_input
        return gets.chomp
    end

    def self.get_int
        return gets.chomp.to_i
    end

    def self.usuario(usuario)
        puts "Nome: #{usuario.nome}"
        puts "Cpf: #{usuario.cpf}"
    end

    def self.opcoes
        puts '1: Meu usuário'
        puts '2: Minha Conta'
        puts '3: Meus cartões'
        puts '4: Encerrar a aplicação'
    end

    def self.opcoes_usuario
        puts '1: Alterar meu nome'
        puts '2: Excluir meu usuário'
    end

    def self.escolha_nome
        print('Escolha seu novo nome: ')
    end

    def self.nome_alterado_sucesso(nome)
        print("Seu nome foi alterado com sucesso, #{nome}!")
    end

    def self.opcoes_conta
        puts '1: Adicionar saldo'
        puts '2: Retirar dinheiro'
    end

    def self.opcoes_cartoes
        puts '1: Consultar informações de um cartão'
        puts '2: Criar novo cartão'
    end
end
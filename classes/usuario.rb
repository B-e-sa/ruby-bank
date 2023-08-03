require_relative './conta'

class Usuario
    attr_reader :nome, :cpf, :cartoes, :conta

    def initialize(nome, cpf)
        @users = App.instance
        @nome = nome
        @cpf = cpf
        @cartoes = []
        vincular_conta()
    end

    def vincular_conta
        @conta = Conta.new self, 0
    end

    def trocar_nome(novo_nome)
        @nome = novo_nome
    end

    def adicionar_cartao(cartao)
        cartoes.push(cartao)
    end
end

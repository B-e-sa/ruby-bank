require_relative './conta'

class Usuario
    attr_reader :nome, :cpf, :cartoes, :conta

    def initialize(nome, cpf)
        @nome = nome
        @cpf = cpf
        @cartoes = []
        @conta = Conta.new self, 0
    end

    def trocar_nome(novo_nome)
        @nome = novo_nome
    end

    def adicionar_cartao(cartao)
        cartoes.push(cartao)
    end
end

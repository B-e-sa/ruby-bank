class Usuario
    attr_reader :nome, :cpf, :cartoes

    def initialize(nome, cpf)
        @nome = nome
        @cpf = cpf
    end

    def trocar_nome(novo_nome)
        @nome = novo_nome
    end

    def adicionar_cartao(cartao)
        cartoes.push(cartao)
    end
end
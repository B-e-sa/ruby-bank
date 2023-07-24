class Usuario
    attr_reader :nome, :cpf, :cartoes

    def initialize(nome, cpf)
        @nome = nome
        @cpf = cpf
    end

    def trocarNome(novoNome)
        @nome = novoNome
    end

    def adicionarCartao(Cartao)
        cartoes.push(Cartao)
    end
end
class Usuario
    attr_accessor :nome
    attr_reader :CPF

    def setNome(nome)
        @nome = nome;
    end
end
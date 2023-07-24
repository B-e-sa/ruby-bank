require_relative '../modules/tipo_cartao'

class Cartao
    include TipoCartao
    attr_reader :numero, :validade, :cvc, :funcao, :isBloqueado, :usuario

    def initialize(usuario = nil, funcao = TipoCartao::CREDITO)
        @numero = 1250
        @validade = definirValidade()
        @cvc = gerarCvc()
        @funcao = funcao
        @isBloqueado = false
        @usuario = usuario
    end

    def trocarStatusBloqueado()
        @isBloqueado = !@isBloqueado
    end

    def trocarFuncaoAtual() 
        if @funcao == TipoCartao::CREDITO
            @funcao = TipoCartao::DEBITO
        else 
            @funcao = TipoCartao::CREDITO
        end
    end

    protected

    def definirValidade()
        dataDeCriacao = Time.now
        puts(dataDeCriacao)
    end

    def gerarCvc()
        cvc = "#{rand(10)}#{rand(10)}#{rand(10)}"
        return cvc
    end

    def gerarNovoNumero()
        
    end
end
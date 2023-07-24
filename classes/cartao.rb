require_relative '../modules/tipo_cartao'

class Cartao
    include TipoCartao
    attr_reader :numero, :validade, :cvc, :funcao, :is_bloqueado, :usuario

    def initialize(usuario, funcao = TipoCartao::CREDITO)
        @numero = 1250
        @validade = definir_validade()
        @cvc = gerar_cvc()
        @funcao = funcao
        @is_bloqueado = false
        @usuario = usuario
    end

    def trocarStatusBloqueado()
        @is_bloqueado = !@is_bloqueado
    end

    def trocarFuncaoAtual() 
        if @funcao == TipoCartao::CREDITO
            @funcao = TipoCartao::DEBITO
        else 
            @funcao = TipoCartao::CREDITO
        end
    end

    protected

    def definir_validade()
        data_de_criacao = Time.now
        puts(data_de_criacao)
    end

    def gerar_cvc()
        cvc = "#{rand(10)}#{rand(10)}#{rand(10)}"
        return cvc
    end

    def gerar_novo_numero()

    end
end
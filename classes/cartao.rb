require_relative '../modules/tipo_cartao'

class Cartao
    include TipoCartao
    attr_reader :numero, :validade, :cvc, :funcao, :is_bloqueado, :usuario

    def initialize(funcao = TipoCartao::CREDITO)
        @users = App.instance
        @numero = gerar_novo_numero()
        @validade = definir_validade()
        @cvc = gerar_cvc()
        @funcao = funcao
        @is_bloqueado = false
        @usuario = App.instance.current_user
        vincular_usuario()
    end

    def trocarStatusBloqueado
        @is_bloqueado = !@is_bloqueado
    end

    def trocarFuncaoAtual
        if @funcao == TipoCartao::CREDITO
            @funcao = TipoCartao::DEBITO
        else
            @funcao = TipoCartao::CREDITO
        end
    end

    protected

    # TODO: adicionar ao diagrama
    def vincular_usuario
        usuario.adicionar_cartao(self)
    end

    def definir_validade
        data_de_validade = Time.now.year + 5
        return data_de_validade
    end

    def gerar_cvc
        cvc = "#{rand(10)}#{rand(10)}#{rand(10)}"
        return cvc
    end

    def gerar_novo_numero
        numeros = ''

        16.times do
            numeros += rand(10).to_s
        end

        return numeros
    end
end

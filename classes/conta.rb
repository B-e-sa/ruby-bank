class Conta
    attr_reader :saldo_disponivel, :fatura_atual, :usuario

    def initialize(usuario, saldo_disponivel = 0)
        @usuario = usuario
        @saldo_disponivel = saldo_disponivel
        @fatura_atual = 0
    end

    def adicionar_saldo(valor)
        @saldo_disponivel += valor
    end

    def set_fatura_atual(valor)
        @fatura_atual += valor
    end
end 
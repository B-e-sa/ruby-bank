class Conta
    attr_reader :saldo_disponivel, :fatura_atual, :usuario

    def initialize(usuario, saldo_disponivel = 0)
        @usuario = usuario
        @saldo_disponivel = saldo_disponivel
    end

    def adicionar_saldo valor
        if valor <= 0; return nil end

        @saldo_disponivel += valor
    end

    def subtrair_saldo valor
        if valor > saldo_disponivel || valor <= 0; return nil end

        return @saldo_disponivel -= valor
    end
end

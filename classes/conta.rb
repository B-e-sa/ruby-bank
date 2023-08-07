class Conta
    attr_reader :saldo_disponivel, :fatura_atual, :usuario

    def initialize(usuario, saldo_disponivel = 0)
        @users = App.instance
        @usuario = usuario
        @saldo_disponivel = saldo_disponivel
        @fatura_atual = 0
    end

    def adicionar_saldo valor
        if valor == 0; return nil end

        @saldo_disponivel += valor
    end

    def subtrair_saldo valor
        if @saldo_disponivel < valor; return nil end

        return @saldo_disponivel -= valor
    end

    def set_fatura_atual valor
        @fatura_atual += valor
    end
end

def Conta
    attr_reader :saldoDisponivel, :faturaAtual, :usuario

    def initialize(usuario, saldoDisponivel = 0)
        @usuario = usuario
        @saldoDisponivel = saldoDisponivel
        @faturaAtual = 0
    end

    def adicionarSaldo(valor)
        @saldoDisponivel += valor
    end

    def setFaturaAtual(valor)
        @faturaAtual += valor
    end
end 
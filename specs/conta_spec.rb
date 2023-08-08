require_relative '../classes/conta'

describe Conta do
  before (:each) do
    @conta = Conta.new nil, 10
  end

  describe "#adicionar_saldo" do
    it "pode adicionar saldo a conta" do
      @conta.adicionar_saldo 10
      expect(@conta.saldo_disponivel).to eq(20)
    end

    it "retorna nil caso o valor for menor/igual a zero" do
      @conta.adicionar_saldo (-1)
      expect(@conta.saldo_disponivel).to eq(10)
    end
  end

  describe "#subtrair_saldo" do
    it "pode subtrair saldo" do
      @conta.subtrair_saldo 10
      expect(@conta.saldo_disponivel).to eq(0)
    end

    it "retorna nil caso o valor for menor/igual a zero" do
      @conta.subtrair_saldo(-10)
      expect(@conta.saldo_disponivel).to eq(10)
    end

    it "retorna nil caso o valor for maior que o saldo disponível" do
      @conta.subtrair_saldo (20)
      expect(@conta.saldo_disponivel).to eq(10)
    end
  end
end

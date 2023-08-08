require_relative '../classes/cartao'
require_relative '../modules/logger'
require_relative '../classes/usuario'
require_relative '../modules/tipo_cartao'
require_relative '../classes/app'

describe Cartao do
  include Logger
  include TipoCartao

  before (:each) do
    App.instance.teste Usuario.new "Teste", "12345678910"
    @cartao = Cartao.new
  end

  describe "cartao" do
    it "possui um numero de 16 dígitos" do
      expect(@cartao.numero.length == 16).to eq(true)
    end

    it "possui validade de 5 anos" do
      ano_vencimento = (Time.now.year + 5).to_s
      expect(ano_vencimento[2..4] == @cartao.validade[-2..-1]).to eq(true)
    end

    it "possui um cvc de 3 dígitos" do
      expect(@cartao.cvc.length == 3).to eq(true)
    end

    it "possui usuário vinculado na criação" do
      expect(!!@cartao.usuario).to eq(true)
    end

    it "inicializa como cartao de credito" do
      expect(@cartao.funcao == TipoCartao::CREDITO)
    end
  end

  describe "#trocar_funcao_atual" do
    it "troca funcao atual" do
      @cartao.trocar_funcao_atual
      expect(@cartao.funcao == TipoCartao::DEBITO)
    end
  end
end

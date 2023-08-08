require_relative '../classes/usuario'

describe Usuario do
  before (:each) do
    @usuario = Usuario.new "Teste", "154.814.536.06"
  end

  describe "#trocar_nome" do
    it "pode trocar de nome" do
      @usuario.trocar_nome "Joao"
      expect(@usuario.nome).to eq('Joao')
    end
  end

  describe "#vincular_conta" do
    it "pode criar e vincular nova conta ao ser criado" do
      expect(!!@usuario.conta).to eq(true)
    end
  end
end

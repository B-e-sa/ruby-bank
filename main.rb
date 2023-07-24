require_relative './classes/conta'
require_relative './classes/usuario'
require_relative './classes/cartao'

puts('------ Usuário ------')
novoUsuario = Usuario.new('Pedro', '12345678900')
puts("Username: " + novoUsuario.nome)
puts("CPF: " + novoUsuario.cpf)
puts(' ')

puts('------ Conta ------')
novaConta = Conta.new(novoUsuario)
puts("Saldo Disponível: " + novaConta.saldo_disponivel.to_s)
novaConta.adicionar_saldo(100)
puts("Saldo após depósito: " + novaConta.saldo_disponivel.to_s)
puts("Fatura Atual: " + novaConta.fatura_atual.to_s)
puts(' ')

puts('------ Cartao ------')
novoCartao1 = Cartao.new(novoUsuario)
puts("Número: " + novoCartao1.numero)
puts("CVC: " + novoCartao1.cvc)
puts("Funcao atual: " + novoCartao1.funcao.to_s)
puts("Cartão bloqueado? " + novoCartao1.is_bloqueado.to_s)
puts("Data de validade: " + novoCartao1.validade.to_s) # mm/yy
puts(' ')

puts('------ Cartão <-> Usuário ------')
novoCartao2 = Cartao.new(novoUsuario)
puts(novoUsuario.cartoes[0].cvc)
puts(novoUsuario.cartoes[1].cvc)
puts(' ')
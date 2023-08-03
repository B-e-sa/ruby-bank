require_relative './classes/conta'
require_relative './classes/usuario'
require_relative './classes/cartao'
require_relative './modules/log'
require_relative './modules/app'

while true
    if users.empty?
        Log::User::nenhum_usuario_cadastrado

        if Log::get_int == 1
            App::Usuario::cadastrar users
            next
        end

        break
    end

    App::Usuario::login users

    break

    Log::intercalar_bloco do
        Log::introducao
        Log::opcoes
    end

    user = Usuario.new "pedro", "12345678900"

    case Log::get_int
        when 1

            Log::limpar
            
            Log::intercalar_bloco do
                Log::User::mostrar_usuario user
                Log::User::opcoes
            end

            if Log::get_int == 1

                Log::intercalar_bloco do
                    Log::User::escolha_nome
                    user.trocar_nome Log::get_input
                end

                Log::User::nome_alterado_sucesso user.nome
                sleep 2

                Log::limpar
            else
                # TODO: Excluir usuário
            end
        when 2
            Log::limpar

            Log::Conta::opcoes

        when 3
            Log::limpar

            Log::Cartao::opcoes
        else
            break
    end

    next

end
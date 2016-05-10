
function IniciaJogo()
--------------------------------------------
--Exibe o tabuleiro do jogo
--------------------------------------------
  tabuleiro=getComponente("TABULEIRO")
  if(verificaComponente(tabuleiro))then
  tabuleiro:showxy( iup.CENTER, iup.CENTER)
  menu_jogo:hide()
  geraResposta()
  end

end

function EscolherCor(posicao)
--------------------------------------------
--Abre a interface que permite a escoha da cor
-- para uma posição da tentativa.
--Parameter:
--    posicao : posicao da tentativa
--------------------------------------------
btnAtual=posicao
cores=getComponente("MENU_COR")
if(verificaComponente(cores))then
cores:showxy( iup.CENTER, iup.CENTER)
end

end

function ConfirmaCor(color)
--------------------------------------------
--Registra a cor escolhida para uma posição
--da tentativa.
--Parameter:
--   color : objeto da cor escolhida
--------------------------------------------
if(verificaCor(color))then

btnAtual.image=color.image
local i=4

if(veririficaNumber(btnAtual.tip))then
i=tonumber(btnAtual.tip)
end

if(color.tip=="Vermelho")then
geraTentativa(i,1)
elseif(color.tip=="Verde")then
geraTentativa(i,2)
elseif(color.tip=="Azul")then
geraTentativa(i,3)
elseif(color.tip=="Violeta")then
geraTentativa(i,4)
end

cores:hide()

end


end


function FazerJogada()
--------------------------------------------
--Realiza a tentativa de uma resposta para o resultado.
--------------------------------------------

if(avaliaJogada(getTentativa()))then
	resultado=getResultado()
	if(resultado=="VENCEDOR")then
		mensagem=getComponente("MENSAGEM_VITORIA")
		if(verificaComponente(mensagem))then
		tabuleiro:hide()
		end
	elseif(ressultado=="PERDEDOR")then
		mensagem=getComponente("MENSAGEM_DERROTA")
		if(verificaComponente(mensagem))then
		tabuleiro:hide()
		end
	end

else
	mensagem=getComponente("MENSAGEM_JOGADA_INVALIDA")

end


end

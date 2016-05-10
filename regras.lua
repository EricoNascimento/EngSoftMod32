
function avaliaJogada(tentativa)
--------------------------------------------
--Verifica se a tentativa tem alguma posicao
--em branco
--Parameter:
--    tentativa : tentativa de resposta
--------------------------------------------
local i=1
while(i<5) do
	if(tentativa[i]>4 or tentativa[i]<1)then
	return false
	end
	i=i+1
end
return true
end

function verificaComponente(componente)
if(componente=="NÃO EXISTE ESSE COMPONENTE" or componente== nil)
return false
else
return true
end

function verificaCor(color)
if(color==nil or color.image== nil)
return false
else
return true
end

function veririficaNumber(number)
return tonumber(number)
end

function verificaArray(array)
if(array== nil)
return false
local i = 1
while(i<5) do
if(array[i]==nil)
return false
i=i+1
end
return true
end
end

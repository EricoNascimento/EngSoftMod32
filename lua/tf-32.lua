function initStopWords()
retorno={} arquivo=io.open('../stop_words.txt',"r")
for word in string.gmatch(arquivo:read("*all"),"([^,]+)") do
	table.insert(retorno,word)
end
return retorno
end

local WordFrequenciesModel={
 --- Models the data. In this case, we're only interested
 ---  in words and their frequencies as an end result

			freqs={},
			stopwords=initStopWords()
}
function WordFrequenciesModel:new (obj,path_to_file)
	obj=obj or {}
    setmetatable(obj,self)
	self.__index=self
	self:update(path_to_file)
	return obj
end


function WordFrequenciesModel:update(path_to_file)

	local words={}
	local status,erro=pcall(function () arquivo=string.lower(io.open(path_to_file,"r"):read("*all")) for palavra in string.gmatch(arquivo,"%a%a%a*") do table.insert(words,palavra) end end)

	if(status)then
		for key,word in ipairs(words) do
		for _,value in ipairs(self.stopwords) do
			if(value==word)then
			table.remove(words,key)
			break
			end
		end
		end
		for key,word in ipairs(words)do
			if(not(self.freqs[word]==nil))then
				self.freqs[word]=self.freqs[word]+1
			else
				self.freqs[word]=1
			end
		end
	else
	io.write("File not Found")
	self.freqs={}
	end
end


local WordFrequenciesView={}
function WordFrequenciesView:new (obj,model)
	obj=obj or {}
    setmetatable(obj,self)
	self.__index=self
	self._model=model
	return obj
end
function WordFrequenciesView:render ()

local chaves={}

for chave,value in pairs(self._model.freqs) do
table.insert(chaves,chave)
end

table.sort(chaves,function(a,b) return self._model.freqs[a]>self._model.freqs[b] end)


local index=1
while(index<26)do
	palavra=chaves[index]
	io.write(palavra.."-"..self._model.freqs[palavra].."\n")
	index=index+1
end

end

local WordFrequencyController={}
function WordFrequencyController:new (obj,model,view)
	obj=obj or {}
    setmetatable(obj,self)
	self.__index=self
	self._model=model
	self._view=view
	view:render()
	return obj
end

function WordFrequencyController:run ()
	while(true)do
	io.write("Next file: \n")
	io.flush()
	filename=io.read():gsub("%s+","")
	self._model:update(filename)
	self._view:render()

	end
end

m=WordFrequenciesModel:new(nil,"../input.txt")
v=WordFrequenciesView:new(nil,m)
c=WordFrequencyController:new(nil,m,v)
c:run()

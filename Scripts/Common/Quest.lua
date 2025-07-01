class 'DNQuest'
function DNQuest:__init(_questName, _questID, _nParts, _description)
	self.name = _questName
	self.id = _questID
	self.nParts = _nParts
	self.description = _description
end
function DNQuest:HasQuest()
	if questManager:hasQuest(self.id) then
		return true
	else
		return false
	end
end

function DNQuest:IsCompleted()
	print(string.format("Checking Quest: %i Part: %i self.nParts: %i",self.id, questManager:getQuestPart(self.id),self.nParts))
	if questManager:hasQuest(self.id) then
		local nPart = questManager:getQuestPart(self.id)
		if nPart == self.nParts then
			return true
		elseif nPart < self.nParts then
			return false
		elseif nPart > self.nParts then
			print(string.format("Possible Quest Error: nPart (%i) > self.nParts (%i)",nPart, self.nParts))
			print(string.format("Quest: %s ID: %i",self.name, self.id))
			print("This error means that the nParts of this quest is not correct.")
			return false
		end
	else
		return false
	end
end

function DNQuest:GetPartNumber()
	return questManager:getQuestPart(self.id)
end

function DNQuest:GetID()
	return self.id
end

function DNQuest:GetName()
	return self.name
end

function DNQuest:GetParts()
	return self.nParts
end

function DNQuest:GetDescription()
	return self.description
end
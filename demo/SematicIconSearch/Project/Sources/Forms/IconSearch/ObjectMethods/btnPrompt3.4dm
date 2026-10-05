Case of 
	: (Form event code:C388=On Clicked:K2:4)
		var $prompt : cs:C1710.PromptEntity
		
		$prompt:=ds:C1482.Prompt.get(3)
		iconSearchPrompt:=$prompt.content
		iconSearchResult:=DoSemanticIconSearchWithVector($prompt.vector; iconSearchThreshold)
		
		If ((iconSearchResult#Null:C1517) && (iconSearchResult.length=0))
			OBJECT SET VISIBLE:C603(*; "labelReduceThreshold"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "labelReduceThreshold"; False:C215)
		End if 
End case 
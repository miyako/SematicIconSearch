Case of 
	: (Form event code:C388=On Load:K2:1)
		// Initialiaze process variables used within the form
		var iconSearchResult : Collection
		var iconSearchPrompt : Text
		var iconSearchThreshold : Real
		
		// Search threshold starts at 75%, with empty prompt and results
		iconSearchResult:=New collection:C1472
		iconSearchPrompt:=""
		iconSearchThreshold:=75
		
		// Fill "pre-vectorized" search buttons
		var $prompt : cs:C1710.PromptEntity
		var $promptID : Integer
		
		For ($promptID; 1; 3)
			$prompt:=ds:C1482.Prompt.get($promptID)
			
			If ($prompt#Null:C1517)
				OBJECT SET TITLE:C194(*; "btnPrompt"+String:C10($promptID); $prompt.content)
			Else 
				OBJECT SET VISIBLE:C603(*; "btnPrompt"+String:C10($promptID); False:C215)
			End if 
		End for 
		
End case 
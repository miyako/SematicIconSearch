Case of 
	: (Form event code:C388=On Load:K2:1)
		If (FORM theme:C1832="FluentUI")
			OBJECT SET RGB COLORS:C628(*; "btnSearch"; "white")
		End if 
		
	: (Form event code:C388=On Clicked:K2:4)
		iconSearchResult:=DoSemanticIconSearchWithPrompt(iconSearchPrompt; iconSearchThreshold)
		If ((iconSearchResult#Null:C1517) && (iconSearchResult.length=0))
			OBJECT SET VISIBLE:C603(*; "labelReduceThreshold"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "labelReduceThreshold"; False:C215)
		End if 
End case 
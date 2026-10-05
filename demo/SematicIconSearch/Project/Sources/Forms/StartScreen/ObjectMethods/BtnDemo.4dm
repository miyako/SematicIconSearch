Case of 
	: (Form event code:C388=On Load:K2:1)
		If (FORM theme:C1832="FluentUI")
			OBJECT SET RGB COLORS:C628(*; "BtnDemo"; "white")
		End if 
		
	: (Form event code:C388=On Clicked:K2:4)
		runTechNote:=True:C214
End case 
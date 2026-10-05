Case of 
	: (Form event code:C388=On Load:K2:1)
		If (FORM theme:C1832="FluentUI")
			OBJECT SET RGB COLORS:C628(*; "BtnDemo"; "white")
		End if 
		
	: (Form event code:C388=On Clicked:K2:4)
		// The button has the Accept action: the start screen closes and the demo opens
		var $window : Integer
		$window:=Open form window:C675("IconSearch"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		SET WINDOW TITLE(Get window title(Current form window); $window)
		DIALOG:C40("IconSearch"; *)
End case 
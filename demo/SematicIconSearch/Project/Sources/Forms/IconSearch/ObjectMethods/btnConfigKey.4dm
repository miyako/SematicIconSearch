Case of 
	: (Form event code:C388=On Clicked:K2:4)
		var $key : Text
		//$key:=Request("Enter your OpenAI Key:"; GetOpenAIKey() )
		
		$key:=Request:C163("Enter your OpenAI Key:"; GetOpenAIKey(); "Save"; "Cancel")
		
		If (OK=1)
			SetOpenAIKey($key)
		End if 
End case 
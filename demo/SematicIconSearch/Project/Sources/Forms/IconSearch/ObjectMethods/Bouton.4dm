Case of 
	: (Form event code:C388=On Clicked:K2:4)
		var $key : Text
		$key:=Request:C163("Enter your OpenAI Key:"; GetOpenAIKey())
		If (OK=1)
			SetOpenAIKey($key)
		End if 
End case 
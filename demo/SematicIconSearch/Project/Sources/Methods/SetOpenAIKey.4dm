//%attributes = {}
#DECLARE($key : Text)

Use (Storage:C1525)
	If (Storage:C1525.openAIKey=Null:C1517)
		Storage:C1525.openAIKey:=New shared object:C1526()
	End if 
	
	Use (Storage:C1525.openAIKey)
		Storage:C1525.openAIKey.value:=$key
	End use 
End use 
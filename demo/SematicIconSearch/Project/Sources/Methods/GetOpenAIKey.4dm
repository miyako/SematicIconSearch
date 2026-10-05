//%attributes = {}
#DECLARE()->$key : Text

Use (Storage:C1525)
	If (Storage:C1525.openAIKey#Null:C1517)
		Use (Storage:C1525.openAIKey)
			$key:=Storage:C1525.openAIKey.value
		End use 
	End if 
End use 
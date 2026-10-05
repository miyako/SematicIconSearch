//%attributes = {"invisible":true}
#DECLARE() : cs:C1710.AIKit.OpenAIEmbeddingsAPI

var $key : Text
$key:=GetOpenAIKey()

If ($key="")
	return Null:C1517
End if 

var $client : cs:C1710.AIKit.OpenAI

$client:=Try(cs:C1710.AIKit.OpenAI.new({apiKey: $key}))
If (Last errors:C1799.length>0)
	ALERT:C41(Localized string:C991("AlertAIKitMissing"))
End if 
return $client.embeddings

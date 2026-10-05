//%attributes = {}
// STEP#1: define settings for the embedding service (here, OpenAI via 4D.AIKit)
var $model : Text
$model:="text-embedding-ada-002"

var $embeddingAPI : cs:C1710.AIKit.OpenAIEmbeddingsAPI
$embeddingAPI:=GetOpenAIEmbeddingAPI()

If ($embeddingAPI=Null:C1517)
	return 
End if 

// STEP#2: loop through all icons and create an embedding of the tags string
var $iconEntity : cs:C1710.IconEntity
var $embeddingResult : cs:C1710.AIKit.OpenAIEmbeddingsResult

For each ($iconEntity; ds:C1482.Icon.all())
	If ($iconEntity.tags="")
		continue
	End if 
	
	$embeddingResult:=$embeddingAPI.create($iconEntity.tags; $model)
	If ($embeddingResult.success)
		MESSAGE:C88(Replace string(Replace string(Localized string:C991("MessageEmbeddingGenerated"); "{id}"; String:C10($iconEntity.ID)); "{name}"; $iconEntity.name))
		
		$iconEntity.vector:=$embeddingResult.vector
		$iconEntity.save()
	End if 
End for each 
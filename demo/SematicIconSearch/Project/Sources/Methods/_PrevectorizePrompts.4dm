//%attributes = {}
// STEP#1: define settings for the embedding service (here, OpenAI via 4D.AIKit)
var $model : Text
$model:="text-embedding-ada-002"



var $embeddingAPI : cs:C1710.AIKit.OpenAIEmbeddingsAPI
$embeddingAPI:=GetOpenAIEmbeddingAPI()

If ($embeddingAPI=Null:C1517)
	ALERT:C41("An OpenAI key is needed to perform semantic searchs.")
	return 
End if 

// STEP#2: loop through the list of prompts to be pre-vectorized
var $prompts : Collection
$prompts:=["Art et musique"; "Transportation and Travel"; "Deportes y Ocio"]

var $promptEntity : cs:C1710.PromptEntity
var $promptID : Integer
var $embeddingResult : cs:C1710.AIKit.OpenAIEmbeddingsResult


ds:C1482.Prompt.all().drop()
For ($promptID; 1; $prompts.length)
	$embeddingResult:=$embeddingAPI.create($prompts[$promptID-1]; $model)
	
	If ($embeddingResult.success)
		$promptEntity:=ds:C1482.Prompt.new()
		$promptEntity.ID:=$promptID
		$promptEntity.content:=$prompts[$promptID-1]
		$promptEntity.vector:=$embeddingResult.vector
		$promptEntity.save()
	End if 
End for 
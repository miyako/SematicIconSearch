//%attributes = {"invisible":true}
#DECLARE($searchPrompt : Text; $thresholdPercentage : Real)->$results : Collection

// STEP#0: check that the search prompt is not empty (empty strings cannot be embedded)
$results:=Null:C1517
If ($searchPrompt="")
	return 
End if 

// STEP#1: define settings for the embedding service (here, OpenAI via 4D.AIKit)
var $model : Text
$model:="text-embedding-ada-002"

var $embeddingAPI : cs:C1710.AIKit.OpenAIEmbeddingsAPI
$embeddingAPI:=GetOpenAIEmbeddingAPI()

If ($embeddingAPI=Null:C1517)
	return 
End if 

// STEP#2: embed the search prompt into a vector
var $embeddingResult : cs:C1710.AIKit.OpenAIEmbeddingsResult
$embeddingResult:=$embeddingAPI.create($searchPrompt; $model)

If (Not:C34($embeddingResult.success))
	ALERT:C41(Localized string:C991("AlertPromptNotVectorized"))
	return 
End if 

var $iconSelection : cs:C1710.IconSelection
var $iconEntity : cs:C1710.IconEntity
var $resultWithScore : Object

// STEP#3: execute a vector query on attribute `vector` of table `Icon`
// NOTE: we sort results by decending cosine similarity, which makes the most relevant results appear first.
$iconSelection:=ds:C1482.Icon.query("vector >= :1 order by vector desc"; {vector: $embeddingResult.vector; metric: mk cosine:K95:1; threshold: $thresholdPercentage/100})

// STEP4#4: add a `.score` property for each returned result, scaled to map the maximum cosine similarity (1.0) to 100.
$results:=New collection:C1472()
For each ($iconEntity; $iconSelection)
	$resultWithScore:=New object:C1471()
	$resultWithScore.name:=$iconEntity.name
	$resultWithScore.picture:=$iconEntity.picture
	$resultWithScore.score:=100*($iconEntity.vector.cosineSimilarity($embeddingResult.vector))
	
	$results.push($resultWithScore)
End for each 
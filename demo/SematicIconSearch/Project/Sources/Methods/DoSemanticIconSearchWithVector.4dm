//%attributes = {}
#DECLARE($searchVector : 4D:C1709.Vector; $thresholdPercentage : Real)->$results : Collection

$results:=New collection:C1472()

var $iconSelection : cs:C1710.IconSelection
var $iconEntity : cs:C1710.IconEntity
var $resultWithScore : Object

// STEP#1: execute a vector query on attribute `vector` of table `Icon`
// NOTE: we sort results by decending cosine similarity, which makes the most relevant results appear first.
$iconSelection:=ds:C1482.Icon.query("vector >= :1 order by vector desc"; {vector: $searchVector; metric: mk cosine:K95:1; threshold: $thresholdPercentage/100})

// STEP#2: add a `.score` property for each returned result, scaled to map the maximum cosine similarity (1.0) to 100.
For each ($iconEntity; $iconSelection)
	$resultWithScore:=New object:C1471()
	$resultWithScore.name:=$iconEntity.name
	$resultWithScore.picture:=$iconEntity.picture
	$resultWithScore.score:=100*($iconEntity.vector.cosineSimilarity($searchVector))
	
	$results.push($resultWithScore)
End for each 
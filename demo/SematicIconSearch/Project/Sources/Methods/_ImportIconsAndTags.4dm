//%attributes = {"invisible":true}
var $dataClass; $project; $path : Text
For each ($dataClass; ds:C1482)
	If (ds:C1482[$dataClass].getCount()=0)
		$path:=File:C1566("/RESOURCES/"+$dataClass+".4ie").platformPath
		If (Test path name:C476($path)=Is a document:K24:1)
			$project:=File:C1566("/RESOURCES/"+$dataClass+".4si").getText()
			IMPORT DATA:C665($path; $project)
		End if 
	End if 
End for each 
//%attributes = {}
// STEP#0: if entities already exist in the `Icon` table, exit immediately to avoid any overwrite.
If (ds:C1482.Icon.getCount()#0)
	ALERT:C41("WARNING: Table `Icon` already contains data, will not overwrite.")
	return 
End if 

// STEP#1: find all icons in `Resources/icons`
var $iconFiles : Collection
$iconFiles:=Folder:C1567("/RESOURCES/icons").files().filter(Formula:C1597($1.value.extension=".png"))

// STEP#2: load `Resources/tags.json`
var $iconTags : Object
$iconTags:=JSON Parse:C1218(File:C1566("/RESOURCES/tags.json").getText())

// STEP#3: loop through all icons and populate table `Icon`
var $iconEntity : cs:C1710.IconEntity
var $iconFile : 4D:C1709.File
var $iconPicture : Picture
var $iconTagsAsString : Text
var $iconID : Integer

$iconID:=0
For each ($iconFile; $iconFiles)
	$iconID+=1
	BLOB TO PICTURE:C682($iconFile.getContent(); $iconPicture)
	
	$iconEntity:=ds:C1482.Icon.new()
	$iconEntity.ID:=$iconID
	$iconEntity.name:=$iconFile.name
	$iconEntity.picture:=$iconPicture
	$iconEntity.tags:=$iconTags[$iconFile.name].join(" ")
	$iconEntity.vector:=Null:C1517
	
	$iconEntity.save()
End for each 

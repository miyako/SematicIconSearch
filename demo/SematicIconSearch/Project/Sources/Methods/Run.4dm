//%attributes = {}
var $windowRef : Integer
$windowRef:=Open form window:C675("StartScreen"; Plain form window no title:K39:19; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40("StartScreen")
CLOSE WINDOW:C154($windowRef)

If (runTechNote)
	$windowRef:=Open form window:C675("IconSearch"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("IconSearch")
	CLOSE WINDOW:C154($windowRef)
End if 
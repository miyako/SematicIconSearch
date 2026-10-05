//%attributes = {}
#DECLARE($params : Object)

// The start screen and the demo windows share the localised title, which identifies them
var $title : Text:=Localized string:C991("WindowTitle")
var $window : Integer

If (Count parameters=0)
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	var $i : Integer
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$title)
			var $left; $top; $right; $bottom : Integer
			GET WINDOW RECT($left; $top; $right; $bottom; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($left; $top; $right; $bottom; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	SET MENU BAR(1)
	
	$window:=Open form window:C675("StartScreen"; Plain form window no title:K39:19; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE($title; $window)
	DIALOG:C40("StartScreen"; *)
	
End if 
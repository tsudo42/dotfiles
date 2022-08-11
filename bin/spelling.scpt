use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
use framework "AppKit"

on run argv
	check(argv's item 1)
end run

on check(checking)
	set checking to current application's NSString's stringWithString:checking
	set checker to current application's NSSpellChecker's sharedSpellChecker()

	if (checker's checkSpellingOfString:checking startingAt:0)'s |length|() = 0 then
		return {}
	else
		return (checker's guessesForWord:checking) as list
	end if
end check

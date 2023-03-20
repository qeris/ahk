; | SEARCHES | ;
; MENU
#q::
runSearchMenu() 
{
	menu, Searches, add, 1 Duck Duck Go Search, duckSearch
	menu, Searches, add, 2 Google Search, googleSearch
	menu, Searches, add, 3 Youtube Search, youtubeSearch
	menu, Searches, add, 4 Wiki Search, wikiSearch
	menu, Searches, add, 5 Audiobook Search, audiobookSearch
	menu, Searches, add, 6 Fandom Search, fandomSearch
	menu, Searches, add, 9 Highlight Search, highLightSearch
	menu, Searches, show
	return
	; GOOGLE SEARCH
	googleSearch:	
	{
		InputBox, SearchTerm, Search Google, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				Run https://www.google.com/search?q=%SearchTerm%
		}
	}
	return
	; DUCK DUCK GO SEARCH
	duckSearch:
	{
		InputBox, SearchTerm, Search Duck Duck Go, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				Run https://duckduckgo.com/?q=%SearchTerm%
		}
	}
	return
	; YOUTUBE SEARCH
	youtubeSearch:
	{
		Inputbox, SearchTerm, Search Youtube, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				run, https://www.youtube.com/results?search_query=%SearchTerm%
		}
	}
	return
	; WIKI SEARCH
	wikiSearch:
	{
		InputBox, SearchTerm, Search Wikipedia, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				Run https://en.wikipedia.org/w/index.php?title=Special:Search&search=%SearchTerm%
		}
	}
	return
	; AUDIOBOOK SEARCH
	audiobookSearch:
	{
		Inputbox, Audiobook_Name, Audiobook Search, Search:
		if not ErrorLevel{
			if SearchTerm <> ""
				run, http://audiobookbay.fi/?s=%Audiobook_Name%
				run, https://thepiratebay.org/search.php?q=%Audiobook_Name%&cat=102
		}
	}
	return
	; FANDOM SEARCH
	fandomSearch:
	{
		InputBox, SearchTerm, Search Fandom, Search:
		if not ErrorLevel
		{
			if SearchTerm <> ""
				Run https://www.fandom.com/?s=%SearchTerm%
		}
	}
	return
	
	; HIGHLIGHT SEARCH
	highLightSearch:
	{
		clipboard=
		Send, ^c
		Sleep 500
		Run, chrome.exe http://www.google.com/search?q=%clipboard%
	} return

} return
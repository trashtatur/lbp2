%Teil 1

%Teil 1.1

%Sammelt eine Liste der Komponisten ein die in der DB gegeben sind, anhand von Geburts und Sterbedatum.
%Findall sammelt anhand eines template Dinge aus dem Goal "komponist" ein indem es dies durchgeht und dann das Resultat mit List
%unifiziert. Dabei m√ºssen die Bedingungen aus Checklist f√ºr die genannten Eintr√§ge erf√ºllt sein.
%Also ungleich null. Nur wenn dies erf√ºllt ist, wird der Eintrag Teil der Liste, ansonsten wird er √ºbersprungen.
%Am Ende wird die Liste mit dem definierten Inhalt ausgegeben und das Programm evaluiert zu true.

collect_komp(List) :- findall((Vorname, Name, Geboren, Gestorben),										%template
                      		(komponist(Nr, Vorname, Name, Geboren, Gestorben),							%Goal
                       		Nr\=null,Vorname\=null,Name\=null,Geboren\=null,Gestorben\=null), 			%Checklist bzw Filter							
                      		List).																		%unifies the contents of template with List	after sorting through filter
                      		
%Teil 1.2

%Arbeitet wie Teil 1 mit dem findall, nur dass hier ein Bereich als Filter angegeben wird der die Suchkriterien festlegt.

collect_az(List) :- findall((Vorname,Name,Geboren,Gestorben),											%template
                      	   (komponist(Nr,Vorname,Name,Geboren,Gestorben),								%Goal
                      	   Nr\=null,Vorname\=null,1700 =< Geboren, Geboren =< 1799, Gestorben\=null),	%Checklist bzw Filter
                      	   List).																		%unifies contents of template with List after sorting through filter	
                      	   
                      	   
%Teil 1.3

%Arbeitet wie Teil 1 mit dem findall, nur dass hier die member Funktion ¸berpr¸ft ob das Element Hersteller ein Teil der ¸bergebenen Liste HListe ist pr¸ft.

collect_dp(HListe,Collection):- findall((Name,Hersteller),												%template
								(cd(CDNr, Name, Hersteller, _Anzahl_CDs, _Gesamtspielzeit),				%Goal
								member(Hersteller,HListe), Name\=null, CDNr\=null),						%Checklist bzw Filter (diesmal mit member als Hilfsfunktion)
								Collection).                      	   									%unifies contents of template with List after sorting through filter	

	
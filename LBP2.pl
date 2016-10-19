%Teil 1

%Teil 1.1

%Sammelt eine Liste der Komponisten ein die in der DB gegeben sind, anhand von Geburts und Sterbedatum.
%Findall sammelt anhand eines template das alles andere nicht mitnimmt, Dinge aus dem Goal "komponist" 
%ein indem es dies durchgeht und dann das Resultat mit List
%unifiziert. Dabei muessen die Bedingungen aus Checklist fuer die genannten Einträge erfuellt sein.
%Also ungleich null. Nur wenn dies erfuellt ist, wird der Eintrag Teil der Liste, ansonsten wird er uebersprungen.
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

%Arbeitet wie Teil 1 mit dem findall, nur dass hier das Praedikat member �berpr�ft ob das Element Hersteller ein Teil der uebergebenen Liste HListe ist pr�ft.

collect_dp(HListe,Collection):- findall((Name,Hersteller),												%template
								(cd(CDNr, Name, Hersteller, _Anzahl_CDs, _Gesamtspielzeit),				%Goal
								member(Hersteller,HListe), Name\=null, CDNr\=null),						%Checklist bzw Filter (diesmal mit member als Hilfsfunktion)
								Collection).                      	   									%unifies contents of template with List after sorting through filter
								
%Teil 1.4

%Die Suche wird umgekehrt begonnen und zwar bei den Solisten.
%hierbei muss die Snr mit der Snr des St�ckes unifizieren, 
%dessen Knr wiederum mit der des Komponisten unifizieren muss
%somit ist gesichert dass der Komponist an dem St�ck beteiligt war,
%an dem der Solist beteiligt war
%findall unifiziert dann alle passenden Komponisten dieser vorangegangenen
%Bedingung anhand von Vorname und Nachname mit Liste
%und gibt diese aus.
									   
collect_komp(Solist,Liste) :- findall((Vorname, Name),
                      		  (komponist(Knr, Vorname, Name, _Geboren, _Gestorben), Name \= null,
                       		  % Knr aus Praedikat Komponist muss mit Knr aus Praedikat stueck unifizierbar sein. Filterbedingung
                       		  stueck(Snr, Knr, _Titel, _Tonart, _Opus), Knr \= null,
                  			  % Snr aus Stueck muss mit Snr aus Praedikat solist unifizierbar sein, Filterbedingung. Anhand
                       		  %dessen ermittelt findall dann Vorname und Nachname der jeweils passenden Komponisten.
                       		  %da nur die genommen werden wo die Solisten auch zu den Komponisten passen
                       		  solist(_CDNr, Snr, Solist, _Instrument), Snr \= null),
                       		  Liste).
                       		  
%Teil 1.5

collect_time(Liste) :- findall((Name,Gesamtspielzeit),
								(cd(CDNr, Name, _Hersteller, _Anz_CDs, Gesamtspielzeit), CDNr\=null, Gesamtspielzeit\=null,
								 aufnahme(CDNr, SNr, _Orchester, _Leitung), CDNr\=null, SNr\=null,
								 stueck(SNr, KNr, _Titel, _Tonart, _Opus), SNr\=null, KNr\=null,
								 komponist(KNr, _Vorname, Name, _Geboren, _Gestorben), KNr\=null, Name\=null),
								 TempListe).
								 
								 %Templiste enth�lt jetzt die Gesamtspielzeit f�r einen einzigen Komponisten, einer einzigen CD es werden jedoch mehr gebraucht.
								 %Die Gesamtspielzeiten dieses einen Komponisten m�ssen irgendwie akkumuliert werden.                      		  								   
									   									

	
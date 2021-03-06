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

%Es muss die Snr mit der Snr des St�ckes unifizieren, 
%dessen Knr wiederum mit der des Komponisten unifizieren muss
%somit ist gesichert dass der Komponist an dem St�ck beteiligt war,
%an dem der Solist beteiligt war
%findall unifiziert dann alle passenden Komponisten dieser vorangegangenen
%Bedingung anhand von Vorname und Nachname mit Liste
%und gibt diese aus.
									   
collect_komp(Solist,Liste) :- findall((Vorname, Name),
                       		  (solist(_CDNr, Snr, Solist, _Instrument), Snr \= null,
                       		  % Knr aus Praedikat Komponist muss mit Knr aus Praedikat stueck unifizierbar sein. Filterbedingung
                       		  stueck(Snr, Knr, _Titel, _Tonart, _Opus), Knr \= null,
                  			  % Snr aus Stueck muss mit Snr aus Praedikat solist unifizierbar sein, Filterbedingung. Anhand
                       		  %dessen ermittelt findall dann Vorname und Nachname der jeweils passenden Komponisten.
                       		  %da nur die genommen werden wo die Solisten auch zu den Komponisten passen
                      		  komponist(Knr, Vorname, Name, _Geboren, _Gestorben), Name \= null),
                       		  Liste).
                       		  
%Teil 1.5

%Am Anfang hat collect_time dieselbe Arbeitsweise wie auch 1.4's collect_komp/2 wird aber im sp�teren Verlauf durchaus
%komplexer. Die Erkl�rung folgt in den unteren Kommentaren

collect_time(Liste) :- findall((Vorname,Name,Gesamtspielzeit),
								(komponist(KNr, Vorname, Name, _Geboren, _Gestorben), KNr\=null,
								 stueck(SNr, KNr, _Titel, _Tonart, _Opus), SNr\=null, 
								 aufnahme(CDNr, SNr, _Orchester, _Leitung), CDNr\=null,
								 cd(CDNr, _CDName, _Hersteller, _Anz_CDs, Gesamtspielzeit), Gesamtspielzeit\=null),
								 TempListe),
								 %R�umt Doppel aus der TempListe die aus irgendeinem Grund entstehen.
								 list_to_set(TempListe,TempSet),						 
								 %Templiste enthaelt jetzt die Gesamtspielzeiten einzeln und listet so jeden Komponisten mehrmals.
								 %Die Einzelergebnisse muessen jetzt zusammengefasst und als neue Liste ausgegeben werden
								 %Die das jeweilige akkumulierte Gesamtergebnis enthaelt.
								 
								 %Anwendung der Hilfspr�dikate:
								 
								 clean_up(TempSet,Liste).
								 
								 
			    %Es werden zwei Hilfspr�dikate ben�tigt
								 
				%Hilfspr�dikat 1
				%Komprimiert die Liste
				
              	clean_up([(Vorname, Name,Gesamtspielzeit)|Rest], [(Vorname, Name,TotalZeit)|Finalrest]) :- %Ruft accu_time auf aktuellem Tupel auf
              																							   accu_time((Vorname, Name),
                       																					   [(Vorname, Name,Gesamtspielzeit)|Rest],
                       																					   AndereKompsListe,TotalZeit),
                       																			 		   %Rekursionsschritt mit dem Listenrest			
              																					  		   clean_up(AndereKompsListe,Finalrest).
              																					  		   %Abbruchbedingung -> Leere Liste
																							      		   clean_up([],[]).
																							      
																							     			
				%Hilfspr�dikat 2
				%Addiert die Zeiten eines Komponisten auf
				%(Vorname,Name) mitgeben damit das Attribut bei der Rekursion nicht verloren geht wenn es auf Rest angewendert werden soll
				
				accu_time((Vorname,Name),[(Vorname,Name,Gesamtspielzeit)|Rest],AndereKompsListe,TotalZeit) :-  %Rekursionsschritt		
																							 			accu_time((Vorname,Name),Rest,AndereKompsListe,TempZeit),!,
																										%Akkumulation der Werte
																			  							TotalZeit is TempZeit+Gesamtspielzeit.
																			  							%Abbruchbedingung
																			  							
				%Sobald ein anderer Komponist als der aktuelle gefunden wird wird in diesen Fall gewechselt und die Totalzeit wieder auf 0 gesetzt.
				%Somit ist gew�hrleistet dass nicht alle Zeiten aller Komponisten zusammenaddiert werden, sondern f�r jeden Komponisten
				%Die Zeiten einzeln auf ein Totales addiert werden
				accu_time((Vorname, Name),[(VornameDiff, NameDiff,Gesamtspielzeit)|Rest],[(VornameDiff, NameDiff,Gesamtspielzeit)|Rest],0) :- Vorname \= VornameDiff,
																																 		  	  Name \= NameDiff,!.
																																 		  	  accu_time((_Vorname, _Name),[],[],0).															  							
																							
								 
								 
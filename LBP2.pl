%Teil 1

%Teil 1.1

%Sammelt eine Liste der Komponisten ein die in der DB gegeben sind, anhand von Geburts und Sterbedatum.
%Findall sammelt anhand eines template Dinge aus dem Goal "komponist" ein indem es dies durchgeht und dann das Resultat mit List
%unifiziert. Dabei müssen die Bedingungen aus Checklist für die genannten Einträge erfüllt sein.
%Also ungleich null. Nur wenn dies erfüllt ist, wird der Eintrag Teil der Liste, ansonsten wird er übersprungen.
%Am Ende wird die Liste mit dem definierten Inhalt ausgegeben und das Programm evaluiert zu true.

collect_komp(List) :- findall((Vorname, Name, Geboren, Gestorben),			%template
                      		(komponist(Nr, Vorname, Name, Geboren, Gestorben),		%Goal
                       		Nr\=null,Vorname\=null,Name\=null,Geboren\=null,Gestorben\=null), %Checklist							
                      		List).												%unifies the contents of template with List	
	
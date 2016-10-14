

test(collect_kompA) :-
    write('collect_komp/1 '),
    collect_komp([('Georg Friedrich', 'Händel', 1685, 1759),
                  ('Serge', 'Prokofiev', 1891, 1953),
                  ('Claudio', 'Monteverdi', 1567, 1643),
                  ('Antonin', 'Dvorak', 1841, 1904),
                  ('Antonio', 'Vivaldi', 1678, 1741),
                  ('Leopold', 'Mozart', 1719, 1787),
                  ('Heinrich Ignaz Franz', 'Biber', 1644, 1704),
                  ('Georg Philipp', 'Telemann', 1681, 1767),
                  ('William', 'Byrd', 1543, 1623),
                  ('Wolfgang Amadeus', 'Mozart', 1756, 1791),
                  ('Ludwig van', 'Beethoven', 1770, 1827),
                  ('Johann Sebastian', 'Bach', 1685, 1750),
                  ('Gustav', 'Mahler', 1860, 1911),
                  ('Jean', 'Sibelius', 1865, 1957),
                  ('Hector', 'Berlioz', 1803, 1869),
                  ('Joseph', 'Haydn', 1732, 1809),
                  ('Peter', 'Tschaikowsky', 1840, 1893),
                  ('Felix', 'Mendelssohn Bartholdy', 1809, 1847),
                  ('Franz', 'Schubert', 1797, 1828),
                  ('Carl', 'Orff', 1895, 1982),
                  ('Dmitri', 'Schostakowitsch', 1906, 1975),
                  ('Josquin', 'Desprez', 1440, 1521),
                  ('Ermanno', 'Wolf-Ferrari', 1876, 1948),
                  ('Johannes', 'Brahms', 1833, 1897),
                  ('Benedetto', 'Marcello', 1686, 1739),
                  ('Lean-Marie', 'Leclair', 1697, 1764),
                  ('Arcangelo', 'Corelli', 1653, 1713),
                  ('Tommaso', 'Albinoni', 1671, 1750),
                  ('Domenico', 'Scarlatti', 1685, 1757),
                  ('Francesco', 'Manfredini', 1680, 1748),
                  ('Pietro', 'Locatelli', 1695, 1764),
                  ('Melchior', 'Franck', 1580, 1639),
                  ('Hans', 'Heselloher', 1420, 1485),
                  ('Giorgio', 'Mainerio', 1545, 1582),
                  ('Giacomo', 'Fogliano', 1468, 1548),
                  ('Heinrich', 'Isaak', 1450, 1517),
                  ('Giovan Domenico', 'Da Nola', 1510, 1592),
                  ('Filippo', 'Azzaiolo', 1530, 1569),
                  ('Tilman', 'Susato', 1500, 1561),
                  ('Clement', 'Janequin', 1485, 1558)
                  ]), write('.'),!,writeln('ok').

test(collect_az) :-
    write('collect_az '),
    collect_az([('Leopold', 'Mozart', 1719, 1787),
                ('Wolfgang Amadeus', 'Mozart', 1756, 1791),
                ('Ludwig van', 'Beethoven', 1770, 1827),
                ('Joseph', 'Haydn', 1732, 1809),
                ('Franz', 'Schubert', 1797, 1828)
                ]), write('.'),!,writeln('ok').

test(collect_dp) :-
    write('collect_dp '),
    collect_dp(['Decca','Philips'],
               [('Monteverdi: Vespro Della Beata Vergine 1610', 'Decca'),
                ('Vivaldi: Le Quattro Stagioni (I Musici)', 'Philips'),
                ('Bach: Violinkonzerte', 'Philips'),
                ('Sibelius: Symphony No.2 ...', 'Philips'),
                ('Berlioz: Harold in Italy', 'Decca'),
                ('Mozart: Hornkonzerte', 'Philips'),
                ('Haydn: Cellokonzerte', 'Philips'),
                ('Telemann: 5 Violinkonzerte', 'Philips')
                ]), write('.'),!,writeln('ok').


test(collect_kompB) :-
    write('collect_komp/2 '),
    collect_komp('Robin Williams',
                 [('Antonio', 'Vivaldi'),
                  ('Benedetto', 'Marcello'),
                  ('Georg Philipp', 'Telemann'),
                  ('Lean-Marie', 'Leclair')
                  ]), write('.'),!,writeln('ok').

test(collect_time) :-
    write('collect_time '),
    collect_time([('Georg Friedrich','Händel',455),
                  ('Serge','Prokofiev',488),
                  ('Claudio','Monteverdi',605),
                  ('Antonin','Dvorak',70),
                  ('Antonio','Vivaldi',149),
                  ('Leopold','Mozart',104),
                  ('Heinrich Ignaz Franz','Biber',95),
                  ('Georg Philipp','Telemann',170),
                  ('William','Byrd',67),
                  ('Wolfgang Amadeus','Mozart',181),
                  ('Ludwig van','Beethoven',64),
                  ('Johann Sebastian','Bach',198),
                  ('Gustav','Mahler',57),
                  ('Jean','Sibelius',69),
                  ('Hector','Berlioz',115),
                  ('Joseph','Haydn',47),
                  ('Peter','Tschaikowsky',58),
                  ('Felix','Mendelssohn Bartholdy',58),
                  ('Franz','Schubert',64),
                  ('Carl','Orff',158),
                  ('Dmitri','Schostakowitsch',68),
                  ('Josquin','Desprez',115),
                  ('Ermanno','Wolf-Ferrari',118),
                  ('Johannes','Brahms',60),
                  ('Benedetto','Marcello',43),
                  ('Lean-Marie','Leclair',43),
                  ('Arcangelo','Corelli',66),
                  ('Tommaso','Albinoni',66),
                  ('Domenico','Scarlatti',66),
                  ('Francesco','Manfredini',66),
                  ('Pietro','Locatelli',66),
                  ('Melchior','Franck',63),
                  ('Hans','Heselloher',63),
                  ('Giorgio','Mainerio',63),
                  ('Giacomo','Fogliano',63),
                  ('Heinrich','Isaak',63),
                  ('Giovan Domenico','Da Nola',63),
                  ('Filippo','Azzaiolo',63),
                  ('Tilman','Susato',63),
                  ('Clement','Janequin',63)
                ]), write('.'),!,writeln('ok').

test(and) :-
    %positiv
    write('and +'),
    and(true,true), write('.'),!,
    %negativ
    write('. -'),!,
    \+ and(true,fail), write('.'),!,
    \+ and(fail,true), write('.'),!,
    \+ and(fail,fail), write('.'),!,
    \+ and(fail,_X), write('.'),!,
    \+ and(_Y,fail),!, writeln('ok').

test(or) :-
    %positiv
    write('or +'),
    or(true,true), write('.'),!,
    or(true,fail), write('.'),!,
    or(fail,true), write('.'),!,
    %negativ
    write('. -'),!,
    \+ or(fail,fail), write('.'),!,
    \+ or(true,_X), write('.'),!,
    \+ or(_Y,true),!, writeln('ok').

test(mnot) :-
    %positiv
    write('mnot +'),
    mnot(fail), write('.'),!,
    %negativ
    write('. -'),!,
    \+ mnot(true), write('.'),!,
    \+ mnot(_X),!, writeln('ok').

test(lebkuchen) :-
    %positiv
    write('formeln +'),
    D1 = fail, E1 = fail, Z1 = true,
    and(and(mnot(and(E1,Z1)),impl(D1,Z1)),impl(and(Z1,mnot(E1)),mnot(D1))), write('.'),!,
    D2 = fail, E2 = true, Z2 = fail,
    and(and(mnot(and(E2,Z2)),impl(D2,Z2)),impl(and(Z2,mnot(E2)),mnot(D2))), write('.'),!,
    D3 = true, E3 = fail, Z3 = fail,
    impl(and(and(mnot(and(E3,Z3)),impl(D3,Z3)),impl(and(Z3,mnot(E3)),mnot(D3))),mnot(D3)), write('.'),!,
    D2 = fail, E2 = true, Z2 = fail,
    aequiv(mnot(impl(and(and(mnot(and(E2,Z2)),impl(D2,Z2)),impl(and(Z2,mnot(E2)),mnot(D2))),mnot(D2))),
           and(and(or(mnot(E2),mnot(Z2)),and(or(mnot(D2),Z2),or(mnot(D2),or(E2,mnot(Z2))))),D2)), write('.'),!,
    %negativ
    write('. -'),!,
    D3 = true, E3 = fail, Z3 = fail,
    \+ and(and(mnot(and(E3,Z3)),impl(D3,Z3)),impl(and(Z3,mnot(E3)),mnot(D3))), write('.'),!,
    D4 = true, E4 = true, Z4 = true,
    \+ and(and(mnot(and(E4,Z4)),impl(D4,Z4)),impl(and(Z4,mnot(E4)),mnot(D4))), !, writeln('ok').

test(allcds) :-
    test(collect_kompA),
    test(collect_az),
    test(collect_dp),
    test(collect_kompB),
    test(collect_time)
    .

test(alllogic) :-
    test(and),
    test(or),
    test(mnot),
    test(lebkuchen),
    formelA,
    formelB
    .

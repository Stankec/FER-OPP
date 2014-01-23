OPP
===

Projekt iz kolegija Oblikovanje Programske Potpore na FERu

Zadatak projekta:
===
 Dizajnirati i izraditi prodajni informacijski sustav koji će podržati poslovanje auto-servisa. Auto-servis 
 ima barem jednog mehaničara, barem jednog električara, jednog voditelja servisa i jednog direktora. 
 Oni su radnici auto-servisa studija i njegovim zatvaranjem automatski svi gube posao. Mehaničari i 
 električari nazivaju se servisni savjetnici. Direktor i voditelj su različite uloge ali mogu biti iste fizičke 
 osobe. 
 Prilikom zaprimanja stranke, voditelj servisa otvara novi radni nalog te unosi ime i prezime stranke, 
 adresu, kontakt telefon, a za vozilo stranke model, godište, registarsku oznaku, te opis kvara ili 
 postupaka na vozilu koje stranka traži. Svi podaci osim adrese stranke su obavezni. Radni nalozi imaju 
 svoju jedinstvenu šifru koju automatski generira sustav, datum i vrijeme nastanka i završetka, te 
 status: u tijeku („otvoren“), storniran, uspješno završen („zatvoren“). Na svakom radnom nalogu 
 naveden je jedan odgovorni servisni savjetnik, te postupci koji se obavljaju na autu i dijelovi koji se 
 mijenjaju. Sustav trajno pohranjuje podatke o strankama koje su bile u servisu, njihova vozila, te 
 radne naloge koji su na vozilima već izvršeni. 
 Nad autima stranaka izvršavaju se različiti postupci servisa – pregledi, računalna dijagnostika, 
 mehanički popravci, električki popravci, lakiranja, zamjene dijelova, i tako dalje. Svi postupci servisa 
 su unaprijed definirani u sustavu – svaki ima svoj opis, minimalni broj djelatnika potrebnih za 
 postupak, broj potrebnih rezervnih dijelova nekog tipa i trajanje postupka. Iz ovih podataka računa se 
 ukupni broj čovjek-sati jednog postupka: minimalni broj djelatnika * trajanje postupka u satima. 
 Različiti rezervni dijelovi koji pripadaju servisu su također pohranjeni u sustav. Za svaku stavku pamti 
 se: jedinstvena šifra, opis i cijena rezervnog dijela. Podatke o rezervnim dijelovima može unositi samo 
 voditelj servisa, a mehaničari samo čitati. Svi djelatnici servisa mogu vidjeti izvješće o stanju skladišta 
 – koliko dijelova servis u nekom trenutku ima i kojeg su tipa. Kada se neki rezervni dio pridruži nalogu 
 onda se njegovo stanje na skladištu automatski smanji za jedan. Voditelji mogu u otvoreni radni nalog 
 dodavati nove servisne postupke i rezervne dijelove, mijenjati ili brisati postojeće. 
 Nakon završetka svih radova na vozilu, tj. završetka servisnih postupaka iz otvorenog radnog naloga, 
 sustav temeljem jedinične cijene čovjek-sata koja je pohranjena u bazi, ukupnog broja potrošenih 
 radnih sati i cijene svih potrošenih dijelova automatski izračunava ukupnu cijenu radnog naloga koja 
 se prikazuje na ekranu. Nakon što stranka plati izvršene radove i radni nalog se zatvori od strane 
 voditelja servisa, sustav odmah izračunava i ažurira dnevnu bilancu servisa. Na kraju radnog vremena 2 
  
 pokreće se dnevni obračun, na kraju mjeseca mjesečni obračun koji je zbroj svih dnevnih obračuna 
 tijekom mjeseca, i na kraju godine godišnji obračun kao zbroj svih mjesečnih obračuna te godine. 
 Kroz sučelje samo direktor može imati uvid u dnevni, mjesečni i godišnji promet, odnosnu bilancu 
 servisa. Svi korisnici računalnog sustava logiraju se sa svojim korisničkim imenom i jedinstvenom 
 šifrom, te se korisničko sučelje prilagođava njihovim pravima pristupa podacima i dozvoljenim 
 funkcijama.
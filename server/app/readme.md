Organizacija:
===
### Assets
Sadrži sve resurse koje će webserver koristiti pri renderanju htmla.
Odnosno u ovom folderu se nalaze slike, javaskripte, CSS, SASS, Coffe, Fontovi, ...
### Controllers
Sadrži sve kontrollere s kojima je moguće imati interakciju kao korisnik aplikacije.
Oni određuju koje će se akcije izvoditi pri posjećivanju određenog URLa, te su nadležni
za renderanje html.erb fileova. Npr. u Controllerima će te deklatirati "globalne" varijable
kojima možete pristupati u .html.erb fileovima. Takve varijable prepoznajete po početnom znaku `@`,
npr. `@page`
### Helpers
Sadrži Ruby filove sa definicijama pomočnih metoda.
Pomočne metode su metode koje olakšavaju renderanje kompliciranih elemenata ili bilokoja funkcija
koja mora biti neovisna o controlleru i modelu.
### Mailers
Mailers obićno sadrži definicije za mail servere i generalni oblik emailova.
U ovom projektu uopće nismo koristili tu funkcionalnost, te taj folder sadrži samo autogenerirani sadržaj.
### Model
Models sadrži sve modele. U RoR aplikacijama, Modeli služe kao klase koje definiraju objekte.

Po paradigmi Rails 4 bi se u modelima trebala držati funkcije koje manipuliraju samo prosljeđeni objekt ili 
funkcije koje obrađuju velike setove podataka u ovisnosti o objektu nad kojim se pozivaju, te funkcije generalno 
korisne za neki skup istovrsnih podataka. Npr. `User` ima metodu `encryptPassword` koja se poziva nad pojedinačnim objektom
i služi za enkripciju passworda, pomoću Crypt algoritma, u Hash i Salt. `Page` ima metodu `search` koja se poziva nad samom 
klasom i vraća skup objekata klase `Page`.
### Uploaders
Ovaj folder sadrži uploadere generirane od strane `CarrierWave` gema.
U njima je definirano ponašanje programa prema podacima koju su bili uploadani.
Npr. generiranje manjih verzija slika, mjesto spremanja podataka, nomeniklatura, ...
### Views
Views sadrži sve HTML i JS filove kojima sadržaj određuju controlleri. Svi fileovi u ovom folderu moraju završavati
sa ekstenzijom `.erb` (Embeded Ruby Code) koja indicira da se u njima nalazi Ruby kod i da moraju biti interpretirani
od strane controllera prije nego što se renderaju.

Generalno pravilo je da će controller tražiti view u folderu koji nosi njegovo ime, te će koristiti onaj file koji nosi isto ime 
kao i ime metode. Tako da će npr. metoda `index` iz `StatementsController` pozvati view `views/statements/index.html.erb`.
Isto ponašanje je moguće promjeniti ako u controlleru specificiramo naredbom `render` što želimo da ta metoda rendera.
Npr. ako na kraju metode `index` iz `StatementsController` napišeo `render "vehicles/new"` tada će se pri pozivu te metode renderati
`views/vehicles/new`.

Važno je za znati da će kontroler, ako mu drugačije nije specificirano `respond` naredbom, uvjek zvati onau vrstu filea koja najbolje odgovara
tipu zahtjeva koji je dobio. Tako je moguće da u folderu `views/pages` postoji `index.html.erb` i `index.js.erb`, ako aplikacija dobije normalan request
zahtjev renderati će se `index.html.erb`, ali ako dobije request tipa `application/javascript` tada će renderati `index.js.erb` jer je to adekvatan format odgovora
za takav zahtjev.
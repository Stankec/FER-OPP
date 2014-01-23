Routes
===
Routs je nedvojbeno najbitniji file u ovom folderu. U njemu su definirane sve dozvoljene putanje i tipovi requesta koje će one prihvaćati.
Osim manualno definiranih putanja postoje i autogenerirane putanje za REST API, koje možemo prepoznati po ključnoj rijeći `resource`

Schedule
===
`Schedule.rb` je file koji generira `Whenever` gem. U njemu su definirani intervali u kojima se neki kod izvodi.
Npr. u ovom fileu je definirano da program svakih sat vremena promjeri dali je završilo radno vrijeme, ako je program
napravi obračun.

Ostalo
===
Ostali filovi definiraju ponašanje aplikacije. 

 - `enviroment.rb` služi za definiciju parametara radnog okruženja.
 - `database.yml` određuje način pristupanja bazi podataka
 - `boot.rb` sadrži metode koje se izvode prije podizanja aplikacije
 - `application.rb` definira specifičnosti same aplikacije, način cachiranja, encoding, ...
 - `locales` sadrži tablice prevođenja na druge jezike
 - `initializers` sadrži sve datoteke sa metodama koje se moraju izvrtiti prije nego li se aplikacija boota
 - `enviroments` sadži definicije radnih okruženja
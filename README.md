NORMALISERING
	1NF kräver att varje cell innehåller ett enda värde utan upprepande i andra grupper
	2NF kr<ven 1NF samt att ingen kolumn beror bara på en del av en sammansatt nyckel, en enkel nyckel t:ex Id uppfyller tekniskt sett 2NF
	Enligt Krav på 3NF så uppfylls redan 2NF, 1NF samt utöver det ska ingen kolumn som inte är nyckel bero på en annan kolumn.
	All data ska lagra på bara ett ställe jag har gjort mina tabeller med det i tanken.

DevSecOps-Reflektion
1
	Genom parametriseringen kan vi skydda oss från SQL injektion för det mesta,
	utöver det finns GRANT, DENY och REVOKE behörigheter som kan användas för att stoppa att databasen skadas om SQL kommer igenom
2
	Jag vet att det finns "Create Index" vilket skapar en typ av register eller "hitta lista"


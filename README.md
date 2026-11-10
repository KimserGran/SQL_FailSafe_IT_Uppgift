NORMALISERING
	1NF kräver att varje cell innehåller ett enda värde utan upprepande i andra grupper
	2NF kr<ven 1NF samt att ingen kolumn beror bara på en del av en sammansatt nyckel, en enkel nyckel t:ex Id uppfyller tekniskt sett 2NF
	Enligt Krav på 3NF så uppfylls redan 2NF, 1NF samt utöver det ska ingen kolumn som inte är nyckel bero på en annan kolumn.
	All data ska lagra på bara ett ställe jag har gjort mina tabeller med det i tanken.

DevSecOps-Reflektion


1
	Genom parametrisering kan vi skydda oss från SQL injektion för det mesta,
	utöver det finns GRANT, DENY och REVOKE behörigheter som kan användas för att stoppa att databasen skadas om SQL kommer igenom


2
	Jag vet att det går att använda Non-Clustered eller Clustered Index för att snabba upp sökningar



LUCID CHART LÄNK https://lucid.app/lucidchart/b2f73ef0-1d91-4ce5-aed5-46327008dc40/edit?invitationId=inv_4d96e4c9-9636-4641-a4d0-f2a670d7921d&page=0_0#

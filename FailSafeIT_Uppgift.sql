/*
STÄNGER ANDRA ANSLUTNINGAR OCH TAR BORT SEN SKAPAR DATABASEN, 
detta skrevs för att jag hörde att du ville kunna trycka på execute knappen igen utan något fel alls.
*/
USE Master
Go

IF DB_ID('FailSafeIT') IS NOT NULL
BEGIN
    ALTER DATABASE FailSafeIT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FailSafeIT;
END
GO

Create database FailSafeIT
GO

USE FailSafeIT
GO

/*
LÄGGER TILL TABLES
gjorde dessa tables i lucid chart, väldigt smidigt.

*/

CREATE TABLE [Konsulter] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Personnummer] VARCHAR(13),
  [KonsultNamn] NVARCHAR(100),
  [TimPris] DECIMAL(10,2),
  [KonsultSpecialitet] NVARCHAR(300)
);


CREATE TABLE [Kunder] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Organisationsnummer] VARCHAR(11),
  [FöretagsNamn] NVARCHAR(100),
  [KundEpost] NVARCHAR(100),
  [Telefonnummer] VARCHAR(15),
);

CREATE TABLE [Uppdrag] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [KundId] INT NOT NULL,
  [KonsultId] INT NOT NULL,
  [StartDatum] DATETIME2,
  [SlutDatum] DATETIME2,
  [RollBeskrivning] NVARCHAR(500),
  CONSTRAINT [FK_Uppdrag_KundId]
    FOREIGN KEY ([KundId])
      REFERENCES [Kunder]([Id]),
  CONSTRAINT [FK_Uppdrag_KonsultId]
    FOREIGN KEY ([KonsultId])
      REFERENCES [Konsulter]([Id])
);

/*
FYLLER TABLES
*/

Insert into Kunder (Organisationsnummer, FöretagsNamn, KundEpost, Telefonnummer) values
('112499-0025','Fredriks Hemgjorda Kebab','Freddes@StorSvararen.kebab','070-125 51 52'),
('912234-1001','Robins Snickarstuga','Robin@Molijoxer.se','072-555 90 12'),
('500322-1234','Kims Katt Massage','Kimpa@MasseraKatter.se','076-124 50 22')

Insert into Konsulter (Personnummer, KonsultNamn, TimPris, KonsultSpecialitet) values 
('19701115-1234','Göran Allt', 900,'Kan Göra Allt, specialiserad för allt som finns eller kommer finnas'),
('19940402-9850','Per Vers', 1500,'Kärleks pedagog, expert på allt inom kärlek och intimt'),
('19990325-8762','Jack Pott', 500,'Spelmissbruk expert, hjälper dig antingen att sluta spela eller fortsätta med garanterad vinst')

insert into Uppdrag (KundId, KonsultId, StartDatum, SlutDatum, RollBeskrivning) values
(1,1,'2026-11-15','2026-11-24','Fixa svarvarmaskinen, den funkar inte'),
(1,2,'2026-11-25','2026-11-30','Hjälp mig att flörta med min flickvän'),
(3,3,'2026-12-01','2026-12-10','Hjälp med mitt spelberoende'),
(2,1,'2026-12-11','2026-12-20','Behöver en extra hand i snickarstugan'),
(3,1,'2026-12-21','2027-01-10','Behöver ett nytt massagebord byggt')



/*
QUERY FRÅGOR A-E
*/
 --A
select k.KonsultNamn, k.TimPris
from Konsulter k
where TimPris > 1200
order by k.TimPris asc;

--B
select u.RollBeskrivning, k.FöretagsNamn, ko.KonsultNamn, u.StartDatum, u.SlutDatum
from Uppdrag u
join Kunder k on k.Id = u.KundId
join Konsulter ko on ko.Id = u.KonsultId

--C
select k.FöretagsNamn, COUNT(u.id) as Antal_Uppdrag
from Kunder k
left join uppdrag u on u.KundId = k.Id
group by k.Id, k.FöretagsNamn;

--D
UPDATE Konsulter
set TimPris = TimPris * 2
where id = 1

--E
DELETE FROM Kunder
WHERE Id = 1
  AND NOT EXISTS (SELECT 1 FROM Uppdrag WHERE KundId = 1);



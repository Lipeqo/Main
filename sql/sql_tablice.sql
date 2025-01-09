USE Szkola;

-- Tabela: Klasa
CREATE TABLE Tablica_Klasa (
    Klasa_Nazwa VARCHAR(8),
    Klasa_Data_Rozpoczecia DATETIME,
    Klasa_Sala VARCHAR(8),
    Klasa_Id INT PRIMARY KEY IDENTITY(1,1)
);

-- Tabela: Uczeñ
CREATE TABLE Tablica_Uczen (
    Uczen_Imie VARCHAR(32),
    Uczen_Nazwisko VARCHAR(64),
    Uczen_Plec INT,
    Uczen_Data_Urodzenia DATETIME,
    Uczen_Pesel VARCHAR(11) PRIMARY KEY,
    Uczen_Adres VARCHAR(100), -- Zwiêkszona d³ugoœæ
    Uczen_Telefon VARCHAR(15), -- Zwiêkszona d³ugoœæ
    Uczen_Id_Klasa INT,
    FOREIGN KEY (Uczen_Id_Klasa) REFERENCES Tablica_Klasa(Klasa_Id)
);

-- Tabela: Nauczyciel
CREATE TABLE Tablica_Nauczyciel (
    Nauczyciel_Imie VARCHAR(32),
    Nauczyciel_Nazwisko VARCHAR(64),
    Nauczyciel_Data_Urodzenia DATETIME,
    Nauczyciel_Pesel VARCHAR(11) PRIMARY KEY,
    Nauczyciel_Specjalizacja VARCHAR(250),
    Nauczyciel_Data_Zatrudnienia DATETIME,
    Nauczyciel_Rachunek VARCHAR(40)
);

-- Tabela: Przedmiot
CREATE TABLE Tablica_Przedmiot (
    Przedmiot_Nazwa VARCHAR(32),
    Przedmiot_Ilosc_Godzin INT,
    Przedmiot_Zakres TEXT,
    Przedmiot_Id INT PRIMARY KEY IDENTITY(1,1)
);

-- Tabela: Lekcja
CREATE TABLE Tablica_Lekcja (
    Lekcja_Temat VARCHAR(128),
    Lekcja_Data_Rozpoczecia DATETIME,
    Lekcja_Czas_Trwania INT,
    Lekcja_Id INT PRIMARY KEY IDENTITY(1,1),
    Lekcja_Sala VARCHAR(8),
    Lekcja_Klasa_Id INT,
    FOREIGN KEY (Lekcja_Klasa_Id) REFERENCES Tablica_Klasa(Klasa_Id),
    Lekcja_Nauczyciel_Pesel VARCHAR(11),
    FOREIGN KEY (Lekcja_Nauczyciel_Pesel) REFERENCES Tablica_Nauczyciel(Nauczyciel_Pesel),
    Lekcja_Przedmiot_Id INT,
    FOREIGN KEY (Lekcja_Przedmiot_Id) REFERENCES Tablica_Przedmiot(Przedmiot_Id)
);

-- Tabela: Poœrednia Klasa-Nauczyciel
CREATE TABLE Tablica_Posrednia_Klasa_Nauczyciel (
    Posrednia_Klasa_Id INT,
    FOREIGN KEY (Posrednia_Klasa_Id) REFERENCES Tablica_Klasa(Klasa_Id),
    Posrednia_Nauczyciel_Id VARCHAR(11),
    FOREIGN KEY (Posrednia_Nauczyciel_Id) REFERENCES Tablica_Nauczyciel(Nauczyciel_Pesel)
);



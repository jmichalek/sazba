Šablony pro právní dokumenty
============================

Autor: Jakub Michálek

Tato složka umožňuje vytvářet malé a typograficky propracované dokumenty pomocí sázacího systému XeTeX. Uživatel může vytvářet vlastní šablony se vzhledem, který mu vyhovuje. 


Postup při instalaci
--------------------
(Postup pro ubuntu)

1. Nainstalujte si verzovací systém git příkazem
`sudo apt-get install git`
1. Naklonujte si to z gitu příkazem 
`git clone https://github.com/jmichalek/sazba.git`
2. Můžete nyní začít systém používat k sazbě.

Používání
---------

1. Zkopírujte některou šablonu ze složky `files/forms/` do svého nového pracovního adresáře s rozdělanými projekty.
2. Ujistěte se, že ve vašem pracovním adresáři funguje symbolický odkaz na složku `files`. Pokud nefunguje, vytvořte nový symbolický odkaz na tuto složku a umistěte ho do adresáře, kde je soubor `main.tex`. 
3. Upravte soubor `main.tex` a zkompilujte ho příkazem `xelatex main`

Struktura adresáře
------------------

Pro uplnost zde popíšu ještě, jak je celý projekt strukturovaný:

+ `files` - složka s krátkodobě neměnnými soubory šablon
   - `fonts` - složka se soubory písem
   - `forms` - obsahové šablony se vzorovými dokumenty, které lze rovnou kopírovat
   - `styles` - styly pro formátování stránek a vlastní příkazy
+ `scripts` - základní skripty pro výpisy jednoduché spisové služby fom

Šablony pro právní dokumenty
============================

Autor: Jakub Michálek

Tato složka umožňuje vytvářet malé a typograficky propracované dokumenty pomocí sázacího systému XeTeX. Uživatel může vytvářet vlastní šablony se vzhledem, který mu vyhovuje. 

Před instalací musíte mít připravený systém XeTeX s potřebnými balíčky včetně gitu. To uděláte na distribuci ubuntu příkazem
`sudo apt-get install biber, biblatex-dw, texlive-xetex, texlive-lang-czechslovak, git`

Postup při instalaci
--------------------
(Postup pro ubuntu)

1. Naklonujte si zdroje z githubu příkazem 
`git clone https://github.com/jmichalek/sazba.git`
2. Vytvořte symbolický odkaz na příkaz makelatex ve své domovské složce 
`ln -s scripts/makelatex ~/bin/makelatex`
3. Můžete nyní začít systém používat k sazbě.


Používání
---------

1. Zkopírujte některou šablonu ze složky `files/forms/` do svého nového pracovního adresáře s rozdělanými projekty.
2. Upravte soubor `main.tex` a zkompilujte ho příkazem `makelatex main`

Struktura adresáře
------------------

Pro uplnost zde popíšu ještě, jak je celý projekt strukturovaný:

+ `files` - složka s krátkodobě neměnnými soubory šablon
   - `fonts` - složka se soubory písem
   - `forms` - obsahové šablony se vzorovými dokumenty, které lze rovnou kopírovat
   - `styles` - styly pro formátování stránek a vlastní příkazy
+ `scripts` - základní skripty pro výpisy jednoduché spisové služby fom

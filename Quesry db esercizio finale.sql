-- 1.Verificare che i campi definiti come PK siano univoci.
select count(product.ProductID), count(distinct product.ProductID)
from product;
select count(region.RegionID), count(distinct region.regionID)
from region;
select count(sales.salesID), count(distinct sales.salesID)
from sales; 
-- in questo modo mi assicuro che ogni valore del campo definito come primary key sia ripetuto solo una volta e quindi che sia univoco. 

-- 2.Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.  
select p.ProductID, p.ProductName, year(Date) as Anno, sum(Quantity*UnitCost) as Fatturato
from product p, sales s
where p.ProductID=s.ProductID
group by p.ProductID, year(Date)
;

select p.ProductID, p.ProductName, year(Date) as Anno, sum(Quantity*UnitCost) as Fatturato
from product p join sales s
on p.ProductID=s.ProductID
group by p.ProductID, year(Date)
;
/*NB: ho risolto sia utilizzando il join sia utilizzando il where per fare join tra tabelle.. ho notato che il risultato è lo stesso, 
è il metodo che avevo imparato all' università, causa alcuni problemi questa differenza? Perchè trovo che con il where mi sento molto più a mio agio, 
soprattutto se devo utilizzare più copie della stessa tabella. */

-- 3.Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.

select r.RegionID, r.RegionName, year(Date) as Anno, sum(Quantity*UnitCost) as Fatturato
from product p, sales s, region r
where p.ProductID=s.ProductID and r.RegionID=s.RegionID
group by r.RegionID, year(Date)
order by year(Date), Fatturato desc
;

select r.RegionID, r.RegionName, year(Date) as Anno, sum(Quantity*UnitCost) as Fatturato
from product p join sales s on p.ProductID=s.ProductID
join region r on r.RegionID=s.RegionID
group by r.RegionID, year(Date)
order by year(Date), Fatturato desc
;

-- 4.Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato? 

-- Con questa query controllo di aver preso in considerazione tute le vendite, successivamente aggiungendo la "limit 1" visualizzo solo il risultato richiesto.
select category as Categoria, sum(Quantity) as Quantità_Venduta
from product p, sales s
where p.ProductID = s.ProductID
group by category
limit 1;

select category as Categoria, sum(Quantity) as Quantità_Venduta
from product p join sales s on p.ProductID = s.ProductID
group by category
limit 1;

-- 5.Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti. 

-- caso 1: nella subquery mi prendo l' elenco dei productID presenti in sales, nella query esterna verifico quali productID siano presenti nella tabella. 
select productID
from Product
where productID not in (Select distinct productID from Sales);

-- caso 2: faccio join tra le 2 tabelle mantenendo tutte le righe della tabella Product, così facendo se qualche prodotto non è mai stato venduto avrà 
-- come valori della tabella sales tutti nulli, quindi con il where filtro per SalesID nullo. 
select p.productID
From Product p
left join Sales s on p.ProductID = s.ProductID
where s.SalesID is null;

-- 6.Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente

select p.ProductID, p.ProductName, max(Date)
from product p, sales s
where p.ProductID=s.ProductID
group by p.ProductID
;

select p.ProductID, p.ProductName, max(Date)
from product p join sales s
on p.ProductID=s.ProductID
group by p.ProductID
;

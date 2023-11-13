--VÝEW DE TABLO OLUSTURMA ÝÞLEMÝ

--create view vwDoktorKurum as
--select d.Ad+''+d.Soyad as 'Doktor Adý Soyadý' ,k.KurumAd
--from tblDoktor d
--join tblKurum k on k.ID=d.KurumID


--VÝEW DE SEÇME SORGUSU
select * from vwDoktorKurum

--VÝEW DE LÝKE KULLANIMI
where KurumAd like 'a%'

--VÝEW DE SON KAYDEDÝLEN 5 DOKTORU GETÝRÝR
create view vwSonEklenen5Doktor as 
select top(5) from tblDoktor 
order by ID desc 


--
create view vwSonEklenen5DoktorKurum as 
select top(5) d.Ad+''+d.Soyad as 'Doktor Adý Soyadý' ,k.KurumAd
from tblDoktor d
join tblKurum k on k.ID=d.KurumID
order by d.ID desc 
select * from vwSonEklenen5Doktor

--BÝR YILDA KAÇINCI GÜNDE OLDUÐUMUZU SÖYLER
select DATEPART(dy,GETDATE())

--BÝR YILDA KAÇINCI GÜNDE OLDUÐUMUZU 10 GÜN EKLEYEREK SÖYLER 
select DATEPART(dy,DATEADD(DD,10,GETDATE()))

--SATIÞ TARÝHÝNÝN GÜNÜNÜ 30 GÜN EKLEYEREK SÖYLER
select SatisTarihi,(DATEADD(DD,30, SatisTarihi)) 'Ödenecek Tarih' 
from tblRecete


select SatisTarihi,(DATEADD(DD,30, SatisTarihi)) 'Ödenecek Tarih' 
from tblRecete

select DATEDIFF(DD,1996-04-29,GETDATE()) 'Yasadýðým Gün Sayýsý'
select DATEDIFF(MM,1996-04-29,GETDATE())  'Yasadýðým Ay Sayýsý'
select DATEDIFF(YY,1996-04-29,GETDATE())  'Yasadýðým Yýl Sayýsý'
select DATEDIFF(HH,1996-04-29,GETDATE())  'Yasadýðým Saat Sayýsý'
select DATEDIFF(MI,1996-04-29,GETDATE())  'Yasadýðým Dakika Sayýsý'
select DATEDIFF(SS,1996-04-29,GETDATE())  'Yasadýðým Saniye Sayýsý'

--Degeri Belli Bir formata Çevirme
select CONVERT(nvarchar(10),GETDATE(),104)

select i.IlacAd, SUM(r.Fiyat) 'Toplam Fiyat',SUM(r.Adet)'Toplam Adet' from tblReceteDetay r
join tblIlac i on i.ID=r.IlacID
group by i.IlacAd
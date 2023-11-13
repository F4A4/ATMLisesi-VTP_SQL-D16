--V�EW DE TABLO OLUSTURMA ��LEM�

--create view vwDoktorKurum as
--select d.Ad+''+d.Soyad as 'Doktor Ad� Soyad�' ,k.KurumAd
--from tblDoktor d
--join tblKurum k on k.ID=d.KurumID


--V�EW DE SE�ME SORGUSU
select * from vwDoktorKurum

--V�EW DE L�KE KULLANIMI
where KurumAd like 'a%'

--V�EW DE SON KAYDED�LEN 5 DOKTORU GET�R�R
create view vwSonEklenen5Doktor as 
select top(5) from tblDoktor 
order by ID desc 


--
create view vwSonEklenen5DoktorKurum as 
select top(5) d.Ad+''+d.Soyad as 'Doktor Ad� Soyad�' ,k.KurumAd
from tblDoktor d
join tblKurum k on k.ID=d.KurumID
order by d.ID desc 
select * from vwSonEklenen5Doktor

--B�R YILDA KA�INCI G�NDE OLDU�UMUZU S�YLER
select DATEPART(dy,GETDATE())

--B�R YILDA KA�INCI G�NDE OLDU�UMUZU 10 G�N EKLEYEREK S�YLER 
select DATEPART(dy,DATEADD(DD,10,GETDATE()))

--SATI� TAR�H�N�N G�N�N� 30 G�N EKLEYEREK S�YLER
select SatisTarihi,(DATEADD(DD,30, SatisTarihi)) '�denecek Tarih' 
from tblRecete


select SatisTarihi,(DATEADD(DD,30, SatisTarihi)) '�denecek Tarih' 
from tblRecete

select DATEDIFF(DD,1996-04-29,GETDATE()) 'Yasad���m G�n Say�s�'
select DATEDIFF(MM,1996-04-29,GETDATE())  'Yasad���m Ay Say�s�'
select DATEDIFF(YY,1996-04-29,GETDATE())  'Yasad���m Y�l Say�s�'
select DATEDIFF(HH,1996-04-29,GETDATE())  'Yasad���m Saat Say�s�'
select DATEDIFF(MI,1996-04-29,GETDATE())  'Yasad���m Dakika Say�s�'
select DATEDIFF(SS,1996-04-29,GETDATE())  'Yasad���m Saniye Say�s�'

--Degeri Belli Bir formata �evirme
select CONVERT(nvarchar(10),GETDATE(),104)

select i.IlacAd, SUM(r.Fiyat) 'Toplam Fiyat',SUM(r.Adet)'Toplam Adet' from tblReceteDetay r
join tblIlac i on i.ID=r.IlacID
group by i.IlacAd
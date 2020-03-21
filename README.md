# SoalShiftSISOP20_modul1_A09
#### ADAM ABELARD GARIBALDI 05111840000125
#### ALBERTO SANJAYA 05111840000150
---

## Soal 1 
 > Source code 
 > **[soal1.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal1/soal1.sh)**

Pada soal 1 dibagi menjadi 3 sub-tugas yang memiliki tujuan utama agar dapat mengambil keuntungan yang paling sedikit berdasarkan "Sample-Superstore.tsv" , dimana untuk setiap sub-tugas diminta :
* Mentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

```
hasil1=$(awk -F $'\t'  'BEGIN{ Flag=1 }
NR>1{ reg[$13]+=$21 }
END{ for(i in reg)
{ if(Flag == 1)
  { cek = reg[i]
        Flag = 0 }
  else if(reg[i] < cek)
  {  cek = reg[i]
        namreg = i }
};
print namreg}' Sample-Superstore.tsv)
```
* Menampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin sub-soal pertama

```
echo " Nama State : "

hasil2=($(awk  -F $'\t' -v regtot=$hasil1 'BEGIN{ flag=0 }
NR>1{ if ($13 == regtot )
        { state[$11]+=$21 } }
END{ for(i in state)
        { print state[i] "," i }
}' Sample-Superstore.tsv | sort -n  | head -2 |

awk -F ',' '{print $2}' ) )

echo ${hasil2[0]}
echo ${hasil2[1]}
```

* Mampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil sub-soal ke-2

```
echo "Nama Produk : "


awk -F $'\t' -v state1=${hasil2[0]} -v state2=${hasil2[1]} 'BEGIN{ flag=0}
NR>1{ if ($11 == state1 || $11 == state2 )
        { prod[$17]+=$21 }
    }
END{ for(i in prod)
        { print  prod[i] "," i }
}' Sample-Superstore.tsv | sort -n | head -10 | awk -F ',' '{print $2}'
```
> masalah yang ditemui pada soal ini adalah ketika jawaban yang keluar berbeda.


![alt text](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/hasilsoal1.png)


---

## Soal 2
 > Source Code 
 > **[soal2.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal2/Soal2.sh)** ,
 > **[p2dekripsi.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal2/soal2_dekripsi.sh)** ,
 > **[p2enkripsi.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal2/soal2_enkripsi.sh)**
 
Pada soal ini dibagi menjadi 4 sub-tugas yang memanfaatkan rumus Caesar Cipher, dimana terbagi menjadi:
* Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.
* Menyimpan password acak tersebut pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
 
 command untuk membuat file txt.
 ```
 berkas=$1 
filename="${berkas%.*}"
```
command untuk men-generate random password
```
random=`<  /dev/urandom tr -dc A-Za-z0-9 | head -c28`
```
```
echo $random > $filename.txt
```

* Mengenkripsi file

untuk mendapatkan jam saat file dibuat maka gunakan fungsi ini
```
jam=`date "+%k"`;
```
lalu melakukan looping selama 25 lalu saat loop sudah sama dengan jam yang didapatkan maka melakukan enkripsi
```
for loop in $(seq 25); do
	if [ $loop -eq $jam ]
	  then
	  bisa=`echo $filename | tr $(printf %${loop}s | tr ' ' '.')\A-Za-z N-ZA-Mn-za-m`
	fi
done
echo $random > $bisa.txt
```
* Mendekripsi file

lalu melakukan looping selama 25 lalu saat loop sudah sama dengan jam yang didapatkan maka melakukan enkripsi
```
for loop in $(seq 25); do
	if [ $loop -eq $jam ]
	  then
	   bisa=`echo $filename | tr $(printf %${I}s | tr ' ' '.')\N-ZA-Mn-za-m A-Za-z`
	fi
done

echo $random > $bisa.txt
```

## Soal 3
> Source Code
> **[soal3.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal3/Soal3.sh)**

Pada soal ini dibagi menjadi 3 sub-tugas yang diantara lainnya menggunakan wget, crontab , dan ..., dimana terbagi menjadi:

* 3a
pada soal diberikan perintah untuk mendownload foto sebanyak 28 kali oleh karena itu saya menggunakan looping untuk mendownload dan menamainya
```
for i in $(seq 28); do
	wget -a "wget.log" "https://loremflickr.com/320/240/cat" -O "/home/adam/SISOP/pdkt_kusuma_$i"
done
```

* 3b
pada soal ini diminta membuat crontab untuk mendownload setiap 8 jam dimulai dari jam 06:05 setiap hari kecuali sabtu
```
5 6-23/8 * * 1-5,7 /home/adam/SISOP/soal3.sh
```

* 3c
untuk soal 3c saya belum sempat mengerjakan karena saya merasa kekurangan waktu untuk memahami dan mengerjakan soal

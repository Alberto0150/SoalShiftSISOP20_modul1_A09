# SoalShiftSISOP20_modul1_A09
#### ADAM ABELARD GARIBALDI 05111840000125
#### ALBERTO SANJAYA 05111840000150

## Soal 1
Source code **[Soal1/soal1.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal1/soal1.sh)**

untuk soal 1 dibagi menjadi 3 sub-soal, dimana untuk sub-soal pertama diminta :
-mentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit
>hasil1=$(awk -F $'\t'  'BEGIN{ Flag=1 }
>NR>1{ reg[$13]+=$21 }
>END{ for(i in reg)
>{ if(Flag == 1)
>  { cek = reg[i]
>        Flag = 0 }
>  else if(reg[i] < cek)
>  {  cek = reg[i]
>        namreg = i }
>};
>print namreg}' Sample-Superstore.tsv)
>echo " Nama Region : "
>echo  $hasil1


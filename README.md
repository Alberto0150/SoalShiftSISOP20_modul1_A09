# SoalShiftSISOP20_modul1_A09
#### ADAM ABELARD GARIBALDI 05111840000125
#### ALBERTO SANJAYA 05111840000150

## Soal 1
Source code **[soal1.sh](https://github.com/Alberto0150/SoalShiftSISOP20_modul1_A09/blob/master/Soal1/soal1.sh)**

Pada soal 1 dibagi menjadi 3 sub-soal, dimana untuk setiap sub-soal diminta :
*Mentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

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
'''

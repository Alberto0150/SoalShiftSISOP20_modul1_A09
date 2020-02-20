 #!/bin/bash

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


echo " Nama Region : "
echo  $hasil1
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

echo "Nama Produk : "


awk -F $'\t' -v state1=${hasil2[0]} -v state2=${hasil2[1]} 'BEGIN{ flag=0}
NR>1{ if ($11 == state1 || $11 == state2 )
        { prod[$17]+=$21 }
    }
END{ for(i in prod)
        { print  prod[i] "," i }
}' Sample-Superstore.tsv | sort -n | head -10 | awk -F ',' '{print $2}'




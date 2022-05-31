#============================================================================
#Name        : Olabisi_101198092assignment5.sh
#Author      : Damilola Olabisi
#Copyright   : Copyright: Damilola Olabisi, 2021
#Description : This script checks if directory exists and creates sub-directories
#              Move all type 1 in pokemon.csv to sub-directories  
#============================================================================
#!/bin/sh
#
#removes the header row from csv and moves into a temporary file
sed '1d' pokemon.csv > pokemonNew.csv 
echo Start: Creating directories and sub-directories files
#use the cut function to get only type 1
#check if directory exists if not create the directories based on the type
#redirect all type to sub-dirctories
while read line;
do
   type1=`echo $line | cut -d "," -f 3` 
   if [ -d $type1 ]; then 
      touch "$type1"/"$type1".csv
      echo $line >> "$type1"/"$type1".csv
      
    
   else mkdir $type1   
   fi
done < pokemonNew.csv
echo Done: Directories and sub-directories files are created
#remove temporary file
rm -f pokemonNew.csv


 



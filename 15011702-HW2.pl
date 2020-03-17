#!/usr/local/bin/perl
#ÖZGÜR KAN - 15011702
unless (open(DATA, "sequence1.txt")) {
die ("Couldn't find the sequence1.txt file\n");
}
  $s1 = <DATA>;
unless (open(DATA, "sequence2.txt")) {
die ("Couldn't find the sequence2.txt file\n");
}
  $s2 = <DATA>;
 @s1 = split //, $s1;
 @s2 = split //, $s2;
 @L;
 @N;
for($i=0;$i<@s1;$i++ ) {   
   for($j=0;$j<@s2;$j++ ) {                                                
      if($s1[$i] ne $s2[$j]) {         
         $L[$i][$j] = 0;
         $N[$i][$j] = 0;
      }         
      else {
         $L[$i][$j] = 1;
         $N[$i][$j] = 0;
      }      
   }
}   
print"  DOT PLOT FOR GIVEN TWO AMINO ACID WITH NOISE  \n \n";
     print"    | ";
   for($j=0;$j<@s2;$j++   )    
    {  
       print"  $s2[$j]  ";  
     }
     print"\n----------------------------------------------------------------------------------------------------------\n";
   for($i=0;$i<@s1;$i++ ){   
      print" $s1[$i]  | ";
      for($j=0;$j<@s2;$j++){
         if($L[$i][$j]==0){   
            print"     ";  
            }         
         else{ 
            print"  o  ";
            }
      }
      print("\n");
 }   
    printf("\n ENTER A NOISE LEVEL:");
    $noise_level = <>;
     for($i=0;$i<@s1;$i++){    
        for($j=0;$j<@s2;$j++){
            $top=0;
            $a=$i;
            $b=$j;         
            while($L[$a][$b]==1 and $N[$a][$b]==0){
                  $N[$a][$b] = 1;
                  $a=$a+1;
                  $b=$b+1;
                  $top=$top+1;                 
            }
            if($top<$noise_level){
               while($top > 0){
                  $a=$a-1;
                  $b=$b-1;
                  $top=$top-1;
                  $N[$a][$b] = 0;
               }
            }        
         }
      } 
print"  \n DOT PLOT CONTROL NOISE LEVEL = $noise_level\n";
     print"    | ";
   for($j=0;$j<@s2;$j++)    
    {  
       print"  $s2[$j]  ";  
    }
     print"\n----------------------------------------------------------------------------------------------------------\n";
   for($i=0;$i<@s1;$i++ ){   
      print" $s1[$i]  | ";
      for($j=0;$j<@s2;$j++){
         if($N[$i][$j]==0){   
            print"     ";  
            }         
         else{ 
            print"  o  ";
            }
      }
      print("\n");
 }   

 
% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
  nbrows=size(centroids,1);
  %vad carui cluster apartine punctul 
   for i = 1 : length( points(:, 1) );

      distanta_min = ( points( i, :) .- centroids( 1,:) );
      distanta_min = distanta_min * distanta_min';
      atribuire_cluster = 1;

      for j = 2 : nbrows;  
        distanta_min2 = ( points( i, :) .- centroids( j,:) );
        distanta_min2 = distanta_min2 * distanta_min2';
        if( distanta_min >= distanta_min2)
          atribuire_cluster = j;
          distanta_min = distanta_min2;
        endif
      endfor
    
     if(atribuire_cluster == 1) %daca punctul d apartine clusterului 1 atunci coloreaza in culoarea rosu
     scatter3(points(i, 1), points(i, 2), points(i, 3), [], [1 0 0]);
     hold on;
   else
     if(atribuire_cluster == 2) %daca punctul d apartine clusterului 2 atunci coloreaza in culoarea verde
     scatter3(points(i, 1), points(i, 2), points(i, 3), [], [0 1 0]);
     hold on;
   else
     if(atribuire_cluster == 3) %daca punctul d apartine clusterului 3 atunci coloreaza in culoarea albastru
     scatter3(points(i, 1), points(i, 2), points(i, 3), [], [0 0 1]);
     hold on;
   endif
 endif
endif
    
  endfor
  

endfunction
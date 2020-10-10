% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
  nbrows=size(centroids,1);
  %vad la care cluster trebuie sa ma raportez 
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
      
   %pentru fiecare punct calculez distanta dintre el si centroidul cel mai apropiat utilizand norma de ordinul 2 a diferentei si adun la cost 
   cost=cost+norm(points(i,:)-centroids(atribuire_cluster,:));  
   
  endfor
  
endfunction
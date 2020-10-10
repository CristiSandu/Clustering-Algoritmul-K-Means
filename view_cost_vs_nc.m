function view_cost_vs_nc(file_points)
  %citesc coordonatele punctelor  
  points=[struct2cell(load(file_points)){:}];
  
  for i=1:10
    %fac centroizi pentru fiecare i
    centroids=clustering_pc(points,i);
    %salvez costul pentru fiecare i intrun vector
    v(i)=compute_cost_pc(points,centroids); 
    
  endfor
  
  %afisez graficul
  plot(v);
 
endfunction
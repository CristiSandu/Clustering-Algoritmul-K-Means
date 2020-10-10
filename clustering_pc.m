function[centroids]= clustering_pc(points, NC)

    dimenspct = length(points(1,:));             %generare dimensiune puncte 
    nrpuncte   = length(points(:,1));             %generare nr de puncte 


    % initializare centroizi random
    pctmin = min(points);
    pctmax = max(points);
    pctdif = pctmax .- pctmin ;

        centroids = ones(NC, dimenspct) .* rand(NC, dimenspct);
    for i=1 : 1 : length(centroids(:,1))
      centroids(i,:)=centroids( i , : ).* pctdif;
      centroids(i,:)=centroids( i , : )+ pctmin;
    endfor
 
  pos_diff = 1.;

  while pos_diff > 0.0


    atribuire = [];
    % atribuie punctul celui mai apropiat centroid 
    for i = 1 : length( points(:, 1) );

      distanta_min = ( points( i, :) .- centroids( 1,:) );
      distanta_min = distanta_min * distanta_min';
      atribuire_cluster = 1;

      for j = 2 : NC;  
        
        distanta_min2 = ( points( i, :) .- centroids( j,:) );
        distanta_min2 = distanta_min2 * distanta_min2';
        
        if( distanta_min >= distanta_min2)
          atribuire_cluster = j;
          distanta_min = distanta_min2;
        endif
        
      endfor

      
      atribuire = [ atribuire; atribuire_cluster];

    endfor

    % pentru criteriul de oprire 
    pozitia_veche= centroids;

    % recalcularea pozitiei centroizilor 
    centroids = zeros(NC, dimenspct);
    pctdinCluster = zeros(NC, 1);

    for d = 1: length(atribuire);
      centroids( atribuire(d),:) += points(d,:);
      pctdinCluster( atribuire(d), 1 )++;
    endfor

    for c = 1: NC;
      if( pctdinCluster(c, 1) != 0)
        centroids( c , : ) = centroids( c, : ) / pctdinCluster(c, 1);
      else
        % seteaza clasterul random la o noua pozitie 
        centroids( c , : ) = (rand( 1, dimenspct) .* pctdif) + pctmin;
      endif
    endfor

    %criteriul de oprire 
    pos_diff = sum (sum( (centroids .- pozitia_veche).^2 ) );

  endwhile
endfunction
% computes the NC centroidss corresponding to the given points using K-Means
function centroids = clustering_pc_exp(points, NC)
	centroids = [];
% usage
% function[centroids, pointsInCluster, assignment]=
% myKmeans(points, NC)
%
% Output:
% centroids: matrix in each row are the Coordinates of a centroids
% pointsInCluster: row vector with the nbpointspoints belonging to
% the centroids
% assignment: row Vector with clusterAssignment of the pointsRows
%
% Input:
% pointsin rows
% NC : nb of centroidss to determine
%
% (c) by Christian Herta ( www.christianherta.de )
% Modified by Nghia Ho to improve speed

points_dim = length(points(1,:));
nbpoints  = length(points(:,1));

% init the centroidss randomly
points_min = min(points);
points_max = max(points);
points_diff = points_max .- points_min ;

% every row is a centroids
centroids = rand(NC, points_dim);
centroids = centroids .* repmat(points_diff, NC, 1) + repmat(points_min, NC, 1);

% no stopping at start
pos_diff = 1.;

% main loop until

while pos_diff &gt(0,0); 0.0
  % E-Step
  assignment = [];

  % assign each pointspoint to the closest centroids

  if(NC == 1) % special case
	assignment = ones(size(points,1), 1);
  else
	  dists = [];
	  for c = 1: NC
		d = points- repmat(centroids(c,:), size(points,1), 1);
		d = d .* d;
		d = sum(d, 2); % sum the row values

		dists = [dists d];
	  endfor

	  [a, assignment] = min(dists');

	  assignment = assignment';
  endif

  % for the stoppingCriterion
  oldPositions = centroids;

  % M-Step
  % recalculate the positions of the centroidss
  centroids = zeros(NC, points_dim);
  pointsInCluster = zeros(NC, 1);

  for c = 1: NC
	indexes = find(assignment == c);
	d = points(indexes,:);
	centroids(c,:) = sum(d,1);
	pointsInCluster(c,1) = size(d,1);

    if( pointsInCluster(c, 1) != 0)
      centroids( c , : ) = centroids( c, : ) / pointsInCluster(c, 1);
    else
      % set cluster randomly to new position
      centroids( c , : ) = (rand( 1, points_dim) .* points_diff) + points_min;
    endif
  endfor

  %stoppingCriterion
  pos_diff = sum (sum( (centroids .- oldPositions).^2 ) );
endwhile
endfunction
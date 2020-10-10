 function [NC points] = read_input_data(file_params, file_points)
	
  fid=fopen(file_params,'r');
  
	NC = 0;
	points = [];
  
  NC = fscanf(fid,'%d');
  points = [struct2cell(load(file_points)){:}];
  
endfunction


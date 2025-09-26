function writeGFO_CSV(OutFilename, t_dy, Rho, Rho_dot)
%OutFilenname of the file you're writing to
%t_dy is the time (epoch) of satellite position/velocity measurements in
%decimal year

file = fopen(OutFilename, 'w+');

%Headers
fprintf(file, 'time [dec. year], range [m], range-rate [m/s]\n');
%Print contents
for i = 1:length(t_dy)
    fprintf(file, '%.10f, %.6f, %.6f\n', t_dy(i), Rho(i), Rho_dot(i));
end

fclose(file);

end
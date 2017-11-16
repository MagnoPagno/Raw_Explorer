function probe = load_probe(filename)

% Load probe file
% 
% Input:
%     filename: name of probe file (file .prb)
%     
% Output:
%     probe: struct with probe data and metadata    
%
% Example:
%     probe = load_probe('20150226KTZN_run01.prb');
%
% Written by Matteo Caffini
% CIMeC - Universita' dgli Studi di Trento
% on October, 16th 2017 in Rovereto (TN)
%

probe = load(filename, '-mat');
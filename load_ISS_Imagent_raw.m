function T = load_ISS_Imagent_raw(filename)

% Load ISS Imagent Raw File
% 
% Input:
%     filename: name of fNIRS data from ISS Imagent
%     
%
% Output:
%     T: struct with T.metadata (metadata from filename) and T.data (data
%     from filename)
%     
%
% Example:
%     T = load_ISS_Imagent_raw('20150226KTZN_run01.txt');
%
% Written by Elena Assad and Matteo Caffini
% CIMeC - Universita' dgli Studi di Trento
% on July, 14th 2017 in Rovereto (TN)
%

%% Get options
opts = detectImportOptions(filename);
opts.CommentStyle = {'#'};    

%% Get comesichiama
fid = fopen(filename,'r');
sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Application = (sf{1});
T.metadata.Application = T.metadata.Application(1:end-1);

Model_1 = (sf{2});
Model_2 = (sf{3});
T.metadata.Model = [Model_1, ' ', Model_2];
T.metadata.Program_Version = (sf{10});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.File_Type = (sf{1});

%% Get #ACQ INFORMATION
fid = fopen(filename,'r');
l1 = '0';
while(~strcmp(l1,'#ACQ INFORMATION'))
    l1 = fgetl(fid);
end
sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Detector_Channels = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.External_MUX_Channels = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Auxiliary_Analog_Channels = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Waveform_Frequency = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Waveforms_Skipped = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Waveforms_Averaged = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Cycles_Averaged = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Acquisitions_per_Waveform = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Auxiliary_Digital_Channels = str2double(sf{1});

%% Get #Data Update Rate
fid = fopen(filename,'r');
l1 = '0';
while(~strcmp(l1,'#Data Update Rate'))
    l1 = fgetl(fid);
end
sf = fgetl(fid);
sf = strsplit(sf,' ');
T.metadata.Update_Rate = str2double(sf{1});

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Use_Phase_Reference = false;
   else
     T.metadata.Use_Phase_Reference = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Use_Continuous_Phase_Reference = false;
   else
     T.metadata.Use_Continuous_Phase_Reference = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Use_Intensity_Reference = false;
   else
     T.metadata.Use_Intensity_Reference = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Use_Continuous_Intensity_Reference = false;
   else
     T.metadata.Use_Continuous_Intensity_Reference = true;
end

%% Get #FILE INFORMATION
fid = fopen(filename,'r');
l1 = '0';
while(~strcmp(l1,'#FILE INFORMATION'))
    l1 = fgetl(fid);
end
sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.External_MUX_Channel_results_PARSED = false;
   else
     T.metadata.External_MUX_Channel_results_PARSED = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.AC_DC_and_Phase_NOT_grouped = false;
   else
     T.metadata.AC_DC_and_Phase_NOT_grouped = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Companion_Program_Settings_File_NOT_created = false;
   else
     T.metadata.Companion_Program_Settings_File_NOT_created = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.AC_data_not_excluded = false;
   else
     T.metadata.AC_data_not_excluded = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.DC_data_not_excluded = false;
   else
     T.metadata.DC_data_not_excluded = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Phase_data_not_excluded = false;
   else
     T.metadata.Phase_data_not_excluded = true;
end

sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Auxillary_Chn_data_not_excluded = false;
   else
     T.metadata.Auxillary_Chn_data_not_excluded = true;
end

%% Get #CALIBRATION STATE
fid = fopen(filename,'r');
l1 = '0';
while(~strcmp(l1,'#CALIBRATION STATE'))
    l1 = fgetl(fid);
end
sf = fgetl(fid);
sf = strsplit(sf,' ');
if strcmp((sf{1}),'FALSE')
     T.metadata.Waveform_Calibration_Values_APPLIED = false;
   else
     T.metadata.Waveform_Calibration_Values_APPLIED = true;
end

%% Get tabular data
T.data = readtable(filename, opts);
T.data.ExtraVar1 = [];
nColumns = size(T.data,2);
T.data.Properties.VariableUnits = [ {'ms' '' '' '' ''} , repmat({'photons'},[1 nColumns-10]) , {'' '' '' '' ''}];

%% Get metadata window
% f2 = figure('Name','Metadata','NumberTitle','off');
% T_m = struct2table(T.metadata);
% str2 = string(T_m.Properties.VariableNames);
% C2 = table2cell(T_m);
% str3 = string(C2);
% 
% b = uicontrol('style','text','FontSize',8.5);
% set(b,'String',{str2});
% b.Position = [25 0 300 400]; 
% 
% b2 = uicontrol('style','text','Position',[300 0 100 400]);
% set(b2,'String',{str3});

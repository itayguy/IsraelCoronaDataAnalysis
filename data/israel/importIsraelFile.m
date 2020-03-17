function [date1,whoyear,totalinfected,newcases,lightcondition,mediumcondition,seriouscondition,death,totaldeaths,recovered,totalrecovered] = importIsraelFile(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [DATE1,WHOYEAR,TOTALINFECTED,NEWCASES,LIGHTCONDITION,MEDIUMCONDITION,SERIOUSCONDITION,DEATH,TOTALDEATHS,RECOVERED,TOTALRECOVERED]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [DATE1,WHOYEAR,TOTALINFECTED,NEWCASES,LIGHTCONDITION,MEDIUMCONDITION,SERIOUSCONDITION,DEATH,TOTALDEATHS,RECOVERED,TOTALRECOVERED]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [date1,whoyear,totalinfected,newcases,lightcondition,mediumcondition,seriouscondition,death,totaldeaths,recovered,totalrecovered] = importfile('total-cases-covid-19-israel.csv',2, 24);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2020/03/16 20:23:52

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: text (%s)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
date1 = dataArray{:, 1};
whoyear = dataArray{:, 2};
totalinfected = dataArray{:, 3};
newcases = dataArray{:, 4};
lightcondition = dataArray{:, 5};
mediumcondition = dataArray{:, 6};
seriouscondition = dataArray{:, 7};
death = dataArray{:, 8};
totaldeaths = dataArray{:, 9};
recovered = dataArray{:, 10};
totalrecovered = dataArray{:, 11};



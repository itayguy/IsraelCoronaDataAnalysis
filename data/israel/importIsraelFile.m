function [date1,who_year,total_infected,new_cases,light_condition,medium_condition,serious_condition,death,total_deaths,recovered,total_recovered] = importIsraelFile(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [DATE1,WHO_YEAR,TOTAL_INFECTED,NEW_CASES,LIGHT_CONDITION,MEDIUM_CONDITION,SERIOUS_CONDITION,DEATH,TOTAL_DEATHS,RECOVERED,TOTAL_RECOVERED]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [DATE1,WHO_YEAR,TOTAL_INFECTED,NEW_CASES,LIGHT_CONDITION,MEDIUM_CONDITION,SERIOUS_CONDITION,DEATH,TOTAL_DEATHS,RECOVERED,TOTAL_RECOVERED]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [date1,who_year,total_infected,new_cases,light_condition,medium_condition,serious_condition,death,total_deaths,recovered,total_recovered] = importfile('total-cases-covid-19-israel.csv',2, 23);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2020/03/14 09:54:26

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
who_year = dataArray{:, 2};
total_infected = dataArray{:, 3};
new_cases = dataArray{:, 4};
light_condition = dataArray{:, 5};
medium_condition = dataArray{:, 6};
serious_condition = dataArray{:, 7};
death = dataArray{:, 8};
total_deaths = dataArray{:, 9};
recovered = dataArray{:, 10};
total_recovered = dataArray{:, 11};


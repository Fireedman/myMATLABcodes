%%
%Program to read/save data to workspace

%First, it is created the work directory

initFolder='.\';
dName=uigetdir(initFolder);
if isequal(dName,0)
    warning('User has cancelled the search, using the default directory to work')
    dName='.\';
    savePath=fullfile(dName,('genTemp'));
    [parentFolder,workFolder]=fileparts(savePath);
    newSubFolder=sprintf('%s',savePath);
    
    if ~exist(newSubFolder,'dir')
        mkdir(newSubFolder);
    else
        warning('Verify that the directory has the correct workfiles')
    end
else
    disp(['The working directory it´s: ' dName])
    savePath=fullfile(dName,'temp');
    [parentFolder,workFolder]=fileparts(savePath);
    newSubFolder=sprintf('%s',savePath);
    if ~exist(newSubFolder,'dir')
        mkdir(newSubFolder);
    else
        warning('Verify that the directory has the correct workfiles')
    end
end
%%
%Copying the workfiles
%esto es para leer pero me falta copiar los archivos al directorio de
%trabajo para modificacion del archivo
numArchivos=2;
for i=1:numArchivos
    serie=num2str(i);
    prefix='\workingFile';
    sufix='.csv';
    newName=[parentFolder,prefix,serie,sufix];
    [workingF,workingPF]=uigetfile(dName,'.csv');
    newNameWF=[prefix,serie,sufix];
    if isequal(workingF,0)
        warning('User has canceled the search')
    else
        disp(['User has selected the file: ',fullfile(workingPF,workingF)]);
        [status,msg,~]=copyfile([workingPF,workingF],[savePath,newNameWF]);
    end
end
%%
%Reading the files
[status,msg]=fopen([savePath,newNameWF],'r');
if status==-1
    error(['I couldn´t open the file: %s',newline,'%s'],newNameWF,msg)
else
    warning('verify what you wanna do')
    %Load .csv files
    %{
    d=dir([savePath,newNameWF]);
    dbtype(fullfile(d(1).folder,d(1).name),'1:5');
    ds=datastore([savePath,'\*',sufix]);
    dataRaw=readall(ds);
    head(dataRaw)
    %}
    
end
fclose all;
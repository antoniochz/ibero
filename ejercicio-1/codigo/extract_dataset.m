%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Dr. Antonio Cedillo Hernández
%%% 05/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Crear carpetas utilizando META.MAT
clc;
clear all;
load('dataset-cifar-100\meta.mat');
for i=1:length(fine_label_names)
    mkdir('dataset-cifar-100\CIFAR-100\TEST\',fine_label_names{i});
    mkdir('dataset-cifar-100\CIFAR-100\TRAIN\',fine_label_names{i});
end
%% Extraer imagenes y guardar en carpeta correspondiente
%% Imagenes de entrenamiento
load('train.mat');
im=zeros(32,32,3);
for cpt=1:50000   
    R=data(cpt,1:1024);
    G=data(cpt,1025:2048);
    B=data(cpt,2049:3072);
    k=1;
    for x=1:32
        for i=1:32
            im(x,i,1)=R(k);
            im(x,i,2)=G(k);
            im(x,i,3)=B(k);
            k=k+1;
        end
    end  
    im=uint8(im);
    pathdest = strcat('dataset-cifar-100\CIFAR-100\TRAIN\',fine_label_names{fine_labels(cpt)+1},'\',filenames{cpt});
    imwrite(imresize(im,[227 227]),pathdest,'png'); 
end
%% Imagenes de prueba
load('dataset-cifar-100\test.mat');
im=zeros(32,32,3);
for cpt=1:10000   
    R=data(cpt,1:1024);
    G=data(cpt,1025:2048);
    B=data(cpt,2049:3072);
    k=1;
    for x=1:32
        for i=1:32
            im(x,i,1)=R(k);
            im(x,i,2)=G(k);
            im(x,i,3)=B(k);
            k=k+1;
        end
    end  
    im=uint8(im);
    pathdest = strcat('dataset-cifar-100\CIFAR-100\TEST\',fine_label_names{fine_labels(cpt)+1},'\',filenames{cpt});
    imwrite(imresize(im,[227 227]),pathdest,'png'); 
end

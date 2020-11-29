%Na pasta Mandani Controllers que fiz, e bastante facil chamas a funcao
%fuzzy abre a GUI e depois adiciono um input e mudo as funçoes do fuzzyset
%e adiciono as regras

%As regras estao de acordo com as tabelas no final dos slides do capitulo 7
%Tem todos 2 inputs

%Input: 3 fuzzy sets, Output: 3 fuzzy sets, Rules: 9.
md_trimf_9 = readfis('MamdaniControllers/md_trimf_9.fis');
%Input: 3 fuzzy sets, Output: 5 fuzzy sets, Rules: 9.
md_trimf_9p = readfis('MamdaniControllers/md_trimf_9p.fis');

%Input: 3 fuzzy sets, Output: 3 fuzzy sets, Rules: 9.
md_gaussmf_9 = readfis('MamdaniControllers/md_gaussmf_9.fis');
%Input: 3 fuzzy sets, Output: 3 fuzzy sets, Rules: 9.
md_gaussmf_9p = readfis('MamdaniControllers/md_gaussmf_9p.fis');

%Input: 5 fuzzy sets, Output: 5 fuzzy sets, Rules: 25.
md_trimf_25 = readfis('MamdaniControllers/md_trimf_25.fis');
%Input: 5 fuzzy sets, Output: 5 fuzzy sets, Rules: 25.
md_gaussmf_25 = readfis('MamdaniControllers/md_gaussmf_25.fis');

fuzzySystem = md_gauss_9; %Fuzzy controller to be used by the sim
out = sim('MamdaniControllers/continuousProcess.slx',300);


% This work for the Implementation and Testing a Personalized Medicine Support System for Chronic Myeloid Leukaemia
% Codeed by: Haneen Banjar
%email:hrbanjar@kau.edu.sa
%%
classdef CMLPatintData < handle
    
    properties (GetAccess = public, SetAccess = public)

        data;%  patint dat
        count;% the number of patient in DS
        PMData;% Predictive factors
        PSData;%prognostic factors
        %Prognostic factor
        age;%yr
        spleensize;%cm
        Platelet;%(x 109/L)
        blastsPercentage;% of leukocytes)
        eosinophilsPercentage; % of leukocytes)
        basophilsPercentage; % of leukocytes)
        
        %Predictive factor
        gender;
        bcrabl1transcripttype;
        oa;%OCT activity
        bcrabl1level;
        monocytes;
        basophils;
        eosinophils; 
        wcc;
        blasts;
        
        %outcome
        sokalscore;
        SokalOutput;
        hasfordscore;
        HasfordOutput
        eutosscore;
        EUTOSOutput;
        ELTSscore;
        ELTSOutput;
        TreeD;
        TreeE;
        TreeF;
        CB;
        combinedprognostic;
        predictiveresponseD;
        predictiveresponseE;
        predictiveresponseF;
    end% properties
    methods
        function obj = CMLPatintData(obj)
            obj.data=  csvread('CMLData.csv');
            r=size(obj.data);
            if isempty(obj.data)
                obj.count=1;
            else
                obj.count=r(1,1)+1;
            end%if
            obj.PMData= csvread('Cat24.csv');
            obj.PSData= csvread('TrainS.csv');
       
        %Prognostic factor
        obj.age=0;
        obj.spleensize=0;%cm
        obj.Platelet=0;%(x 109/L)
        obj.blastsPercentage=0;% of leukocytes)
        obj.eosinophilsPercentage=0; % of leukocytes)
        obj.basophilsPercentage=0; % of leukocytes)
        
        %Predictive factor
        obj.gender=-1;
        obj.bcrabl1transcripttype=-1;
        obj.oa=-1;%OCT activity
        obj.bcrabl1level=-1;
        obj.monocytes=-1;
        obj.basophils=-1;
        obj.eosinophils=-1; 
        obj.wcc=-1;
        obj.blasts=-1;
        
        % Models
        obj.TreeD;
        obj.TreeE;
        obj.TreeF;
        obj.CB;
        
        %outcome
        obj.sokalscore=-1;
        obj.hasfordscore=-1;
        obj.eutosscore=-1;
        obj.combinedprognostic=-1;
        obj.predictiveresponseD=-1;
        obj.predictiveresponseE=-1;
        obj.predictiveresponseF=-1;
        end%CMLData function
        function sokalscore=Sokal(obj,age, spleensize, Platelet, blastsPercentage)
            obj.age=age;
            obj.spleensize=spleensize;
            obj.Platelet=Platelet;
            obj.blastsPercentage=blastsPercentage;
            %Sokal Calculator
            obj.SokalOutput=exp((0.0116*(age-43.4))+0.0345*(spleensize-7.51)+0.188*((power((Platelet/700),2))-0.563)+0.0887*(blastsPercentage-2.1));
            if obj.SokalOutput<0.8
                sokalscore=1;
                elseif obj.SokalOutput>0.8 && obj.SokalOutput<1.2
                    sokalscore=1;
                    elseif obj.SokalOutput>1.2
                        sokalscore=0;
            end%endif
            
            obj.sokalscore=sokalscore;
        end%Sokal function
        function hasfordscore = Hasford(obj, age,spleensize,Platelet,blastsPercentage, eosinophilsPercentage,basophilsPercentage )
            % Variables Initialization 
            if age<50
               AgeScoreH=0;
            else
               AgeScoreH=1;
            end
            
            if basophilsPercentage<3
               BasophilsScoreH=0;
            else
               BasophilsScoreH=1;
            end
            
            if  Platelet<1500
                PlateletsScoreH=0;
            else
                PlateletsScoreH=1;
            end
          %Hasford Calculator
          obj.HasfordOutput=((0.6666*AgeScoreH)+(0.042*spleensize)+(0.0584*blastsPercentage)+(0.0413*eosinophilsPercentage)+(0.2039*BasophilsScoreH)+(1.0956*PlateletsScoreH))*1000;
          if obj.HasfordOutput<780 || obj.HasfordOutput==780
             hasfordscore=1;
             elseif obj.HasfordOutput>781 && obj.HasfordOutput<1480
                 hasfordscore=1;    
                 elseif obj.HasfordOutput>1481 || obj.HasfordOutput==1481
                     hasfordscore=0;
          end%endif
          obj.eosinophilsPercentage=eosinophilsPercentage;
          obj.basophilsPercentage=basophilsPercentage;
          obj.hasfordscore=hasfordscore;
        end%Hasford function
        function eutosscore = EUTOS(obj,basophilsPercentage,spleensize)
  % EUTOS Calculator
            obj.EUTOSOutput=(7*basophilsPercentage)+(4*spleensize);
            if obj.EUTOSOutput<87
                eutosscore=1;
                    elseif obj.EUTOSOutput>87 || obj.EUTOSOutput==87
                        eutosscore=0;
            end %endif
        obj.eutosscore=eutosscore;
        end%EUTOS function
        function ELTSscore = ELTS(obj, age,spleensize,Platelet,blastsPercentage )
  % ELTS Calculator
            obj.ELTSOutput=(0.0025* (power((age/10),3)))+ (0.0615*spleensize)+ (0.1052*blastsPercentage)+ (0.4104*(power((Platelet/1000),-0.5)));
            if obj.ELTSOutput<2.2185
                ELTSscore=1;
                    elseif obj.ELTSOutput>2.2185
                        ELTSscore=0;
            end %endif
        obj.ELTSscore=ELTSscore;
        end%EUTOS function
        function combinedprognostic = CombinedScore(obj)
            % Consisstancy Test
           if  obj.sokalscore==1 && obj.hasfordscore==1 && obj.eutosscore==1 && obj.ELTSscore==1
                 combinedprognostic=1;
               elseif obj.sokalscore==0 && obj.hasfordscore==0 && obj.eutosscore==0 && obj.ELTSscore==0
                 combinedprognostic=0;
                     else
                        obj.CB=fitcsvm(...
                        obj.PSData(:,[ 1 2 3 4]), ...
                        obj.PSData(:,5), ...
                        'KernelFunction', 'polynomial', ...
                        'PolynomialOrder', 2, ...
                        'KernelScale', 'auto', ...
                        'BoxConstraint', 1, ...
                        'Standardize', true, ...
                        'ClassNames', [0; 1]);
                        combinedprognostic=predict(obj.CB,[obj.SokalOutput  obj.HasfordOutput  obj.EUTOSOutput  obj.ELTSOutput]);
            end%endif
            obj.combinedprognostic=combinedprognostic;
        end%combinedscore function
        function obj = ModelD(obj)
           IndexInputNum=[2 3 7 13 15];% Age Spleen Blast Monocytes and Gender
           obj.TreeD = classregtree(obj.PMData(:,IndexInputNum),obj.PMData(:,1),'method', 'classification', 'splitcriterion', 'gdi', 'categorical',1: length(IndexInputNum));            
           obj.predictiveresponseD =str2double(eval(obj.TreeD,[obj.age obj.spleensize obj.blasts obj.monocytes obj.gender]));    
        end%ModelD function
        function obj = ModelE(obj)
           IndexInputNum=[2 3 6 7 8 10 15 16];% Age Spleen Eosinophiles Blast OA BCR-ABL Transcript level  Gender and BCR-ABL transcript Type
           obj.TreeE = classregtree(obj.PMData(:,IndexInputNum),obj.PMData(:,1),'method', 'classification', 'splitcriterion', 'gdi', 'categorical',1: length(IndexInputNum));            
           obj.predictiveresponseE =str2double(eval(obj.TreeE,[obj.age obj.spleensize obj.eosinophils obj.blasts obj.oa obj.bcrabl1level obj.gender obj.bcrabl1transcripttype ])); 
        end%ModelE function
        function obj = ModelF(obj)
            IndexInputNum=[ 3 7 8 15];%  Spleen  Blast OA  and  Gender 
            obj.TreeF = classregtree(obj.PMData(:,IndexInputNum),obj.PMData(:,1),'method', 'classification', 'splitcriterion', 'gdi', 'categorical',1: length(IndexInputNum));            
            obj.predictiveresponseF =str2double(eval(obj.TreeF,[ obj.spleensize  obj.blasts obj.oa  obj.gender ])); 
        end%ModelF function  
        function StoreData(obj)
            %Counter for patient in storage
              obj.data(obj.count,1)=obj.count;
      
              obj.data(obj.count,2)=obj.sokalscore;
              obj.data(obj.count,3)=obj.hasfordscore;
              obj.data(obj.count,4)=obj.eutosscore;
              obj.data(obj.count,5)=obj.combinedprognostic;
              obj.data(obj.count,6)=obj.predictiveresponseD;
              obj.data(obj.count,7)=obj.predictiveresponseF;
              obj.data(obj.count,8)=obj.predictiveresponseE;
               
             % Store th enew patint record
             csvwrite(strcat('CMLData.csv'),obj.data);
             
        end% StoreData
    end% methods
end% classdef
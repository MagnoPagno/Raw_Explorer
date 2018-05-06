classdef NIRSdata
    %commentare al più presto 
    
    properties
       subject = struct('name', [],...
		   'sname', [],...
		   'bdate', [],...
		   'age', [], ...
		   'ID', [], ...
		   'note', [] )
                    
                    
	   measureinfo = struct('date', [],...
		   'duration', [],...
		   'sourceposition', [],...
		   'detectorposition', [],...
		   'samplingfrequency', [],...
		   'calibration', [],...
		   'ID', [],...
		   'note', [])
                     
      eventss = struct('eventsColors', [],...
		  'eventsCodes', [],...
		  'eventsLabels', [])
      
	  data = struct('data', [],...
		  'goodness', [],...
		  'video', [])
       
	  analysis = struct('filter', [],...
		  'filtereddata', [])
    end
    
    methods
        function obj = untitled2(inputArg1,inputArg2)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end


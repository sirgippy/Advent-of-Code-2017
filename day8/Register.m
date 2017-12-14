classdef Register < handle
    %REGISTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name
        value
    end
    
    methods
        function obj = Register(name)
            obj.name = name;
            obj.value = 0;
        end
        
        function inc_value(obj,num)
            obj.value = obj.value + num;
        end
        
        function dec_value(obj,num)
            obj.value = obj.value - num;
        end
    end
    
end


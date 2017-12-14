classdef RegisterList < handle
    %REGISTERLIST Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        registers
        highest_value_ever
    end
    
    methods
        function obj = RegisterList()
            obj.registers = Register.empty();
            obj.highest_value_ever = 0;
        end
        
        function process_next_line(obj,line)
            out = textscan(line,'%s %s %d %s %s %s %d');
            modify_who = out{1};
            modify_how = out{2};
            modify_by = out{3};
            check_who = out{5};
            check_type = out{6};
            check_amount = out{7};
            
            if obj.checkPasses(check_who,check_type,check_amount)
                obj.modify_register(modify_who,modify_how,modify_by);
            end
            
        end
        
        function register = add_register(obj,name)
            register = Register(name);
            obj.registers(end+1) = register;
        end
        
        function tf = checkPasses(obj,who,type,amount)
            if ~obj.register_exists(who)
                register = obj.add_register(who);
            else
                register = obj.get_register(who);
            end
            
            if strcmp(type,'>')
                tf = register.value > amount;
            elseif strcmp(type,'<')
                tf = register.value < amount;
            elseif strcmp(type,'>=')
                tf = register.value >= amount;
            elseif strcmp(type,'<=')
                tf = register.value <= amount;
            elseif strcmp(type,'==')
                tf = register.value == amount;
            else
                tf = register.value ~= amount;
            end
            
        end
        
        function tf = register_exists(obj,name)
            tf = false;
            for ii=1:length(obj.registers)
                if strcmp(obj.registers(ii).name,name)
                    tf = true;
                    return
                end
            end
        end
        
        function register = get_register(obj,name)
            for ii=1:length(obj.registers)
                if strcmp(obj.registers(ii).name,name)
                    register = obj.registers(ii);
                    return
                end
            end
        end
        
        function modify_register(obj,who,how,by)
            if ~obj.register_exists(who)
                register = obj.add_register(who);
            else
                register = obj.get_register(who);
            end
            
            if strcmp(how,'inc')
                register.inc_value(by);
            else
                register.dec_value(by);
            end
            
            if register.value > obj.highest_value_ever
                obj.highest_value_ever = register.value;
            end
        end
        
        function value = get_max_value(obj)
            value = obj.registers(1).value;
            for ii=2:length(obj.registers)
                if obj.registers(ii).value > value
                    value = obj.registers(ii).value;
                end
            end
        end
        
        function value = get_highest_value_ever(obj)
            value = obj.highest_value_ever;
        end
    end
    
end


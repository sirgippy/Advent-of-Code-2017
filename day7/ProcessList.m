classdef ProcessList < handle
    %PROCESSLIST Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        processes
    end
    
    methods
        function obj = ProcessList()
            obj.processes = Process.empty();
        end
        
        function process = addProcess(obj,name,varargin)
            if isempty(varargin)
                process = Process(name);
            elseif length(varargin) < 2
                process = Process(name,varargin{1});
            else
                child_names = varargin{2};
                children = obj.createChildList(child_names);
                process = Process(name,varargin{1},children);
                obj.addParentToChildren(process,children);
            end
            
            obj.processes(end+1) = process;
        end
        
        function process = getProcess(obj,name)
            for ii=1:length(obj.processes)
                if strcmp(obj.processes(ii).getName, name)
                    process = obj.processes(ii);
                    return
                end
            end
            process = [];
        end
        
        function root = getRoot(obj)
            current = obj.processes(1);
            while (true)
                if isempty(current.getParent())
                    root = current;
                    return
                else
                    current = current.getParent();
                end
            end
        end
        
        function addInformation(obj,name,weight,varargin)
            process = obj.getProcess(name);
            if isempty(process)
                if isempty(varargin)
                    obj.addProcess(name,weight);
                else
                    obj.addProcess(name,weight,varargin{1});
                end
            else
                process.addWeight(weight);
                if ~isempty(varargin)
                    children = obj.createChildList(varargin{1});
                    obj.addParentToChildren(process,children);
                    process.addChildren(children);
                end 
            end
        end
        
        function children = createChildList(obj,child_names)
            children = Process.empty();
            for ii=1:length(child_names)
                next_child = obj.getProcess(child_names{ii});
                if isempty(next_child)
                    next_child = obj.addProcess(child_names{ii});
                end
                children(end+1) = next_child;
            end
        end
        
        function addParentToChildren(obj,process,children)
            for ii=1:length(children)
                children(ii).setParent(process);
            end
        end
        
        function process = getAdjustedWeight(obj)
            root = obj.getRoot;
            process = root.getAdjustedWeight;
        end
    end
    
end


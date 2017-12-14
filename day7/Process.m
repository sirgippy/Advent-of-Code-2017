classdef Process < handle
    
    properties
        name
        weight
        parent
        children
    end
    
    methods
        function obj = Process(name,varargin)
            obj.name = name;
            obj.parent = [];
            if nargin < 2
                obj.weight = NaN;
                obj.children = [];
            elseif nargin < 3
                obj.weight = varargin{1};
                obj.children = [];
            else
                obj.weight = varargin{1};
                obj.children = varargin{2};
            end
        end
        
        function name = getName(obj)
            name = obj.name;
        end
        
        function parent = getParent(obj)
            parent = obj.parent;
        end
        
        function setParent(obj,parent)
            obj.parent = parent;
        end
        
        function weight = getWeight(obj)
            weight = obj.weight;
        end
        
        function children = getChildren(obj)
            children = obj.children;
        end
        
        function addWeight(obj,weight)
            obj.weight = weight;
        end
        
        function addChildren(obj,children)
            obj.children = children;
        end
        
        function tf = isBalanced(obj)
            tf = true;
            
            if ~isempty(obj.children)
                first_weight = obj.children(1).getTreeWeight;
                for ii=1:length(obj.children)
                    if ~obj.children(ii).isBalanced || ...
                            obj.children(ii).getTreeWeight ~= first_weight
                        tf = false;
                    end
                end
            end 
        end
        
        function weight = getTreeWeight(obj)
            if ~isempty(obj.children)
                weight = obj.weight + length(obj.children)*obj.children(1).getTreeWeight;
            else
                weight = obj.weight;
            end
        end
        
        function weight = getAdjustedWeight(obj)
            for ii=1:length(obj.children)
                if ~obj.children(ii).isBalanced
                    weight = obj.children(ii).getAdjustedWeight;
                    return
                end
            end
            
            tree_weights = zeros(length(obj.children),1);
            for ii=1:length(obj.children)
                tree_weights(ii) = obj.children(ii).getTreeWeight;
            end
            ix = find(tree_weights ~= mode(tree_weights),1);
            adjustment = mode(tree_weights) - tree_weights(ix);
            weight = obj.children(ix).getWeight + adjustment;
            
        end
    end
    
end


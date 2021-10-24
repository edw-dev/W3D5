# class PolyTreeNode
#     attr_reader :value, :parent, :children
#     def initialize(value)
#         @value = value
#         @parent = nil
#         @children = []
#     end
#     def inspect
#         @value.inspect
#     end
#     def parent=(parent)
#         unless @parent
#             @parent = parent
#             @parent.children << self unless @parent.children.include?(self)
#         else 
#             @parent.children.delete(self)
#             @parent = parent
#             @parent.children << self unless  @parent == nil || @parent.children.include?(self)
#         end
#     end
#     def add_child(child)
#         child.parent=self
#     end
#     def remove_child(child)
#         raise "not a child" if child.parent == nil
#         child.parent=nil 
#     end

#     def dfs(target)
#         return self if self.value == target
#         self.children.each do |child|
#             result = child.dfs(target) 
#             return result unless result.nil?
#         end
#         nil
#     end
#     def bfs(target)
#         arr = [self]
#         until arr.empty?
#             ele = arr.shift
#             return ele if ele.value == target
#             ele.children.each {|child| arr << child}
#         end
#         nil
#     end


# end

class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(node)
        @value = node
        @parent = nil
        @children = []
    end
    def inspect
        @value.inspect
    end
    def parent=(node)
        @parent.children.delete(self) if !@parent.nil?
        @parent = node
        @parent.children << self if !@parent.nil? && !node.children.include?(self)
    end
    def add_child(node)
        node.parent = self
        self.children << node unless self.children.include?(node)
    end
    def remove_child(node)
        raise "node not child" if !self.children.include?(node)
        node.parent = nil
        self.children.delete(node)
    end
    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result if result != nil
        end
        nil
    end

    def bfs(target)
        arr = [self]
        until arr.empty?
            result = arr.shift
            return result if result.value == target
            result.children.each {|child| arr << child}
        end
        nil
    end


end
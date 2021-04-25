class Tree
    attr_accessor :children, :node_name

    def initialize(branch)
        # Без проверки на существование первого ключа, потому что не знаю,
        # как идиоматично выкинуть ошибку. Исключения в Ruby есть?.. :D
        # TODO: Добавить проверку
        @node_name = branch.keys.first
        @children = branch[@node_name].map {|name, subtree| Tree.new({ name => subtree })}
    end

    def visit_all(&block)
        visit &block
        @children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

tree = Tree.new({
    'grandpa' => {
        'dad' => {
            'child1' => {},
            'child2' => {}
        },
        'uncle' => {
            'child3' => {},
            'child4' => {}
        }
    }
})
tree.visit_all {|node| puts node.node_name}

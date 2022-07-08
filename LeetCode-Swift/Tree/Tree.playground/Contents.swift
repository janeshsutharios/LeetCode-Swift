// Implementing a simple tree which has nodes
class TreeNode<T> {
    
    var value:T
    var children:[TreeNode] = []
    
    init(_ value:T) {
        self.value = value
    }
    
    func addChild(value:TreeNode) {
        children.append(value)
    }
    
    func printTree() {
        print("Root is--->", value)
        children.map {print("Childrens are---> ", $0.value)}
    }
}
// Depth First Traversal ...
extension TreeNode {
    
    func depthFirstTraversal(visit:(TreeNode)-> Void) {
        visit(self)
        children.forEach {
            $0.depthFirstTraversal(visit: visit)
        }
    }
    
}

let monitors = TreeNode("Monitors")
monitors.addChild(value: TreeNode("ACER"))
monitors.addChild(value: TreeNode("ASUS"))
monitors.addChild(value: TreeNode("SONY"))
monitors.printTree()
monitors.depthFirstTraversal {
    print("values--->",$0.value)
}

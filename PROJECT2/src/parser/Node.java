package parser;
import java.util.ArrayList;
import java.util.List;

public class Node {
    private String label;
    private List<Node> children;

    public Node(String label) {
        this.label = label;
        this.children = new ArrayList<>();
    }

    public void addChild(Node child) {
        children.add(child);
    }

    public String getLabel() {
        return label;
    }

    public List<Node> getChildren() {
        return children;

    }

    public void printTree(String indent) {
        System.out.println(indent + label);
        for (Node child : children) {
            child.printTree(indent + "  ");
        }
    }
}
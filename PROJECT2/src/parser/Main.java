package parser;


import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            TinyLexer lexer = new TinyLexer(new FileReader("test/tiny.txt"));
            TinyParser parser = new TinyParser(lexer);
            Node syntaxTree = (Node) parser.parse().value;
            syntaxTree.printTree("");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
// ExampleLSystemDesigns - contains initialization methods
// to set up parameters and init the LSystem (from the main file)

import java.util.HashMap;

// [TODO]: create your own L-System initialization methods
// and use/test in the setup() method of L1LSystemAssignment file. 
// See example for Square Lsystem below.

// Square Lsystem initialization 
// This method returns an Lsystem object that uses
// The rules and axioms for a square based system
LSystem initSquare() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "F+F+F+F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+F-F-FF+F+F-F");
    
  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initCustom1() {
  // initialize turtle variables
  float moveDist = 5;
  float rotateAngle = 45;
  float scaleFactor = 0.07;
  
  // The intial axiom / input string
  //String axiom = "F[+F]F[-F]";
  String axiom = "OF[+FL]F[-FL][F]";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F[+FL]F[-FL][F]");
    
  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initCustom2() {
  // initialize turtle variables
  float moveDist = 50;
  float rotateAngle = 20;
  float scaleFactor = 0.5;
  
  // The intial axiom / input string
  String axiom = "OF";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F',"F[+F-F++FL][-F+F--FL]F");
    
  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initCustom3() {
  // initialize turtle variables
  float moveDist = 50;
  float rotateAngle = 88;
  float scaleFactor = 0.7;
  
  // The intial axiom / input string
  String axiom = "F+F+F+F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F',"F[+F-G++F][-F+G--F]F");
  rules.put('G',"F[-G+F--G]");
    
  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

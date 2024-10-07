// ExampleLSystemDesigns - contains initialization methods
// to set up parameters and init the LSystem (from the main file)

import java.util.HashMap;

// [TODO]: create your own L-System initialization methods
// and use/test in the setup() method of L1LSystemAssignment file. 

_ProbabilisticLSystem initCustom() {
  // initialize turtle variables
  float moveDist = 50;
  float rotateAngle = 10;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "OF";
  
  // Create any production rules
  HashMap<Character, String[]> rules = new HashMap<>();
  String[] F_rules = {
    "F[-F-FL][++FL][+F+FL]F",
    "F[-F-F++FL][+F+F--FL]",
    "F+F[-FL][+FL]",
    "F[-F-F][-F][+F-F]F",
    "F[-F-F-F][+F+F--F]",
    "F-F[-F][-F]",
  };
  rules.put('F',F_rules);
    
  // Create and return the Lsystem
  return new _ProbabilisticLSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

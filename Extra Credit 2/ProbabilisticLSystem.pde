// This is an implementation of an L-System that extends the class 
// "BaseLSystem", which makes it easy to make new types of LSystems (e.g., probabalistic)
// without repeating lots of code.
// It assumes all input vocabulary not given a rule are constants. 
// Though you could give an explicit rule for a constant using "F" --> "F"
// It contains a StringBuffer (currentIterationBuffer) that should be used
// to handle production rules when computing the currentIteration string as part of iterate
// in order avoid wasteful creation of strings and memory problems.
// The StringBuffer is used in the iterate method of the LSystem.
// @author: @mriveralee
import java.util.HashMap;

class _ProbabilisticLSystem extends BaseLSystem {
  
 // Production rules
  private HashMap<Character, String[]> rules;

  // Constructor for making an Lsystem object
  public _ProbabilisticLSystem(String axiom, HashMap<Character, String[]> rules, 
    float moveDistance, float rotateAngle, float scaleFactor) {            
    
    // Call Super Class constructor to initialize variables
    // You must always call this.
    super(axiom, moveDistance, rotateAngle, scaleFactor);
    
    // Set the Rules
    this.rules = rules;
    
    // Reset the state
    this.reset();
  }
  
  // runs 1 iteration, performing the rules for each character
  // on the current string. The result of the replacement is added to the currentIterationBuffer.
  public void iterate() {
    // get a copy of the current iteration string
    String current = this.getIterationString();
    
    // Now clear the current interation string
    this.clearCurrentStringBuffer();
    
    // [TODO]: Implement the procedure for using the rules to replace characters in the current string, 
    // and append them them to the currentIterationBuffer
    for(char letter : current.toCharArray()) {
        if(rules.containsKey(letter)) {
          String[] current_rules = rules.get(letter);
          int random_idx = int(random(current_rules.length));
          String random_rule_selection = current_rules[random_idx];
          currentIterationBuffer.append(random_rule_selection);
        }
        else {
          currentIterationBuffer.append(letter);
        }
    }
    
     // Increment our iteration after we are done
     iterationNum += 1;
  }
  
  // This function uses the turtle to draw based on each character in the LSystem's 
  // iteration string. It also handles scaling the moveDistance (to keep the image in frame), if desired
  public void drawLSystem(Turtle t) {
    // Our turtle's move distance
    float dist = this.moveDistance;
    
    // Scale the movement, if necessary, to help keep the image in frame 
    // when it gets too big
    if (scaleFactor != 0) {
      // Get the current iteration number for scaling 
      int iterationNum = this.getIterationNum();
      dist = dist / (scaleFactor * (iterationNum + 1));
    }
    
    // Get the current iteration string
    String currentIteration = this.getIterationString(); 
    
    // Loop through each character in the iteration string,
    // and do turtle operations based on the character
    for (int i = 0; i < currentIteration.length(); i++) {
      Character c = currentIteration.charAt(i); 
      float rand = random(1);
      switch (c) {
        case 'F':
          t.forward(random(0.5,2) * dist);
        break; // The "break" exits out of the switch statement and prevents the next cases from running
        
        case 'G':
          t.forward(dist); // non-random forward for different rules
        break;          
        
        case 'B':
          t.back(random(0.5,2) * dist);
        break;
        
        case 'L': // random leaf design (diamond, triangle, or spikes)
        float leaf_length = dist;
          if(rand > 0 && rand <= 0.33) {
            t.push();
            t.left(30);
            t.forward(leaf_length);
            t.right(30);
            t.forward(leaf_length);
            t.left(30);
            t.back(leaf_length);
            t.right(30);
            t.back(leaf_length);
            t.pop();
          }
          else if(rand > 0.33 && rand <= 0.67) {
            t.push();
            t.left(90);
            t.back(leaf_length * 0.5);
            t.forward(leaf_length);
            t.right(120);
            t.forward(leaf_length);
            t.right(120);
            t.forward(leaf_length);
            t.pop();
          }
          else if(rand > 0.67 && rand <= 1) {
            t.push();
            t.left(30);
            t.forward(leaf_length);
            for(int j=0; j<3; j++) {
              t.left(10);
              t.back(leaf_length*0.5);
              t.right(25);
              t.forward(leaf_length*0.5);
            }
            t.left(10);
            t.back(leaf_length);
            t.pop();
          }
          
        break;
        
        case 'O': // bottom center offset (for tree structures that just go up, offset turtle to bottom of screen
          t.penUp();
          t.goToPoint(width/2,height);
          t.penDown();
        break;
        
        case 'R': // bottom right offset
          t.penUp();
          t.goToPoint(width,height);
          t.penDown();
        break;
        
        case 'A':
        // ignore A; for use with the Hilbert curve
        break;
        
        case 'C':
        // ignore B; for use with the Hilbert curve
        break;

        case '+':
          t.right(random(0.5,2) * rotateAngle);
        break;

        case '-':
          t.left(random(0.5,2) * rotateAngle);
        break;
        
        case '[':
          t.push();
        break;
        
        case ']':
          t.pop();
        break;
        
        default:
          // Throw an error if we don't have a draw operation implemented 
          throw new IllegalArgumentException("Missing a drawing operation case for character: " + c.toString());  
      }
    }
  }
}

import java.io.*;
import java.util.*;

public class Longcat {
  ArrayList<Integer> catLine;
  int direction;
  boolean isDead;
  boolean boba;
  int position;
   
  public Longcat()
  {
    catLine = new ArrayList<Integer>();
    catLine.add(144);
    
    /*for the direction 
    right = 1     left = -1   up = -20     down = +20 */
    direction = 1;
    isDead = false;
    boba = false;
    position = 144;
  }
  
  void turn(String direct)
  {
    if (direct.equals("UP") && !(direction == 20))
      direction = -20;
    else if (direct.equals("DOWN") && !(direction == -20))
      direction = 20;
    else if (direct.equals("RIGHT") && !(direction == -1))
      direction = 1;
    else if (direct.equals("LEFT") && !(direction == 1))
      direction = -1;
    
  }
  
  void checkMove(int[] grid) {
    position = catLine.get(0);
    boolean onSnake = false;
    int temppos;
    for (int i = 0; i < catLine.size(); i++)
    {
      temppos = catLine.get(i);
      if ( temppos == position + direction)
      onSnake = true;
    }
    
    //check if front is clear
    if ((direction == 1) && (position % 20 == 19))
      isDead = true;
    else if ((direction == -1) && (position % 20 == 0))
      isDead = true;
    else if ((direction == -20) && (position <= 19))
      isDead = true;
    else if ((direction == 20) && (position >= 279))
      isDead = true;
    else if (onSnake == true)
      isDead = true;
    else{
      move(position, grid);
    }
  }
  
  void move(int position, int[] grid){
    /*
    add new int (first list item + direction)
    remove last list item UNLESS boba = true
    check if front is clear (snake or out of bounds)
    */
    if(grid[position + direction] == 2) {
      boba = true;
      makeBoba(grid);
    }
    
    catLine.add(0, position + direction);
    grid[position + direction] = 1;
    if (boba == false)
    {
      grid[catLine.get(catLine.size() - 1)] = 0;
      catLine.remove(catLine.size() - 1);
      
    }
    boba = false;
  }
  
  void makeBoba(int[] grid) {
    int x = (int) random(0,14);  
    int y = (int) random(0,19);
    
    while(grid[(x * 20) + y] == 1) {
      x = (int) random(0,14);  
      y = (int) random(0,19);
    }
    
    
    grid[(x * 20) + y] = 2;
  }
}

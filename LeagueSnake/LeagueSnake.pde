//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*
int BlockSize = 10;
int CanvasSize = 25;


int SnakeLength = 4;

int headX;
int headY;


int foodX;
int foodY;

String direction = "UP";

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  int X;
  int Y;

  Segment(int SpawnX, int SpawnY) {

    X = SpawnX;
    Y = SpawnY;
  }

  void drawSeg() {
    fill(0, 255, 0);
    rect(X, Y, BlockSize, BlockSize);
  }
  int GetX() {
    return X;
  }
  int GetY() {
    return Y;
  }
  // Add a constructor with parameters to initialize each variable.
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*





//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*
ArrayList<Segment> Segs = new ArrayList<Segment>();

void setup() {
  size(500, 500);
  dropFood();
  frameRate(20);
}

void dropFood() {
  //Set the food in a new random location

  foodX = ((int)random(50)*10);    
  foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  clear();
  background(255);
  drawFood();
  drawSnake();
  move();
  eat();
  checkBoundaries();
  if(direction.equals("UP")){
    Segs.add(new Segment(headX, headY+BlockSize));
  }else if(direction.equals("DOWN")){
    Segs.add(new Segment(headX, headY-BlockSize));
  }else if(direction.equals("LEFT")){
    Segs.add(new Segment(headX+BlockSize, headY));
  }else if(direction.equals("RIGHT")){
    Segs.add(new Segment(headX-BlockSize, headY));
  }
  
  if (Segs.size() > SnakeLength) {
    Segs.remove(0);
    
  }
  for (int i = 0; i < Segs.size(); i++) {
    Segs.get(i).drawSeg();
    
    //print(Segs.get(i).GetX()+"          "+headX+"\n");
    if(Segs.get(i).GetX() == headX && Segs.get(i).GetY() == headY){
      SnakeLength = 4;
      Segs = new ArrayList<Segment>(); 
    }
  }

}

void drawFood() {
  //Draw the food
  fill(255, 0, 0);
  rect(foodX, foodY, BlockSize, BlockSize);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0, 255, 0);
  rect(headX, headY, BlockSize, BlockSize);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (keyCode == UP) {
    direction = "UP";
  } else if (keyCode == DOWN) {
    direction = "DOWN";
  } else if (keyCode == LEFT) {
    direction = "LEFT";
  } else if (keyCode == RIGHT) {
    direction = "RIGHT";
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.


  switch(direction) {
  case "UP":
    // move head up here 
    headY-=BlockSize;
    break;
  case "DOWN":
    // move head down here 
    headY+=BlockSize;
    break;
  case "LEFT":
    // figure it out 
    headX-=BlockSize;

    break;
  case "RIGHT":
    // mystery code goes here 
    headX+=BlockSize;
    break;
  }
}

void checkBoundaries() {
  //If the snake leaves the frame, make it reappear on the other side
  if (headX > width) {
    headX = 0;
  }
  if (headY > height) {
    headY = 0;
  }  
  if (headX < 0) {
    headX = width;
  }
  if (headY < 0) {
    headY = height;
  }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if (headX == foodX && headY == foodY) {
    dropFood();
    SnakeLength++;
  }
}

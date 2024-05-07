void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP)
    {
      frogY-=50;
    } else if (keyCode == DOWN)
    {
      frogY+=50;
    } else if (keyCode == RIGHT)
    {
      frogX+=50;
    } else if (keyCode == LEFT)
    {
      frogX-=50;
    }
  }
}

void ground() {

  image(lunten, 0, 650);
  image(wasser2, 0, 0);
  image(oben, 0, 15);



  if (frogY >= 700) {
    frogY = 675;
  }
  if (frogX >= 700) {
    frogX = 675;
  }
  if (frogX <= 0) {
    frogX = 25;
  }
  if (frogY <= 0) {
    frogY = 25;
  }
}

void scoreBoard() {
  for (int i = 0; i < live; i++) {
    image(froglive, 730 + i* 37, 350 );
  }
  for (int i = 0; i < time / 60; i++) {
    fill(0, 255, 0);
    rect(730 + i*5, 600, 5, 20);
  }
  time--;
}
void resetFrog() {
  frogX = 350;
  frogY = 675;
  rt = 0;
}

void touched() {
  if (frogY > 400 && frogY < 650) {
    for (int i = 0; i < vehicle.length; i++) {
      if ((frogY > vehicle[i].y && frogY < vehicle[i].y+40) && (frogX > vehicle[i].x && frogX < vehicle[i].x + vehicle[i].size)) {
        resetFrog();
        live--;
      }
    }
  }



  if (frogY > 100 && frogY < 350) {
    for (int i = 0; i < water.length; i++) {
      if ((frogY > water[i].y && frogY < water[i].y + 40) && (frogX > water[i].x && frogX < water[i].x + water[i].size)) {
        //if (dist(frogX, frogY, water[i].x, water[i].y) < 40 + water[i].size) {
        rt = 0;
        break;
      } else {
        rt = 1;
      }
    }
    if (rt == 1) {
      resetFrog();
      live--;
    }



    if (frogY > 300  && frogY < 350 ) {
      frogX -= water[0].speed;
    }
    if (frogY > 250  && frogY < 300 ) {
      frogX += water[3].speed;
    }
    if (frogY > 200  && frogY < 250 ) {
      frogX += water[6].speed;
    }
    if (frogY > 150  && frogY < 200 ) {
      frogX -= water[9].speed;
    }
    if (frogY > 100  && frogY < 150 ) {
      frogX += water[12].speed;
    }


    //for (int i = 0; i < 5; i++) {
    //  if (frogY > 100 + i* 50  && frogY < 150 + i *50 ) {
    //    frogX += water[i * 3].speed;
    //  }
    //}
  }
}

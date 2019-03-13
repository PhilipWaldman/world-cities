void setup() {
  //size(900, 450); // 2.5 pixels per degree
  size(1080, 540); // 3 pixels per degree
  background(0);
  noLoop();
}

void draw() {
  final Table file = loadTable("worldcities.csv");

  scale(1, -1);
  translate(width/2, -height/2);

  // find max population
  int max = 0;
  for (int i=1; i<file.getRowCount(); i++) {
    TableRow cur = file.getRow(i);
    int pop = cur.getInt(5);
    if (pop>max)
      max=pop;
  }

  for (int i=1; i<file.getRowCount(); i++) {
    TableRow cur = file.getRow(i);
    float curLong = cur.getFloat(4); // Longitude
    float curLat = cur.getFloat(3); // Latitude
    float pop = cur.getInt(5); // Population

    // Color gradient (red=low, green=high) depending on population.
    // If population is more than a million, it is green.
    float num = map(pop, 0, 1000000, 0, 255);
    stroke(255-num, num, 0);

    // Size gradient (small=low, big=high) depending on population.
    // If population is more than a 20 million, it is the biggest.
    //pop = pop > 2*pow(10, 7) ? pop = 2*pow(10, 7) : pop;
    num = map(pop, 0, 2*pow(10, 7), 1, 10);
    strokeWeight(num);

    //point(curLong * 2.5, curLat * 2.5);
    point(curLong * 3, curLat * 3);
  }
}

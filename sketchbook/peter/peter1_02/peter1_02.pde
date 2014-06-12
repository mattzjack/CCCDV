PImage source;       // Source image
PImage destination;  // Destination image

void setup() {
  size(552, 748);
  source = loadImage("peter1_02.jpg");  
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
}

void draw() {  
  float threshold = 127.5;

  // We are going to look at both image's pixels
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x < source.width; x++) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold) {
        destination.pixels[loc]  = color(0,0,255);  // White
      }  else {
        destination.pixels[loc]  = color(255,0,0);    // Black
      }
    }
  }

  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  image(destination,0,0);
  textSize(100);
  fill(random(255),random(255),random(255));
  text("FREEDOM",70,740);
}void mouseClicked(){
  saveFrame("spokesman");
}

PShader shader;
PImage img;

void setup() {
  size(800, 800, P2D);
  img = loadImage("image.png");
  shader = loadShader("ramp.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("tex0", img);
  shader.set("cells", 25);
}

void draw() {
  background(0);
  shader.set( "time", float(millis()) / 1000.0);
  shader(shader);

  rect(0, 0, width, height);  
}

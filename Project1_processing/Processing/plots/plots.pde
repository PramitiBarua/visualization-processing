import org.gicentre.utils.stat.*;    // For chart
import controlP5.*;   //For button & slider

ControlP5 controlP5;
int sliderValue = 100;
int myColorBackground= color(255);

XYChart scatterplot;

String labely = "horsepower";
int counter = 4;


// Loads data into the chart and customises its appearance.
void setup()
{
  
  
  size(1000,800);   
  
  textFont(createFont("Arial",11),11);
  
  
  
  controlP5 = new ControlP5(this);
  
  controlP5.addButton("mpg vs cylinders")
            .setPosition(90,2)
            .setSize(100,30)
            .activateBy(ControlP5.RELEASE); 
          
  controlP5.addButton("mpg vs weight")
            .setPosition(310, 2)
            .setSize(100, 30)
            .activateBy(ControlP5.RELEASE);
  controlP5.addButton("mpg vs displacement")
             .setPosition(200, 2)
             .setSize(100, 30)
             .activateBy(ControlP5.RELEASE);
  controlP5.addButton("mpg vs acceleration")
            .setPosition(420, 2)
            .setSize(100, 30)
            .activateBy(ControlP5.RELEASE);
  controlP5.addButton("mpg vs model.year")
            .setPosition(640, 2)
            .setSize(100, 30)
            .activateBy(ControlP5.RELEASE);
  controlP5.addButton("mpg vs origin")
              .setPosition(530, 2)
              .setSize(100, 30)
              .activateBy(ControlP5.RELEASE);
  controlP5.addSlider("slider")
           .setBroadcast(false)
           .setRange(100,255)
           .setValue(255)
           .setPosition(90,40)
           .setSize(200,30)
           .setBroadcast(true)
           ; 

scatterplot = new XYChart(this);
  
  // Load data from a file 
  String[] data = loadStrings("cars.csv");
  float[] mpg  = new float[data.length-1];
  float[] yaxis = new float[data.length-1];

      
  for (int i=0; i<data.length-1; i++)
  {
    //println(data);
    String[] tokens = data[i+1].split(",");
    mpg[i]  = Float.parseFloat(tokens[1]);   
    yaxis[i] = Float.parseFloat(tokens[counter]); 
    
  }
  scatterplot.setData(mpg,yaxis);
  
  // Axis formatting and labels.
  scatterplot.showXAxis(true); 
  scatterplot.showYAxis(true); 
  
  scatterplot.setXAxisLabel("MPG");
  scatterplot.setYAxisLabel(labely);
  
  // Symbol styles
  scatterplot.setPointColour(color(#BC1111));
  scatterplot.setPointSize(6);
}
 
// Draws the scatterplot.
void draw()
{
  background(myColorBackground);
  fill(sliderValue);
  
  scatterplot.draw(30,70, width - 80,height-80);
 
  
}
void slider(int theColor) {
  myColorBackground = color(theColor);
  
}


//Choose buttons
void controlEvent(ControlEvent theEvent){
  if (theEvent.isController()){
    if(theEvent.getController().getName()=="mpg vs cylinders"){
      counter = 2;
      labely = "cylinders"; 
      setup();
    }
    if(theEvent.getController().getName()=="mpg vs weight"){
      counter = 5;
      labely = "weight";
      setup();
    }
    if(theEvent.getController().getName()=="mpg vs displacement"){
      counter = 3;
      labely = "Displacement";
      setup();
    }
    if(theEvent.getController().getName()=="mpg vs acceleration"){
      counter = 6;
      labely = "Acceleration";
      setup();
     
    }
    if(theEvent.getController().getName()=="mpg vs origin"){
      counter = 8;
      labely = "Origin";
      setup();
     
    }
    if(theEvent.getController().getName()=="mpg vs model.year"){
      counter = 7;
      labely = "model.year";
      setup();
     
    }
    
  }  
}

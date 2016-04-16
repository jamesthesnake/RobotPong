import processing.serial.*; //libreria para comunicacion serial

//librerias de Firmdata de arduino
import org.firmata.*; 
import cc.arduino.*;

//librerias de LeapMotionP5
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Finger;

//inicializamos las clases
LeapMotionP5 leap;
Arduino arduino;

//especificamos valores iniciales para los objetos
public void setup() {
  size(500, 500);
  leap = new LeapMotionP5(this);
  
  arduino = new Arduino(this, Arduino.list()[5], 57600);
  //arduino.pinMode(mySwitch, Arduino.INPUT);
  //especificamos el tipo de pin en arduino (salida)
  arduino.pinMode(8, Arduino.OUTPUT);
  arduino.pinMode(9, Arduino.OUTPUT);
  arduino.pinMode(10, Arduino.OUTPUT);
  arduino.pinMode(11, Arduino.OUTPUT);
}

public void draw() {
  background(0);
  fill(255);
  
  //iniciamos lectura de un dedo
  for (Finger finger : leap.getFingerList()) {
    PVector fingerPos = leap.getTip(finger);
    PVector velocity = leap.getVelocity(finger);
    ellipse(fingerPos.x, fingerPos.y, 10, 10);
    
    //evaluamos posiciones en "x" y "y"
    
    if (fingerPos.x > 300.00 )  
    {
      System.out.println("x: " + fingerPos.x);
      System.out.println ("DER");
      arduino.digitalWrite(8, Arduino.HIGH); //enviamos señales al puerto de arduino
    }
    else
    {
      arduino.digitalWrite(8, Arduino.LOW);
    }
    
    if  (fingerPos.x < 200.00)
    {
      System.out.println("x: " + fingerPos.x);
      System.out.println ("IZQ");
      arduino.digitalWrite(9, Arduino.HIGH);//enviamos señales al puerto de arduino
    }
    else
    {
      arduino.digitalWrite(9, Arduino.LOW);
    }
    
    if (fingerPos.y > 350.00 )   
    {
      System.out.println("y: " + fingerPos.y);
      System.out.println ("DOWN");
      arduino.digitalWrite(10, Arduino.HIGH);//enviamos señales al puerto de arduino
    }
    else
    {
      arduino.digitalWrite(10, Arduino.LOW);
    }
    
    if (fingerPos.y < 150.00)
    {
      System.out.println("y: " + fingerPos.y);
      System.out.println ("UP");
      arduino.digitalWrite(11, Arduino.HIGH);//enviamos señales al puerto de arduino
    }
    else
    {
      arduino.digitalWrite(11, Arduino.LOW);
    }
    
    
    
    /*
    arduino.digitalWrite(8, Arduino.LOW);
    arduino.digitalWrite(9, Arduino.LOW);
    arduino.digitalWrite(10, Arduino.LOW);
    arduino.digitalWrite(11, Arduino.LOW);
    */
    
    //System.out.println("x: " + fingerPos.x);
    //System.out.println("y: " + fingerPos.y);
    //System.out.println("z: " + fingerPos.z);
    //line(fingerPos.x, fingerPos.y, fingerPos.x + velocity.x, fingerPos.y + velocity.y);
  }
}

public void stop() {
  leap.stop();
}
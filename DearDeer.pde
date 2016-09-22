// This is the code I used in spring show.

// In video, you have to play it all the time.
import processing.video.*;
//Serial
import processing.serial.*;
String A="TEST";

PImage headicon;
// The serial port:
//Serial myPort;  
// List all the available serial ports:
//println(Serial.list());

// Open the port you are using at the rate you want:
String printerName="Prolific_Technology_Inc._IEEE-1284_Controller";

Movie DeerWalk;
Movie DeerQ1;
Movie DeerQ2;
Movie DeerQ3;
Movie DeerQ4;
Movie DeerQ5;
Movie DeerQ6;
Movie DeerEnd;
int newFrame=0;
int movFrameRate=30;
int i=0;
int m=0;
boolean check = false;// for checking time
int R=int(random(10));
//Text
PFont f, fontPrint,fontPrintSmall;
String typing="";
String saved="";
//String instrucation="Please Help Deer to Answer His Question";
String Q1="";
String Q2="";
String Q3="";
String Q4="";
String Q5="";
String Q6="";
String end="";
String current_time; 
//Save poem
PrintWriter output;
PrintWriter output_answer;

void setup() {
  size(1024, 768, P2D);
  background(0);
  //Video
  //Serial
  //myPort = new Serial(this, Serial.list()[2], 9600);
  //println(Serial.list());
  DeerWalk=new Movie(this, "Deer_Walk_1.mp4");
  DeerQ1=new Movie(this, "Q1_1.mp4");
  DeerQ2=new Movie(this, "Q2_1.mp4");
  DeerQ3=new Movie(this, "Q3_1.mp4");
  DeerQ4=new Movie(this, "Q4_1.mp4");
  DeerQ5=new Movie(this, "Q5_1.mp4");
  DeerQ6=new Movie(this, "Q6_1.mp4");
  DeerEnd=new Movie(this, "Deer_Final_1.mp4");
  DeerWalk.play();
  DeerWalk.loop();
  //Text
  f=createFont("AmericanTypewriter", 25, true);
  fontPrint=createFont("AmericanTypewriter", 25, true);
  fontPrintSmall=createFont("AmericanTypewriter", 22, true);
  //Save Text
  output = createWriter(R+"-"+month() +"-"+ day() +"-"+ year()+"MyDeerDearPeom.txt");
  output_answer = createWriter(R+"-"+month() +"-"+ day() +"-"+ year()+"MyDeerDearPeom_answer.txt");

  headicon = loadImage("headicon.png");
  //printDeerPoem("!!!!TEST!!!!  \n<<  l>>\n\nby Miss Ting and \n delights me.\n is mine.\nIt is like \nWhen I  myself.\nIt is like \nThe day  was born.\nI  as I wrote it,\nAnd clapped my hands.\nI will stop a stranger\nTo show him \nBecause it delights me\nBecause it is mine.");
}
void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  noCursor();
  int indent=25;
  int inlength=555;
  // Set the font and fill for text
  //textFont(f);
  //fill(255);
  //text(instrucation, indent, 90); 

  if (i==0) {
    image(DeerWalk, 0, 0);

    //text(instrucation, indent, 90);
  } else if (i==1) {
    image(DeerQ1, 0, 0);
    textFont(f);
    fill(255);
    text(typing, indent, 450);

    //textFont(f);
    //fill(255);
    //text(Q1, indent, 90);
  } else if (i==2) {
    image(DeerQ2, 0, 0);
    text(typing, indent, inlength-20);
    //textFont(f);
    //fill(255);
    //text(Q2, indent, 90);
  } else if (i==3) {
    image(DeerQ3, 0, 0);
    text(typing, indent, inlength-50);
    //textFont(f);
    //fill(255);
    //text(Q3, indent, 90);
  } else if (i==4) {
    image(DeerQ4, 0, 0);
    text(typing, indent, inlength-40);
    //textFont(f);
    //fill(255);
    //text(Q4, indent, 90);
  } else if (i==5) {
    image(DeerQ5, 0, 0);
    text(typing, indent, inlength-10);
    //textFont(f);
    //fill(255);
    //text(Q5, indent, 90);
  } else if (i==6) {
    image(DeerQ6, 0, 0);
    text(typing, indent, inlength+10);
    //textFont(f);
    //fill(255);
    //text(Q6, indent, 90);
  } else if (i==7) {
    image(DeerEnd, 0, 0);
    //textFont(f);
    //fill(255);
    //text(end, indent, 90);
  }
  if (check) {
    int cuttent_m = millis();
    //println((cuttent_m - m));
    if ((cuttent_m - m) > 43000) {
      check = false;
      //saved=Q1+Q2+Q3+Q4+Q5+Q6;

      i=0;
      DeerEnd.stop();
      DeerQ1.stop();
      DeerQ2.stop();
      DeerQ3.stop();
      DeerQ4.stop();
      DeerQ5.stop();
      DeerQ6.stop();
      DeerWalk.stop();
      DeerWalk.play();
      DeerWalk.loop();
    }
  }
  checkPrinter();
}
void keyPressed() {
  // If the return key is pressed, save the String and clear it
  //if (key != CODED) {
  if (key == '\n' ) {
    //DeerType.read();

    // A String can be cleared by setting it equal to ""
    //typing = ""; 
    if (i<7) {
      i++;
      if (i==1) {
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerQ1.play();
      } else if (i==2) {
        Q1 = typing;
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerQ2.play();
      } else if (i==3) {
        Q2 = typing;
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerQ3.play();
      } else if (i==4) {
        Q3 = typing;
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerQ4.play();
      } else if (i==5) {
        Q4 = typing;
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerQ5.play();
      } else if (i==6) {
        Q5 = typing;
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerQ6.play();
      } else if (i==7) {
        Q6 = typing;
        typing="";
        DeerWalk.stop();
        DeerQ1.stop();
        DeerQ2.stop();
        DeerQ3.stop();
        DeerQ4.stop();
        DeerQ5.stop();
        DeerQ6.stop();
        DeerEnd.stop();
        DeerEnd.play();
        //println(Q1);
        m=millis();
        check = true;
        //saved=Q1+Q2+Q3+Q4+Q5+Q6;
        //output.println(saved); // Write the coordinate to the file
        //output.flush(); // Writes the remaining data to the file
        saved="<< "+Q2+" >>"+'\n'+"by"+Q1+'\n'+Q2+" delights me."+'\n'+Q2+" is mine."+'\n'+"It is like "+Q3+'\n'+"When I "+Q4+" myself."+'\n'+"It is like "+Q5+'\n'+"The day "+Q5+" was born."+'\n'+"I "+Q6+" as I wrote it,"+'\n'+"And clapped my hands."+'\n'+"I will stop a stranger"+'\n'+"To show him "+Q2+'\n'+"Because it delights me"+'\n'+"Because it is mine."+'\n';
        String saved_day=month() +"-"+ day() +"-"+ year() + "_" + hour() +":" + minute() + ":" + second() + "\n"+" "+Q2+"  "+'\n'+"by Dear "+Q1+'\n'+Q2+" delights me."+'\n'+Q2+" is mine."+'\n'+"It is like "+Q3+'\n'+"When I "+Q4+" myself."+'\n'+"It is like "+Q5+'\n'+"The day "+Q5+" was born."+'\n'+"I "+Q6+" as I wrote it,"+'\n'+"And clapped my hands."+'\n'+"I will stop a stranger"+'\n'+"To show him "+Q2+'\n'+"Because it delights me"+'\n'+"Because it is mine."+'\n';

        //String current_time = month() +"-"+ day() +"-"+ year() + "_" + hour() +":" + minute() + ":" + second();
        String saved_answer = month() +"-"+ day() +"-"+ year() + "_" + hour() +":" + minute() + ":" + second() + "," + Q1 +"," + Q2 + "," + Q3 + "," + Q4 + "," + Q5 + "," + Q6;
        output_answer.println(saved_answer);
        output_answer.flush(); 
        output.println(saved_day); // Write the coordinate to the file
        output.flush(); // Writes the remaining data to the file

        //println("DEBUG");
        printDeerPoem(saved);

        //myPort.write(saved);
        //myPort.write(0);
      }
    } else {
      i=0;
      typing="";
      DeerWalk.stop();
      DeerQ1.stop();
      DeerQ2.stop();
      DeerQ3.stop();
      DeerQ4.stop();
      DeerQ5.stop();
      DeerQ6.stop();
      DeerEnd.stop();
      DeerWalk.play();
      DeerWalk.loop();
    }
  } else if (byte(key)==8) {
    typing = typing.substring(0, max(0, typing.length()-1));
  } else if (byte(key)==32) {
    typing += " ";
  } else if (key>=32 && key<=126) {
    typing = typing + key;
  } 
  //println(int(key));

  print(saved);
}

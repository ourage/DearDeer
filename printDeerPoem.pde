void printDeerPoem(String poem) {
  ByteArrayOutputStream outputBuf= new ByteArrayOutputStream(); 
  PGraphics pg;
  float stringWidth;
  pg = createGraphics(361, 1500);
  pg.beginDraw();
  pg.background(255);
  pg.image(headicon, 0, 0);
  pg.fill(0);
  pg.textFont(fontPrint);
  String title="A EVENT going to happen";
  stringWidth = pg.textWidth(title);
  pg.text(title, 180-stringWidth/2, 400);
  String address="An address";
  stringWidth = pg.textWidth(address);
  pg.text(address, 180-stringWidth/2, 440); // Center
  String artistName="YuTing Feng";
  stringWidth = pg.textWidth(artistName);
  pg.text(artistName, 180-stringWidth/2, 480);//artist name location
  pg.textFont(fontPrintSmall);//below are poem
  String[] poemLineByLine = split(poem, '\n');
  for (int i=0; i<poemLineByLine.length; i++) {
    stringWidth = pg.textWidth(poemLineByLine[i]);
    pg.text(poemLineByLine[i], 180-stringWidth/2, 560+i*30);
  }
  pg.textFont(fontPrint);
  String writtenBy1="Originally written by";
  pg.text(writtenBy1, 0, 1070);
  String writtenBy2="Rich Accetta-Evans";
  pg.text(writtenBy2, 0, 1100);
  String writtenOnTime=String.format("%02d/%02d/%04d", month(), day(), year());
  stringWidth = pg.textWidth(writtenOnTime);
  pg.text("Written on", 0, 1160);
  pg.text(writtenOnTime, 361-stringWidth, 1160);
  pg.text("Poet:", 0, 1190);
  pg.stroke(0);
  pg.strokeWeight(3);
  pg.line(30, 1250, 361-30, 1250);
  String thankyou="Thank you";
  stringWidth = pg.textWidth(thankyou);
  pg.text(thankyou, 180-stringWidth/2, 1310);
  String forwritingapoem="for writting a poem";
  stringWidth = pg.textWidth(forwritingapoem);
  pg.text(forwritingapoem, 180-stringWidth/2, 1340);
  String withus="with us";
  stringWidth = pg.textWidth(withus);
  pg.text(withus, 180-stringWidth/2, 1370);
  
  pg.image(headicon, 0, 1400);
  
  pg.endDraw();
  pg.save(String.format("Poem_%04d_%02d_%02d_%02d_%02d_%02d.png", year(),month(), day(),hour(),minute(),second()));
  appendBuffer(outputBuf, XPrinter_ProcessImage(0, pg.get()));
  appendBuffer(outputBuf, XPrinter_feedRows(3));//prevent cutting content
  appendBuffer(outputBuf, XPrinter_Cut_Paper);
  rawprint(printerName, outputBuf.toByteArray());
}

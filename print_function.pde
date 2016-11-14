import java.io.*;
import javax.print.DocFlavor;
import javax.print.SimpleDoc;
import javax.print.Doc;
import javax.print.attribute.HashPrintServiceAttributeSet;
import javax.print.attribute.standard.PrinterName;
import javax.print.*;
import javax.print.attribute.PrintServiceAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

public String rawprint(String printerName, byte[] conte) {
  String res = "";
  String os=System.getProperty("os.name");
  //String arch=System.getProperty("os.arch");
  if (os.indexOf("Mac")>=0) {
    res=rawprintMac(printerName, conte);
  } else if (os.indexOf("Linux")>=0) {
    res=rawprintLinux(conte);
  }
  return res;
}

public String rawprintMac(String printerName, byte[] conte) {
  String res = "";
  PrintService service = null;
  PrintService services[] = PrintServiceLookup.lookupPrintServices(null, null);
  for (int index = 0; service == null && index < services.length; index++) {
    //println("Printer "+index+" is "+services[index].getName());
    if (services[index].getName().equalsIgnoreCase(printerName)) {
      service = services[index];
      //println("Printer index: "+index);
    }
  }
  if (service == null) {
    return "Can't  select printer :" + printerName;
  }

  //println(conte);
  //println(printServiceAttributeSet);
  //println(printdata);
  //println(PrintServiceLookup.lookupPrintServices(null, null));

  PrintService pservice = service;
  DocPrintJob job = pservice.createPrintJob();
  DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
  Doc doc = new SimpleDoc(conte, flavor, null);
  PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
  try {
    job.print(doc, aset);
  } 
  catch(Exception e) {
    res = e.getMessage();
  }

  return res;
}

public String rawprintLinux(byte[] conte) {
  String res = "";

  File f = new File("/dev/usb/lp0");
  if (f.exists() && !f.isDirectory()) {
    try {
      FileOutputStream oStream = new FileOutputStream("/dev/usb/lp0");
      BufferedOutputStream lp0out = new BufferedOutputStream(oStream);
      lp0out.write(conte);
      lp0out.flush();
      lp0out.close();
      oStream.close();
    }
    catch (Throwable e) {
      println("printERR");
    }
  }
  return res;
}
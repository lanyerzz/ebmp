package com.app.applet.weighbridge;


import com.app.applet.weighbridge.driver.ISerialReader;
import gnu.io.*;

import javax.swing.*;
import java.io.InputStream;

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-6-28
 * Time: 下午4:22
 * To change this template use File | Settings | File Templates.
 */
public class CommMain extends JApplet {



    String driver="";


    @Override
    public void init() {
        super.init();    //To change body of overridden methods use File | Settings | File Templates.


        String commParam = getParameter("commParam");
        commParam =  commParam==null ? "" : commParam;
         this.driver = getParameter("driver");
        String ps[]=commParam.split(",");
       this.openComm(ps[0],Integer.parseInt(ps[1]),Integer.parseInt(ps[2]),Integer.parseInt(ps[3]),Integer.parseInt(ps[4]));
    }

    public String value="0.00";



    private ISerialReader sr;

    public String getValue(){
         return sr.value;
    }
    public String stopRead(){
        sr.stopRead=true;
       return sr.value;
    }

    public void startRead(){
        sr.stopRead=false;
    }



    /**
     *
     * @param comName
     * @param p1
     * @param p2  数据位
     * @param p3 比特率
     * @param p4
     */
   public void openComm(String comName,int p1,int p2,int p3,int p4){

       CommPort commPort=null;
        System.out.println("正在打开com口........");
//       JSObject.getWindow(this).eval("javascript:if(typeof(subSetDaoHang)!=\"undefined\")subSetDaoHang(\""+this.u_getPath()+"\")");




           CommPortIdentifier portId = null;
           try {

               portId = CommPortIdentifier
                       .getPortIdentifier(comName);
                commPort=portId.open(comName, 2000);

           } catch (Exception e) {
               e.printStackTrace();
           }




       if (commPort instanceof SerialPort) {
           SerialPort serialPort = (SerialPort) commPort;

           try {
               serialPort.setSerialPortParams(p1, p2,p3, p4);
           } catch (UnsupportedCommOperationException e) {
               e.printStackTrace();
           }
           try {
                InputStream in = serialPort.getInputStream();
                sr= (ISerialReader) Class.forName(driver).newInstance();
               sr.setParams(serialPort,in);

                new Thread(sr).start();
           } catch (Exception e) {
               e.printStackTrace();
           }

       }else if(commPort instanceof ParallelPort){
           ParallelPort pport=(ParallelPort)commPort;

           try {
               InputStream in = pport.getInputStream();
               sr= (ISerialReader) Class.forName(driver).newInstance();
               sr.setParams(pport,in);
               new Thread(sr).start();
           } catch (Exception e) {
               e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
           }

       }
  }



    public  void closeComm(){
        System.out.println("closeComm.......closed........");
        sr.closed=true;
    }
      }

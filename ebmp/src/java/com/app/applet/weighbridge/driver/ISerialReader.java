package com.app.applet.weighbridge.driver;

import gnu.io.CommPort;
import gnu.io.SerialPort;

import java.awt.*;
import java.io.InputStream;

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-7-14
 * Time: 下午4:31
 * To change this template use File | Settings | File Templates.
 */
public abstract class ISerialReader implements Runnable{
    InputStream in;
    public  Boolean stopRead=false;
    public  Boolean closed=false;
   public String value="0.00";

    CommPort serialPort;



    public void setParams(CommPort serialPort, InputStream in)
    {
        this.serialPort=serialPort;
        this.in = in;

    }


}

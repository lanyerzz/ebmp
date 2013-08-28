package com.app.applet.weighbridge.driver;

import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-7-13
 * Time: 下午2:07
 * To change this template use File | Settings | File Templates.
 */
public class SerialReader extends ISerialReader{

    public void run() {
        byte[] buffer = new byte[1024];

        int len = -1;
        String data = "";
        int count=0;
        try {
            while ((len = this.in.read(buffer)) > -1 && !closed)
            {

                data = data + new String(buffer, 0, len);
                if(!stopRead){
                    if (data.length() - data.lastIndexOf("\002") == 16) {
                        value=data.substring(4, 11);


                        data = "";
                    }
                }


            }

            System.out.println("结束线程.....");
            System.out.println("关闭Com口.....");
            serialPort.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }


}

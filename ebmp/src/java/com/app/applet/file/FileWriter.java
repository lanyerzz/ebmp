package com.app.applet.file;

import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.security.AccessController;
import java.security.PrivilegedAction;


public class FileWriter extends JApplet {
    @Override
    public void init() {
        super.init();

    }

    public void write(final String content,final String filePath,final boolean append){
        AccessController.doPrivileged(new PrivilegedAction() {
            public Object run() {
                File file = null;
                java.io.FileWriter fw = null;
                try {

                    file = new File(filePath);

                    if(file.exists()){
                        file.mkdirs();
                    }

                    fw = new java.io.FileWriter(file,append);

                    fw.write(content);

                    fw.flush();

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (fw != null)
                        try {
                            fw.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                }
                return null;
            }
        });


    }
}

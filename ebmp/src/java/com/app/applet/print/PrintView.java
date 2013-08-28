package com.app.applet.print;

//import java.io.PrintWriter;
//import java.io.StringWriter;
//import java.net.HttpURLConnection;
//import java.net.URL;

import javax.swing.JApplet;
//import javax.swing.JOptionPane;
//
//import net.sf.jasperreports.engine.JRException;
//import net.sf.jasperreports.engine.JasperPrint;
//import net.sf.jasperreports.engine.JasperPrintManager;
//import net.sf.jasperreports.engine.util.JRLoader;
//import net.sf.jasperreports.view.JasperViewer;

public class PrintView extends JApplet {

    @Override
    public void init() {

    }


    public  void printTest(){
        System.out.println("fdaifdaskjfkdsajfdsjafidsf9s8f98r3929849028490328490284902849032849023849032849032489032");
    }

//    public void print(String REPORT_URL,String data,boolean isview,boolean showPrintDialog,int printCount,String sessionid) {
//        System.out.println(REPORT_URL);
//        System.out.println(data);
//        System.out.println(isview);
//        System.out.println(showPrintDialog);
//        System.out.println(printCount);
//        System.out.println(sessionid);
//
//        HttpURLConnection conn = null;
//        try{
//            URL  url = new URL(REPORT_URL);
//
//            conn = (HttpURLConnection) url.openConnection();
//
//            conn.setRequestProperty("Cookie", "JSESSIONID=" + sessionid);
//            conn.setDoOutput(true);
//
//            if (data != null && data.trim().length() != 0) {
//
//
//                conn.setDoOutput(true);
//                conn.getOutputStream().write(data.getBytes());
//                conn.getOutputStream().flush();
//                conn.getOutputStream().close();
//
//            }
//            final JasperPrint jasperPrint = (JasperPrint) JRLoader
//                    .loadObject(conn.getInputStream());
//
//            if (isview) {// 预览
//
//
//                new Thread(new Runnable() {
//
//                    @Override
//                    public void run() {
//                        try {
//                            JasperViewer.viewReport(jasperPrint, false);
//                        } catch (Exception e) {
//                            StringWriter swriter = new StringWriter();
//                            PrintWriter pwriter = new PrintWriter(swriter);
//                            e.printStackTrace(pwriter);
//                            JOptionPane.showMessageDialog(null,
//                                    swriter.toString());
//                            e.printStackTrace();
//                        }
//
//                    }
//                }).start();
//
//            } else if (showPrintDialog) {// 显示打印机设置窗口
//                new Thread(new Runnable() {
//
//                    @Override
//                    public void run() {
//                        try {
//                            JasperPrintManager.printReport(jasperPrint, true);
//                        } catch (JRException e) {
//                            StringWriter swriter = new StringWriter();
//                            PrintWriter pwriter = new PrintWriter(swriter);
//                            e.printStackTrace(pwriter);
//                            JOptionPane.showMessageDialog(null,
//                                    swriter.toString());
//                            e.printStackTrace();
//                        }
//
//                    }
//                }).start();
//
//            }else {
//                if (printCount == 0)
//                    printCount = 1;
//
//                for (int i = 0; i < printCount; i++) {
//                    new Thread(new Runnable() {
//
//                        @Override
//                        public void run() {
//                            try {
//                                JasperPrintManager.printReport(jasperPrint,
//                                        false);
//                            } catch (JRException e) {
//                                StringWriter swriter = new StringWriter();
//                                PrintWriter pwriter = new PrintWriter(swriter);
//                                e.printStackTrace(pwriter);
//                                JOptionPane.showMessageDialog(null,
//                                        swriter.toString());
//                                e.printStackTrace();
//                            }
//
//                        }
//                    }).start();
//                }
//
//
//        }
//        }catch (Exception e){
//            e.printStackTrace();
//        }finally {
//            if (conn != null)
//                conn.disconnect();
//        }
//
//
//
//
//
//
//
//
//	}



}

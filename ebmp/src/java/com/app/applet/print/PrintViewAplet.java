package com.app.applet.print;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.swing.JApplet;
import javax.swing.JOptionPane;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

public class PrintViewAplet extends JApplet {
	private URL url = null;
	private int printCount = 1;
	private boolean _isview = true;
	private boolean _showPrintDialog = false;
	private String sessionid = null;
	private String _data = null;

	@Override
	public void init() {
		try {

			String strUrl = getParameter("REPORT_URL");
			String pc = getParameter("printCount");
			String isview = getParameter("isview");
			String showPrintDialog = getParameter("showPrintDialog");
			sessionid = getParameter("sessionid");
			_data = getParameter("senddata");
			if (pc != null && pc.trim().length() != 0) {
				printCount = Integer.parseInt(pc);
			}
			//
			if (isview != null && isview.trim().length() != 0) {
				_isview = "true".equalsIgnoreCase(isview);
			}
			//
			if (showPrintDialog != null && showPrintDialog.trim().length() != 0) {
				_showPrintDialog = "true".equalsIgnoreCase(showPrintDialog);
			}

			url = new URL(strUrl);
			// url=new URL("http://localhost:8080/wms/ICGeneral/print");
			// sessionid="AA7CA00FE3824F9C056C1A9E3A6A6370";
			// _data="xxx=fdsfsfds";
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
			e.printStackTrace();
		}

	}

	@Override
	public void start() {


                HttpURLConnection conn = null;
                try {
                    // HttpClient hc=new HttpClient(arg0, arg1, arg2)
                    conn = (HttpURLConnection) url.openConnection();
                    // List<String> headers = conn.getHeaderFields().get("Set-Cookie");
                    conn.setRequestProperty("Cookie", "JSESSIONID=" + sessionid);
                    conn.setDoOutput(true);
                    if (_data != null && _data.trim().length() != 0) {


                        conn.setDoOutput(true);
                        conn.getOutputStream().write(_data.getBytes());
                        conn.getOutputStream().flush();
                        conn.getOutputStream().close();

                    }

                    final JasperPrint jasperPrint = (JasperPrint) JRLoader
                            .loadObject(conn.getInputStream());
                    //
                    if (_isview) {// 预览

                        // net.sf.jasperreports.view.JRViewer v=new
                        // JRViewer(jasperPrint);
                        // this.add(v);
                        JasperViewer.viewReport(jasperPrint, false);
                        new Thread(new Runnable() {

                            @Override
                            public void run() {
                                try {
                                    JasperViewer.viewReport(jasperPrint, false);
                                } catch (Exception e) {
                                    StringWriter swriter = new StringWriter();
                                    PrintWriter pwriter = new PrintWriter(swriter);
                                    e.printStackTrace(pwriter);
                                    JOptionPane.showMessageDialog(null,
                                            swriter.toString());
                                    e.printStackTrace();
                                }

                            }
                        }).start();

                    } else if (_showPrintDialog) {// 显示打印机设置窗口
                        new Thread(new Runnable() {

                            @Override
                            public void run() {
                                try {
                                    JasperPrintManager.printReport(jasperPrint, true);
                                } catch (JRException e) {
                                    StringWriter swriter = new StringWriter();
                                    PrintWriter pwriter = new PrintWriter(swriter);
                                    e.printStackTrace(pwriter);
                                    JOptionPane.showMessageDialog(null,
                                            swriter.toString());
                                    e.printStackTrace();
                                }

                            }
                        }).start();

                    } else {
                        if (printCount == 0)
                            printCount = 1;

                        for (int i = 0; i < printCount; i++) {
                            new Thread(new Runnable() {

                                @Override
                                public void run() {
                                    try {
                                        JasperPrintManager.printReport(jasperPrint,
                                                false);
                                    } catch (JRException e) {
                                        StringWriter swriter = new StringWriter();
                                        PrintWriter pwriter = new PrintWriter(swriter);
                                        e.printStackTrace(pwriter);
                                        JOptionPane.showMessageDialog(null,
                                                swriter.toString());
                                        e.printStackTrace();
                                    }

                                }
                            }).start();
                        }
                    }

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, e.getMessage());
                    e.printStackTrace();
                } finally {
                    if (conn != null)
                        conn.disconnect();
                }




             }

         }

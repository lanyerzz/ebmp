package com.app.util;

import com.app.exception.BusinessException;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;

/**
 * Created with IntelliJ IDEA.
 * User: lanyer
 * Date: 13-8-10
 * Time: 下午6:35
 * To change this template use File | Settings | File Templates.
 */
public class XMLTemplateLoader {

    private final static String templetDir = "/xmltemplet/";

    private static Configuration cof = null;

    private static Configuration getConfiguration() throws BusinessException{

        if(cof == null){

            String xmlPath=SystemConfig.getWebAppPath()+templetDir;
//			URL url0 = XMLTemplateLoader.class.getResource(templetDir);

            try {
                cof = new Configuration();
                cof.setDirectoryForTemplateLoading(new java.io.File(xmlPath));
                cof.setObjectWrapper(new DefaultObjectWrapper());

            } catch (IOException e) {
                e.printStackTrace();
            }


        }

        return cof;
    }

    public static Template getTemplet(String type) throws Exception {

        Template templet = null;
        String templetName = type+".ftl";
        try {
            templet = getConfiguration().getTemplate(templetName, "GBK");
        } catch (IOException e) {
            e.printStackTrace();
            throw new BusinessException("加载["+type+"]模板时发生异常！"+e.getMessage());
        }

        return templet;
    }


    public static void main(String s[]){
        try {
            Template t = XMLTemplateLoader.getTemplet("test");

//			Map root = new HashMap();
//			StringWriter out = new StringWriter();
//			t.process(root, out);
//			out.flush();
//			System.out.println(out.getBuffer().toString());
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

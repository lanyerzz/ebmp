<APPLET  name='commPlugin' CODE = 'com.app.applet.weighbridge.WUI.class' ARCHIVE = 'commPlugin.jar,RXTXcomm.jar' WIDTH = '300' HEIGHT = '80'>
    <PARAM NAME = 'CODEBASE' VALUE ='${resource(dir: 'applet')}'>
    <param name='commParam' value='${weighbridge_param}'>
    <param name='driver' value='${weighbridge_driver}'>
</APPLET>
set path=D:\tools\Java\jdk1.6.0_29\bin
jarsigner -keystore myapp.store -storepass 123123a  commons-collections-2.1.1.jar  myapp -validity 7200
jarsigner -keystore myapp.store -storepass 123123a   commons-digester-2.1.jar  myapp -validity 7200
jarsigner -keystore myapp.store -storepass 123123a   commons-logging-1.1.1.jar  myapp -validity 7200
jarsigner -keystore myapp.store -storepass 123123a   jasperreports-applet-5.0.0.jar  myapp -validity 7200
jarsigner -keystore myapp.store -storepass 123123a   jreprint.jar  myapp -validity 7200
jarsigner -keystore myapp.store -storepass 123123a   iText-2.1.7.jar  myapp -validity 7200
pause
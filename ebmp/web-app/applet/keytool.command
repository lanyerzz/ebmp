keytool -genkey -keyalg RSA -alias ebmp -keystore /Users/lanyer/git/ebmp/ebmp/web-app/applet/ebmp.store -storepass 123123a -validity 3650

keytool -export -keystore /Users/lanyer/git/ebmp/ebmp/web-app/applet/ebmp.store -alias printkey -file /Users/lanyer/git/ebmp/ebmp/web-app/applet/ebmp.cer -storepass 123123a ebmp
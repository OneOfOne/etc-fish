set -x J2SDKDIR /opt/java
set -x J2REDIR /opt/java/jre
set -x PATH $PATH /opt/java/bin /opt/java/db/bin /opt/java/jre/bin
set -x JAVA_HOME /opt/java
set -x DERBY_HOME /opt/java/db

set -x _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"


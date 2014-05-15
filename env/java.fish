set -gx J2SDKDIR /opt/java
set -gx J2REDIR /opt/java/jre
set -gx PATH $PATH /opt/java/bin /opt/java/db/bin /opt/java/jre/bin
set -gx JAVA_HOME /opt/java
set -gx DERBY_HOME /opt/java/db

set -gx _JAVA_OPTIONS "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"


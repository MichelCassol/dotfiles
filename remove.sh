
CAMINHO="/usr/share/applications"


if grep -q NoDisplay=true "$CAMINHO/bvnc.desktop"; then
	echo "BVNC OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/bvnc.desktop"
	echo "BVNC REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/bssh.desktop"; then
	echo "BSSH OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/bssh.desktop"
	echo "BSSH REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/ranger.desktop"; then
	echo "RANGER OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/ranger.desktop"
	echo "RANGER REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/avahi-discover.desktop"; then
	echo "AVAHI OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/avahi-discover.desktop"
	echo "AVAHI REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/system-config-printer.desktop"; then
	echo "SYSTEM PRINTER OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/system-config-printer.desktop"
	echo "SYSTEM PRINTER REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/cmake-gui.desktop"; then
	echo "CMAKE OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/cmake-gui.desktop"
	echo "CMAKE REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/lstopo.desktop"; then
	echo "LSTOPO OK"
else
	echo 'NoDisplay=true' >> "$CAMINHO/lstopo.desktop"
	echo "LSTOPO REMOVE"
fi

if grep -q NoDisplay=true "$CAMINHO/xdvi.desktop"; then
	echo "XDVI OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/xdvi.desktop"
	echo "XDVI REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/cups.desktop"; then
	echo "CUPS OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/cups.desktop"
	echo "CUPS REMOVE"	
fi

if grep -q NoDisplay=true "$CAMINHO/nm-connection-editor.desktop"; then
	echo "NM CONNECTION OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/nm-connection-editor.desktop"
	echo "NM CONNECTION REMOVE"	
fi

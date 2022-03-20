
CAMINHO="/usr/share/applications"


if grep -q NoDisplay=true "$CAMINHO/bvnc.desktop"; then
	echo "BVNC OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/bvnc.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/bssh.desktop"; then
	echo "BSSH OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/bssh.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/ranger.desktop"; then
	echo "RANGER OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/ranger.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/avahi-discover.desktop"; then
	echo "AVAHI OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/avahi-discover.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/system-config-printer.desktop"; then
	echo "SYSTEM PRINTER OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/system-config-printer.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/cmake-gui.desktop"; then
	echo "CMAKE OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/cmake-gui.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/lstopo.desktop"; then
	echo "LSTOPO OK"
else
	echo 'NoDisplay=true' >> "$CAMINHO/lstopo.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/xdvi.desktop"; then
	echo "XDVI OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/xdvi.desktop"
fi

if grep -q NoDisplay=true "$CAMINHO/cups.desktop"; then
	echo "CUPS OK"	
else
	echo 'NoDisplay=true' >> "$CAMINHO/cups.desktop"
fi

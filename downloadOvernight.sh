#!/bin/bash

if grep -q "\[AC\]\[SuspendSession\]"  ~/.config/powermanagementprofilesrc; then
	sed -i -e 's/\[AC\]\[SuspendSession\]/\[AC\]\[SuspendSessio3\]/g' ~/.config/powermanagementprofilesrc
	sed -i -e "s/lidAction=1/lidAction=64/g" ~/.config/powermanagementprofilesrc
	echo "downloading overnight"
else
	sed -i -e 's/\[AC\]\[SuspendSessio3\]/\[AC\]\[SuspendSession\]/g' ~/.config/powermanagementprofilesrc
	sed -i -e "s/lidAction=64/lidAction=1/g" ~/.config/powermanagementprofilesrc
	echo "back to normal"
fi

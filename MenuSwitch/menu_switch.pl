#!/usr/bin/perl

$| = 1;
my $version_num = "1.1";
my $os_detect = `sw_vers -productVersion`;

# Eliminate persistence errors witnessed on some machines
my $fixer = `read NSGlobalDomain`;
	if ($fixer =~ m/ApplePersistence/) {
		my $fixer = `defaults delete NSGlobalDomain ApplePersistence`;
	}

# Check preferences
if (-e "~/library/preferences/com.ari.MenuSwitch.plist") {
	goto PREFS;
		} else {
	&defaults;
}

PREFS:
my $my_prefs = `defaults read com.ari.MenuSwitch`;

if ($my_prefs =~ m/login = 0/) {
	$start_login = 0;
} elsif ($my_prefs =~ m/login = 1/) {
	$start_login = 1;
}

if ($my_prefs =~ m/notify = 0/) {
	$notify = 0;
} elsif ($my_prefs =~ m/notify = 1/) {
	$notify = 1;
}

if ($my_prefs =~ m/dm = 0/) {
	$dark_mode = 0;
} elsif ($my_prefs =~ m/dm = 1/) {
	$dark_mode = 1;
}

if ($my_prefs =~ m/desktop = 0/) {
	$hide_desktop = 0;
} elsif ($my_prefs =~ m/desktop = 1/) {
	$hide_desktop = 1;
}

if ($my_prefs =~ m/files = 0/) {
	$hide_files = 0;
} elsif ($my_prefs =~ m/files = 1/) {
	$hide_files = 1;
}

if ($my_prefs =~ m/extensions = 0/) {
	$hide_extensions = 0;
} elsif ($my_prefs =~ m/extensions = 1/) {
	$hide_extensions = 1;
}

if ($my_prefs =~ m/awake = 0/) {
	$coffee = 0;
} elsif ($my_prefs =~ m/awake = 1/) {
	$coffee = 1;
}

if ($my_prefs =~ m/status = 0/) {
	$hide_status = 0;
} elsif ($my_prefs =~ m/status = 1/) {
	$hide_status = 1;
}

if ($my_prefs =~ m/path = 0/) {
	$hide_path = 0;
} elsif ($my_prefs =~ m/path = 1/) {
	$hide_path = 1;
}

if ($my_prefs =~ m/sleep = 3600/) {
	$coffee_duration = 3600;
} elsif ($my_prefs =~ m/sleep = 28800/) {
	$coffee_duration = 28800;
} elsif ($my_prefs =~ m/sleep = 86400/) {
	$coffee_duration = 86400;
} elsif ($my_prefs =~ m/sleep = 0/) {
	$coffee_duration = 0;
}

if ($my_prefs =~ m/login = 0/) {
	$login = 0;
} elsif ($my_prefs =~ m/login = 1/) {
	$login = 1;
}

# Dark Mode
if ($dark_mode == 0) {
	print "MENUITEMICON|switch_off_icon.png|Dark Mode Off\n";
} elsif ($dark_mode == 1) {
	print "MENUITEMICON|inv_switch_on_icon.png|Dark Mode On\n";
}

print "----\n";

# Hide Desktop Icons
if ($hide_desktop == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Show Desktop Icons On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Show Desktop Icons On\n";
	}
} elsif ($hide_desktop == 1) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Show Desktop Icons Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Show Desktop Icons Off\n";
	}
}

# Show Hidden Files
if ($hide_files == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Show Hidden Files On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Show Hidden Files On\n";	
	}
} elsif ($hide_files == 1) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Show Hidden Files Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Show Hidden Files Off\n";
	}
}

# Hide File Extensions
if ($hide_extensions == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Show App Extensions On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Show App Extensions On\n";
	}
} elsif ($hide_extensions == 1) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Show App Extensions Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Show App Extensions Off\n";
	}
}

# Show Path Bar
if ($hide_path == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Show Path in Finder Windows Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Show Path in Finder Windows Off\n";	
	}
} elsif ($hide_path == 1) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Show Path in Finder Windows On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Show Path in Finder Windows On\n";	
	}
}

# Show Status Bar
if ($hide_status == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Show Status Bar Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Show Status Bar Off\n";	
	}
} elsif ($hide_status == 1) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Show Status Bar On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Show Status Bar On\n";
	}
}

print "----\n";

# Keep Awake
if ($coffee == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Keep Awake On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Keep Awake On\n";
	}

} elsif ($coffee == 1) {

	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Keep Awake Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Keep Awake Off\n";
	}
	
	if ($coffee_duration == 3600) {
		print "SUBMENU|Set Awake Duration|✓ 1 hour|    8 hours|    24 hours|    Forever\n";
	} elsif ($coffee_duration == 28800) {
		print "SUBMENU|Set Awake Duration|    1 hour|✓ 8 hours|    24 hours|    Forever\n";
	} elsif ($coffee_duration == 86400) {
		print "SUBMENU|Set Awake Duration|    1 hour|    8 hours|✓ 24 hours|    Forever\n";
	} elsif ($coffee_duration == 0) {
		print "SUBMENU|Set Awake Duration|    1 hour|    8 hours|    24 hours|✓ Forever\n";
	}
}

print "----\n";
if ($dark_mode == 0) {
	print "MENUITEMICON|ss_icon.png|Activate Screen Saver\n";
} else {
	print "MENUITEMICON|inv_ss_icon.png|Activate Screen Saver\n";
}

if ($dark_mode == 0) {
	print "MENUITEMICON|lock_icon.png|Lock Screen\n";
} else {
	print "MENUITEMICON|inv_lock_icon.png|Lock Screen\n";
}

print "----\n";

if ($login == 1) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_on_icon.png|Start at Login On\n";
	} else {
		print "MENUITEMICON|inv_switch_on_icon.png|Start at Login On\n";
	}
} elsif ($login == 0) {
	if ($dark_mode == 0) {
		print "MENUITEMICON|switch_off_icon.png|Start at Login Off\n";
	} else {
		print "MENUITEMICON|inv_switch_off_icon.png|Start at Login Off\n";
	}
}

print "----\n";
print "About...\n";

# Process user input
my $line = shift(@ARGV);

# Processs Dark Mode
if ($line =~ m/Dark Mode/) {
	my $command = `osascript <<EOF 
	tell application "System Events"
		tell appearance preferences
			set dark mode to not dark mode
		end tell
end tell
EOF`;
	$dark_mode = 1 - $dark_mode;
	my $command = `defaults write com.ari.MenuSwitch dm $dark_mode`;
}

# Process Hide Desktop Icons
if ($line =~ /Show Desktop Icons On/) {
	my $command = `defaults write com.apple.finder CreateDesktop false;killall Finder`;
	$hide_desktop = 1 - $hide_desktop;
	my $command = `defaults write com.ari.MenuSwitch desktop $hide_desktop`;
}

if ($line =~ /Show Desktop Icons Off/) {
	my $command = `defaults write com.apple.finder CreateDesktop true;killall Finder`;
	$hide_desktop = 1 - $hide_desktop;
	my $command = `defaults write com.ari.MenuSwitch desktop $hide_desktop`;
}

# Process Hidden Files
if ($line =~ /Show Hidden Files On/) {
	my $command = `defaults write com.apple.finder AppleShowAllFiles false;killall Finder`;
	$hide_files = 1 - $hide_files;
	my $command = `defaults write com.ari.MenuSwitch files $hide_files`;
}

if ($line =~ /Show Hidden Files Off/) {
	my $command = `defaults write com.apple.finder AppleShowAllFiles true;killall Finder`;
	$hide_files = 1 - $hide_files;
	my $command = `defaults write com.ari.MenuSwitch files $hide_files`;
}

# Process File Extensions
if ($line =~ /Show App Extensions Off/) {
	my $command = `defaults write NSGlobalDomain AppleShowAllExtensions -bool true;killall Finder`;
	$hide_extensions = 1 - $hide_extensions;
	my $command = `defaults write com.ari.MenuSwitch extensions $hide_extensions`;
}

if ($line =~ /Show App Extensions On/) {
	my $command = `defaults write NSGlobalDomain AppleShowAllExtensions -bool false;killall Finder`;
	$hide_extensions = 1 - $hide_extensions;
	my $command = `defaults write com.ari.MenuSwitch extensions $hide_extensions`;
}

# Process Path Bar
if ($line =~ /Show Path in Finder Windows Off/) {
	my $command = `defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES;killall Finder`;
	$hide_path = 1 - $hide_path;
	my $command = `defaults write com.ari.MenuSwitch path $hide_path`;
}

if ($line =~ /Show Path in Finder Windows On/) {
	my $command = `defaults write com.apple.finder _FXShowPosixPathInTitle -bool NO;killall Finder`;
	$hide_path = 1 - $hide_path;
	my $command = `defaults write com.ari.MenuSwitch path $hide_path`;
}

# Process Status Bar
if ($line =~ /Show Status Bar Off/) {
	my $command = `defaults write com.apple.finder ShowStatusBar -bool true`;
	$hide_status = 1 - $hide_status;
	my $command = `defaults write com.ari.MenuSwitch status $hide_status`;
}

if ($line =~ /Show Status Bar On/) {
	my $command = `defaults write com.apple.finder ShowStatusBar -bool false`;
	$hide_status = 1 - $hide_status;
	my $command = `defaults write com.ari.MenuSwitch status $hide_status`;
}

# Process Keep Awake
if ($line =~ /Keep Awake On/) {
	my $command = `killall caffeinate`;
	$coffee = 1 - $coffee;
	my $command = `defaults write com.ari.MenuSwitch awake $coffee`;
}

if ($line =~ /Keep Awake Off/) {
	if ($coffee_duration != 0) {
		system("/usr/bin/caffeinate -t $coffee_duration & ");
	} elsif ($coffee_duration == 0) {
		system("/usr/bin/caffeinate -s & ");
	}
	$coffee = 1 - $coffee;
	my $command = `defaults write com.ari.MenuSwitch awake $coffee`;
}

# Process Keep Awake Durations
if ($line =~ m/1 hour/) {
	my $command = `defaults write com.ari.MenuSwitch sleep 3600`;
}

if ($line =~ m/8 hours/) {
	my $command = `defaults write com.ari.MenuSwitch sleep 28800`;
}

if ($line =~ m/24 hours/) {
	my $command = `defaults write com.ari.MenuSwitch sleep 86400`;
}

if ($line =~ m/Forever/) {
	my $command = `defaults write com.ari.MenuSwitch sleep 0`;
}

# Process Screen Saver
if ($line =~ m/Screen Saver/) {
	my $command = `/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine`;
}

# Process Lock Screen
if ($line =~ m/Lock Screen/) {
	my $command = `pmset displaysleepnow`;
	#my $command = `/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend`;
	#system("/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend");
}


# Set start at login option
if ($line =~ m/Start at Login/) {
	$login = 1 - $login;
	my $command = `defaults write com.ari.MenuSwitch login $login`;

	if ($login == 1) {
		my $command = `osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Menu Switch.app", hidden:false}'`;
	} elsif ($login == 0) {
		my $command = `osascript -e 'tell application "System Events" to delete login item "Menu Switch"'`;
	}
}

# Process About...
if ($line =~ /About.../) {
	&dialog("Menu Switch $version_num for macOS $os_detect\n\nAri Feldman (August 26, 2020)\ninfo\@widgetworx.com");
}


sub defaults {
	$login = 0;
	$dark_mode = 0;
	$hide_files = 1;
	$hide_desktop = 0;
	$hide_extensions = 0;
	$hide_path = 0;
	$hide_status = 1;
	$coffee = 0;
	$coffee_duration = 3600;
	
	my $command = `osascript <<EOF
	tell application "System Events"
		tell appearance preferences
			if dark mode is true then
				do shell script "/usr/bin/defaults write com.ari.MenuSwitch dm 1"
			else
				do shell script "/usr/bin/defaults write com.ari.MenuSwitch dm 0"
			end if
		end tell
	end tell
	EOF`;
}

# Subs that enable Applescript dialog to be displayed
sub dialog {
    my ($text) = @_;
        my $command = `osascript <<EOF
        tell application "System Events"
                (display dialog "$text" buttons {"OK"} default button 1)
         end tell
        EOF`;
}
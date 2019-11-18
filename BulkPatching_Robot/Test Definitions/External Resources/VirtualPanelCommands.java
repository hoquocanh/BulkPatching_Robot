package utils.data.virtualpanelcommands;

public enum VirtualPanelCommands {
	STOP("stop"),
	START_WEBDEBUG ("start_webdebug"),
	
	START_VIRTUAL_PANELS ("vp_cmd_helper --start"),
	STOP_VIRTUAL_PANELS ("vp_cmd_helper --stop"),
	VP_CMD_HELPER ("vp_cmd_helper"),
	
	CREATE ("--create"),
	ATTACH ("--attach"),
	PRESS ("--press"),
	RELEASE ("--release"),
	PLUGIN ("--plugin"),
	PLUGOUT ("--plugout"),
	
	RACK ("--rack"),
	PANEL ("--panel"),
	PORT ("--port"),
	TYPE ("--type"),
	ROW ("--row"),
	MODULE ("--module"),
	MODULEKIT ("--modulekit"),
	MODULEHD ("--modulehd"),
	ORIENT ("--orient"),
	
	EXIT("exit"),
	
	//Data type
	COPPER_1100PS("1100ps"),
	LC_G2LC("g2lc"),
	HDF("hdf"),
	MPO_32MPO("32mpo"),
	FIBER_96lc("96lc");
	;
	
	private final String value;
	VirtualPanelCommands(String value) { this.value = value; }
    public String getValue() { return value; }
}

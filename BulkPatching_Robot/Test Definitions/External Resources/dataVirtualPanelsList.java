package utils.data.virtualpanelcommands;

import java.util.ArrayList;
import java.util.List;

public enum dataVirtualPanelsList {

	
	PANELLIST("panelList"),

	//Inside "panelList" key
	RACKID("rackId"),
	RACKNUMBER("rackNumber"),
	TOTALPANELS("totalPanels"),
	TOTALVIRTUALKITS("totalVirtualIndex"),
	PANELS("panels"),

	//Inside "panels" key
	PANELNUMBER("panelNumber"),
	RUHEIGHT("ruHeight"),	
	ROWCOUNT("rowCount"),
	TOTALKITS("totalKits"),
	KITS("kits"),
	
	//Inside "kits" key
	VIRTUALINDEX("virtualIndex"),
	ID("id"),
	KITS_TYPE("type"),
	HARDWAREVERSION("hardwareVersion"),
	ROWNUMBER("rowNumber"),
	STATUS("status"),
	FIRMWARETIMESTAMP("firmwareTimestamp"),
	UPDATABLE("updatable"),
	PORTOFFSET("portOffset"),
	MODULES("modules"),
	
	//Inside "module" key
	POSTION("position"),
	ORIENTATION("orientation"),
	MODULE_TYPE("type"),
	LOWESTPORTNUMBER("lowestPortNumber"),
	SENSORPERPORTNUMBERS("sensorsPerPortNumber"),
	SENSORCOUNT("sensorCount"),
	OCCUPIEDSENSORMASK("occupiedSensorMask"),

	//Data type
	COPPER_1100PS("1100ps"),
	LC_G2LC("g2lc"),
	HDF("hdf"),
	MPO_32MPO("32mpo"),
	FIBER_96lc("96lc");
	
	
	
	
	
	private String value;
	
	dataVirtualPanelsList(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
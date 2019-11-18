package FirmwareObject.CMD;

//import static com.jayway.restassured.RestAssured.given;

import java.lang.reflect.Field;

import java.util.ArrayList;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import utils.common.Constants;
import utils.data.virtualpanelcommands.VirtualPanelCommands;
import utils.data.virtualpanelcommands.dataVirtualPanelsList;

import java.awt.AWTException; 
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent; 

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;



public class VPCommands {
	
	JSONObject panelListObject = new JSONObject();
	private static String imVisionX;
	private static String ipAddressImVisionX = "";
	private static String sshUsername = Constants.SSH_USERNAME;
	private static String ssPassword = Constants.SSH_PASSWORD;
	public VirtualPanelCommands _virtualCommand;
	public dataVirtualPanelsList _virtualPanelsList;
	
	public VPCommands(String imVisionX) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		this.imVisionX = imVisionX;
		
		//Step 1: Choose correct Static imVisionX
				switch (imVisionX) {
				case "imVisionX_A":
					this.ipAddressImVisionX = Constants.IPADDRESS_IMVISIONX_A;	
					break;
				case "imVisionX_B":
					this.ipAddressImVisionX = Constants.IPADDRESS_IMVISIONX_B;	
					break;
				default:
					this.ipAddressImVisionX = Constants.IPADDRESS_IMVISIONX_A;
					
				}	
				
		//Step 2: Open CMD window and connect SSH connection automatically
				setupSSHConnection();
	}
	
	public VPCommands(String imVisionX, String jsonPath) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, AWTException, InterruptedException
	{
		this.imVisionX = imVisionX;
		
		//Step 1: Choose correct Static imVisionX
				switch (imVisionX) {
				case "imVisionX_A":
					this.ipAddressImVisionX = Constants.IPADDRESS_IMVISIONX_A;	
					break;
				case "imVisionX_B":
					this.ipAddressImVisionX = Constants.IPADDRESS_IMVISIONX_B;	
					break;
				default:
					this.ipAddressImVisionX = Constants.IPADDRESS_IMVISIONX_A;
					
				}	
		//Step 2: Open CMD window and connect SSH connection automatically
		setupSSHConnection();	
		
		//Step 3: Get list of virtual panels from jsonPath
		getJsonObjectFromFile(jsonPath);
	}
	
	//-----------------1>>  This area for operating on CMD window--------/	
	public void openWebDebugMode() throws IOException, 
    AWTException, InterruptedException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
	{
		
		enterCommandOnEixstingSSHConnection(_virtualCommand.STOP.getValue());
		enterCommandOnEixstingSSHConnection(_virtualCommand.START_WEBDEBUG.getValue());
		waitForStartWebdebug();
		closeSSHConnection();
	}
	
	public void addListOfVirtualPanels(String panelPath) throws IOException, 
    AWTException, InterruptedException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
	{
		
		enterCommandOnEixstingSSHConnection(_virtualCommand.STOP.getValue());
		enterCommandOnEixstingSSHConnection(_virtualCommand.START_WEBDEBUG.getValue());
		waitForStartWebdebug();
		closeSSHConnection();
	}
  
	public void setupSSHConnection() throws IOException, 
    AWTException, InterruptedException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
	{
		Runtime run = Runtime.getRuntime(); 
        //This code is used to open cmd.exe
		Process process = run.exec(new String[] {"cmd", "/K", "Start"}); 
        try { 
            Thread.sleep(Constants.SHORT_TIME); 
        } 
        catch (InterruptedException e) 
        { 
            // TODO Auto-generated catch block 
            e.printStackTrace(); 
        } 
         
        Keyboard keyboard  = new Keyboard();
        //step 1: enter an "ssh" command including host's ip address
        //The command should be format as below which will add Remote Host Key to filesystem at dev/null instead of add it to ~/.ssh/known_hosts
        //In addition, this command will set "no" for StrictHostKeyChecking 
        //Here is the template of ssh command: ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" root@IPAddress
        
        
        String tempInput = "ssh -o \"UserKnownHostsFile=/dev/null\" -o \"StrictHostKeyChecking=no\" " + sshUsername + "@" + ipAddressImVisionX;
        enterAStringViaRobot(tempInput,Constants.CMD_LONG_TIME);
        
        //step 2: enter ssh password
        keyboard.type(ssPassword, Constants.CMD_SHORT_TIME);
        
	}
	
	public void enterCommandOnEixstingSSHConnection(String command) throws IOException, 
    AWTException, InterruptedException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
	{
			Keyboard keyboard  = new Keyboard();
	        keyboard.type(command, Constants.CMD_SHORT_TIME);
	}
	
	
	public void enterString(String text) throws IOException, 
    AWTException, InterruptedException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException
	{
		Robot robot = new Robot();
		String letter, code;
	    for(int i = 0; i < text.length(); i++) {
	        letter = text.substring(i,1);
	        code = "VK_" + letter.toUpperCase();

	        Field f = KeyEvent.class.getField(code);
	        int keyEvent = f.getInt(null);

	        robot.keyPress(keyEvent);
	       
	    }
	    Thread.sleep(Constants.CMD_SHORT_TIME);
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
	}
	
	public void enterAStringViaRobot(String text, int timeout) throws IOException, 
    AWTException, InterruptedException
	{
		
        StringSelection stringSelection = new StringSelection(text);
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        clipboard.setContents(stringSelection, stringSelection);

        Robot robot = new Robot();
        Thread.sleep(Constants.CMD_SHORT_TIME);
        robot.keyPress(KeyEvent.VK_CONTROL);
        robot.keyPress(KeyEvent.VK_V);
        robot.keyRelease(KeyEvent.VK_V);
        robot.keyRelease(KeyEvent.VK_CONTROL);
        Thread.sleep(Constants.CMD_SHORT_TIME);
        robot.keyPress(KeyEvent.VK_ENTER);
        robot.keyRelease(KeyEvent.VK_ENTER);
        
        Thread.sleep(timeout);
	}
	
	public void waitForStartWebdebug() throws InterruptedException
	{
		Thread.sleep(Constants.DEVICE_INITILAIZING_TIME);
	}
	
	public void closeSSHConnection() throws IOException, AWTException, InterruptedException
	{
		Keyboard keyboard  = new Keyboard();
		keyboard.type("exit", Constants.CMD_SHORT_TIME);
		keyboard.type("exit", Constants.CMD_SHORT_TIME);
	}

	//-----------------2>>  This area for entering Virtual panels commands based on input panel, row or module and port--------/
	public void startVirtualPanel() throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --start"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.START_VIRTUAL_PANELS.getValue();
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	public void stopVirtualPanel() throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --stop"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.STOP_VIRTUAL_PANELS.getValue();
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	public void pluginCopperTip(String rackNumber, String panelNumber, String rowNumber, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = getCopperInfo(rackNumber,panelNumber,rowNumber, dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 1 --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGIN.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +
				_virtualCommand.PORT.getValue() + " " + portNumber;
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
		
	public void plugoutCopperTip(String rackNumber, String panelNumber, String rowNumber, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
			//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
			String virtualIndex = getCopperInfo(rackNumber,panelNumber,rowNumber, dataVirtualPanelsList.VIRTUALINDEX.getValue());
			
			//Step 2: join each part of virtual command to be a complete one.
			//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 1 --port 1"
			String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGOUT.getValue() + " " +
					_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
					_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +
					_virtualCommand.PORT.getValue() + " " + portNumber;
			
			//Step 3: send virtual panel to SSH interface
			enterCommandOnEixstingSSHConnection(virtualCommand);
	}
	public void createCopperPanel(String rackNumber, String rowNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --create --rack 1 --type 1100ps --row 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.CREATE.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.TYPE.getValue() + " " + _virtualCommand.COPPER_1100PS.getValue() + " " +
				_virtualCommand.ROW.getValue() + " " + rowNumber;
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	public void pluginG2LCTip(String rackNumber, String panelNumber, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = getG2LCInfo(rackNumber,panelNumber,dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 1 --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGIN.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " + 
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +
				_virtualCommand.PORT.getValue() + " " + portNumber;
		System.out.println(virtualCommand);
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	
	public void plugoutG2LCTip(String rackNumber, String panelNumber, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = getG2LCInfo(rackNumber,panelNumber,dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 1 --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGOUT.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +
				_virtualCommand.PORT.getValue() + " " + portNumber;
		System.out.println(virtualCommand);
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}
	
	public void createG2LCPanel(String rackNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --create --rack 1 --type g2lc"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.CREATE.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.TYPE.getValue() + " " + _virtualCommand.LC_G2LC.getValue();
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	public void pluginMPO_96LCTip(String rackNumber, String panelNumber, String rowNumber, String modulePosition, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = this.getMPO_96LCInfo(rackNumber,panelNumber, rowNumber,modulePosition, dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 4 --module A --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGIN.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +
				_virtualCommand.MODULE.getValue() + " " + modulePosition + " " +
				_virtualCommand.PORT.getValue() + " " + portNumber;
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	public void plugoutMPO_96LCTip(String rackNumber, String panelNumber, String rowNumber, String modulePosition, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = this.getMPO_96LCInfo(rackNumber,panelNumber, rowNumber,modulePosition, dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 4 --module A --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGOUT.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +
				_virtualCommand.MODULE.getValue() + " " + modulePosition + " " +
				_virtualCommand.PORT.getValue() + " " + portNumber;
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	/**This method is used to create 96LC panel
	 * @param rackNumber
	 * @param modulePosition : A/B/C/D
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws IOException
	 * @throws AWTException
	 * @throws InterruptedException
	 */
	public void create96LCPanel(String rackNumber, String modulePosition) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Pre-condition: Process the input "modulePosition" to form of AB or CD
		String virtualModule = null;
		if (modulePosition.equalsIgnoreCase("A") || modulePosition.equalsIgnoreCase("A") == true)
		{
			virtualModule = "AB";
		}
		else if (modulePosition.equalsIgnoreCase("C") || modulePosition.equalsIgnoreCase("D") == true)
		{
			virtualModule = "CD";
		}
		
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --create --rack 1 --type 96lc --modulekit AB"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.CREATE.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.TYPE.getValue() + " " + _virtualCommand.FIBER_96lc.getValue() + " " +
				_virtualCommand.MODULEKIT.getValue() + " " + virtualModule;
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	
	
	/**This method is used to send "attach virtual panel" command. This is used for all kind of panels
	 * @param rackNumber
	 * @param currentKitIndex
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws IOException
	 * @throws AWTException
	 * @throws InterruptedException
	 */
	public void attachPanel(String rackNumber, String currentKitIndex) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --attach --rack 1 --panel 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.ATTACH.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + currentKitIndex;
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}
	public void pluginHDFTip(String rackNumber, String panelNumber, String modulehdPosition, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = getHDFInfo(rackNumber,panelNumber,modulehdPosition, dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 6 --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGIN.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +				
				_virtualCommand.PORT.getValue() + " " + portNumber;
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	public void plugoutHDFTip(String rackNumber, String panelNumber, String modulehdPosition, String portNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Step 1: get the virtualIndex of input rackNumber, panelNumber and rowNumber
		String virtualIndex = getHDFInfo(rackNumber,panelNumber,modulehdPosition, dataVirtualPanelsList.VIRTUALINDEX.getValue());
		
		//Step 2: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --plugin --rack 1 --panel 6 --port 1"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.PLUGOUT.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.PANEL.getValue() + " " + virtualIndex + " " +				
				_virtualCommand.PORT.getValue() + " " + portNumber;
		
		//Step 3: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}	
	
	/**This method is used to create HDF virtual panel
	 * @param rackNumber
	 * @param moduleHDPosition : 1, 2, 3
	 * @param orientation : alpha/ beta
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws IOException
	 * @throws AWTException
	 * @throws InterruptedException
	 */
	
	public void createHDFPanel(String rackNumber, String moduleHDPosition, String orientation) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --create --rack 1 --type hdf --modulehd 1 --orient alpha"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.CREATE.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.TYPE.getValue() + " " + _virtualCommand.HDF.getValue() + " " +
				_virtualCommand.MODULEHD.getValue() + " " + moduleHDPosition + " " +
				_virtualCommand.ORIENT.getValue() + " " + orientation.toLowerCase();
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}
	public void createMPOPanel(String rackNumber, String modulePosition) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException 
	{
		//Pre-condition: Process the input "modulePosition" to form of AB or CD
		String virtualModule = null;
		if (modulePosition.equalsIgnoreCase("A") || modulePosition.equalsIgnoreCase("A") == true)
		{
			virtualModule = "AB";
		}
		else if (modulePosition.equalsIgnoreCase("C") || modulePosition.equalsIgnoreCase("D") == true)
		{
			virtualModule = "CD";
		}
		
		//Step 1: join each part of virtual command to be a complete one.
		//virtualCommand would in form of "vp_cmd_helper --create --rack 1 --type 32mpo --modulekit AB"
		String virtualCommand = _virtualCommand.VP_CMD_HELPER.getValue() + " "+ _virtualCommand.CREATE.getValue() + " " +
				_virtualCommand.RACK.getValue() + " " + rackNumber + " " +
				_virtualCommand.TYPE.getValue() + " " + _virtualCommand.MPO_32MPO.getValue() + " " +
				_virtualCommand.MODULEKIT.getValue() + " " + virtualModule;
		
		//Step 2: send virtual panel to SSH interface
		enterCommandOnEixstingSSHConnection(virtualCommand);
	}
	
	/**This method is used to classify the appropriate type of panel and call the correct "createPanel" method
	 * @param objKit : JSONObject "kit" from json file
	 * @param rackNumber
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws IOException
	 * @throws AWTException
	 * @throws InterruptedException
	 */
	void createAppropriatePanelType(JSONObject objKit, String rackNumber) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException, AWTException, InterruptedException
	{
		String outputPanelType = this.getKeyValueInJsonObject(objKit, _virtualPanelsList.KITS_TYPE.getValue());
		String outputRowNumber = "";
		
		if (outputPanelType.equalsIgnoreCase(_virtualPanelsList.COPPER_1100PS.getValue())== true)
		{
			outputRowNumber = this.getKeyValueInJsonObject(objKit,  _virtualPanelsList.ROWNUMBER.getValue());
			this.createCopperPanel(rackNumber, outputRowNumber);
		}
		else if (outputPanelType.equalsIgnoreCase(_virtualPanelsList.LC_G2LC.getValue())== true)
		{
			this.createG2LCPanel(rackNumber);
		}
		else if (outputPanelType.equalsIgnoreCase(_virtualPanelsList.FIBER_96lc.getValue())== true)
		{	
			
			//Level 4: Get only one JSONArray [] - Inside "kits" . That is "modules"
			
			JSONArray arrModules = objKit.getJSONArray(_virtualPanelsList.MODULES.getValue());
			
			int currentModuleIndex = 0;
			String outputModulePosition = getKeyValueInJsonObject(arrModules.getJSONObject(currentModuleIndex), _virtualPanelsList.POSTION.getValue());
			this.create96LCPanel(rackNumber, outputModulePosition);
			
		}
		else if (outputPanelType.equalsIgnoreCase(_virtualPanelsList.MPO_32MPO.getValue())== true)
		{	
			
			//Level 4: Get only one JSONArray [] - Inside "kits" . That is "modules"
			
			JSONArray arrModules = objKit.getJSONArray(_virtualPanelsList.MODULES.getValue());
			
			int currentModuleIndex = 0;
			String outputModulePosition = getKeyValueInJsonObject(arrModules.getJSONObject(currentModuleIndex), _virtualPanelsList.POSTION.getValue());

			this.createMPOPanel(rackNumber, outputModulePosition);
			
		}
		else if (outputPanelType.equalsIgnoreCase(_virtualPanelsList.HDF.getValue())== true)
		{	
			JSONArray arrModules = objKit.getJSONArray(_virtualPanelsList.MODULES.getValue());
			//Since there is only one array modules in array kits. So, I set the indexArrayModules as 0 meaning the first index in array
			int indexArrayModules = 0;
			String outputModuleHDPosition = getKeyValueInJsonObject(arrModules.getJSONObject(indexArrayModules), _virtualPanelsList.POSTION.getValue());
			String outputorientation = getKeyValueInJsonObject(arrModules.getJSONObject(indexArrayModules), _virtualPanelsList.ORIENTATION.getValue());
			this.createHDFPanel(rackNumber, outputModuleHDPosition, outputorientation);
			
		}
	}
	
	/**This method is used to create all virtual panels from jsonPath which belong to rackNumber 
	 * @param jsonPath
	 * @param rackNumber
	 * @throws IOException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws JSONException
	 * @throws AWTException
	 * @throws InterruptedException
	 */
	public void createAndAttachAllPanelsFromJsonfile(String jsonPath, String rackNumber) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, JSONException, AWTException, InterruptedException
	{
		
		String outputRackNumber = null;
		String outputKeyValue = null;
		String outputVirtualIndex = null;
		
		//Step 1: Get JSONobject from beginning  
		JSONObject obj = getJsonObjectFromFile(jsonPath);
		
		//Level 1: Get JSONArray Level 1 - Inside "panelList"
		JSONArray arrPanelList = obj.getJSONArray(_virtualPanelsList.PANELLIST.getValue());

		outputRackNumber = getKeyValueInJsonObject(arrPanelList.getJSONObject(0),_virtualPanelsList.RACKNUMBER.getValue());
		
		//If the json list provided contains the value of "rackNumber" matching the input rackNumber, we will continue to do the next steps
		if(rackNumber.equalsIgnoreCase(outputRackNumber) == true)
		{
			//Level 2: Get JSONArray [] - Inside "panelList" . That is "panels"
			JSONArray arrPanels = arrPanelList.getJSONObject(0).getJSONArray(_virtualPanelsList.PANELS.getValue());
			
			for (int currentPanelIndex=0; currentPanelIndex< arrPanels.length() ; currentPanelIndex++)
			{
				//Level 3: Get only one JSONArray [] - Inside "panels" . That is "kits"
				
				JSONArray arrKits = arrPanels.getJSONObject(currentPanelIndex).getJSONArray(_virtualPanelsList.KITS.getValue());
				
				for (int currentKitIndex = 0; currentKitIndex< arrKits.length(); currentKitIndex++)
				{
					//Step 2: send "create virtual panel" command
					createAppropriatePanelType(arrKits.getJSONObject(currentKitIndex), rackNumber);
					
					//Step 3: send "attach virtual panel" command
					outputVirtualIndex = this.getKeyValueInJsonObject(arrKits.getJSONObject(currentKitIndex),  _virtualPanelsList.VIRTUALINDEX.getValue());
					attachPanel(rackNumber, String.valueOf(outputVirtualIndex));
				}
			}
		}
	}
	
	//-----------------3>>  This area for selecting correct virtualIndex number based on input panel, row or module--------/	
	//This method used to get the total number of kits (index) in Rack
	@SuppressWarnings("unchecked")
	public JSONObject getJsonObjectFromFile(String jsonPath) throws IOException
	{
		
		//JSON parser object to parse read file
        JSONParser jsonParser = new JSONParser();
        JSONObject rootObject = new JSONObject();
       
        //Step 1: This step is used to read a json file and put it into a JSONObject
        try (FileReader reader = new FileReader(identifyTheJsonPath(jsonPath)))
        {
            //Read JSON file
            Object obj = jsonParser.parse(reader);
 
          //Step 1: Get JSONobject from beginning  
			
            //JSONObject rootObject = (JSONObject) obj;
			rootObject = new JSONObject(obj.toString());
          
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
		
        this.panelListObject = rootObject;
		return rootObject;
	}

	public String identifyTheJsonPath(String path) {
  		
  		if (path.contains("/")) {
  			return Constants.DATA_SOURCE + path;
  			
  		}
  		else {
  			return path;
  		}
  	 	
	}
	//-----------------This area for getting and checking GET value of keys--------/		
	/**This method get the value of input Key "keyOfInfo" if the checking panels only need to input key
	 * This method is used for to get general information like keys as following:
	 * rackNumber
	 * totalPanels
	 * totalVirtualIndex
	 * @param key
	 * @return
	 */
	public String getGeneralInfo(String key) {
	
		String outputKeyValue = null;
		
		//Step 1: Get JSONobject from beginning  
		JSONObject obj = panelListObject;
		
		//Level 1: Get JSONArray Level 1 - Inside "panelList"
		JSONArray arrPanelList = obj.getJSONArray(_virtualPanelsList.PANELLIST.getValue());

		outputKeyValue = getKeyValueInJsonObject(arrPanelList.getJSONObject(0),key);
	
	return outputKeyValue;
		
	}
	
	
	/**This method is checked whether a key is existed in a JSONArray
	 * @param jsonArray
	 * @param key
	 * @return
	 */
	public String getKeyValueInJsonArray (JSONArray jsonArray, String key)
	{
		String outputKeyValue = null;
		
		
		for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            if(jsonObject.has(key) == true)
            {
            	
                	if (isValueOfKeyString(key)==true)
    				{
                		outputKeyValue = jsonObject.getString(key);   
    				}
    				else outputKeyValue = Integer.toString(jsonObject.getInt(key));
            	break;
           
            }
		}
		
		return outputKeyValue;
	}
	
	/**This method is checked whether a key is existed in a JSONObject
	 * @param jsonObject
	 * @param key
	 * @return
	 */
	public String getKeyValueInJsonObject (JSONObject jsonObject, String key)
	{
		String outputKeyValue = null;
		
            if(jsonObject.has(key) == true)
            {
            	if (isValueOfKeyString(key)==true)
				{
            		outputKeyValue = jsonObject.getString(key);   
				}
				else outputKeyValue = Integer.toString(jsonObject.getInt(key));
            	
            	         	
            }
       
		return outputKeyValue;
	}
	
	/**This method is used to get value of key for LC panel which is listed from JSONArray "panels"
	 * @param rackNumber
	 * @param panelNumber
	 * @param key
	 * @return
	 */
	public String getG2LCInfo(String rackNumber, String panelNumber, String key)
	{
		
		String outputRackNumber = null;
		String outputKeyValue = null;
		String outputPanelType = null;
		//Step 1: Get JSONobject from beginning  
		JSONObject obj = panelListObject;
		
		//Level 1: Get JSONArray Level 1 - Inside "panelList"
		JSONArray arrPanelList = obj.getJSONArray(_virtualPanelsList.PANELLIST.getValue());

		outputRackNumber = getKeyValueInJsonObject(arrPanelList.getJSONObject(0),_virtualPanelsList.RACKNUMBER.getValue());
		
		//If the json list provided contains the value of "rackNumber" matching the input rackNumber, we will continue to do the next steps
		if(rackNumber.equalsIgnoreCase(outputRackNumber) == true)
		{
			//Level 2: Get JSONArray [] - Inside "panelList" . That is "panels"
			JSONArray arrPanels = arrPanelList.getJSONObject(0).getJSONArray(_virtualPanelsList.PANELS.getValue());
			
			int indexArrayPanels = Integer.parseInt(panelNumber) -1;
			
			//Check to see if JSONObject[panelNumber-1] exists the input key
			outputKeyValue = getKeyValueInJsonObject(arrPanels.getJSONObject(indexArrayPanels), key);
			
			if (outputKeyValue != null)
			{
				return outputKeyValue;
			}
			else
			{
				//Level 3: Get only one JSONArray [] - Inside "panels" . That is "kits"
				
				JSONArray arrKits = arrPanels.getJSONObject(indexArrayPanels).getJSONArray(_virtualPanelsList.KITS.getValue());
				outputPanelType = getKeyValueInJsonArray(arrKits, _virtualPanelsList.KITS_TYPE.getValue());
				//For g2lc panel, the indexArrayKits is 0
				int indexArrayKits = 0;
				outputKeyValue = getKeyValueInJsonObject(arrKits.getJSONObject(indexArrayKits), key);
				
				if (_virtualPanelsList.LC_G2LC.getValue().equalsIgnoreCase(outputPanelType)== true && outputKeyValue != null)
				{
					return outputKeyValue;
				}
				else
				{
					//Level 4: Get only one JSONArray [] - Inside "kits" . That is "modules"
					
					JSONArray arrModules = arrKits.getJSONObject(indexArrayKits).getJSONArray(_virtualPanelsList.MODULES.getValue());
					//Since there is only one array modules in array kits. So, I set the indexArrayModules as 0 meaning the first index in array
					int indexArrayModules = 0;
					outputKeyValue = getKeyValueInJsonObject(arrModules.getJSONObject(indexArrayModules), key);
				}
			}
		}
		return outputKeyValue;
				
	}
	/**This method is used to get value of key for Copper panel which is listed from JSONArray "panels"
	 * @param rackNumber
	 * @param panelNumber
	 * @param rowNumber
	 * @param key
	 * @return
	 */
	public String getCopperInfo(String rackNumber, String panelNumber, String rowNumber, String key)
	{
		String outputRackNumber = null;
		String outputKeyValue = null;
		String outputPanelType = null;
		//Step 1: Get JSONobject from beginning  
		JSONObject obj = panelListObject;
		
		//Level 1: Get JSONArray Level 1 - Inside "panelList"
		JSONArray arrPanelList = obj.getJSONArray(_virtualPanelsList.PANELLIST.getValue());
		
		outputRackNumber = getKeyValueInJsonObject(arrPanelList.getJSONObject(0),_virtualPanelsList.RACKNUMBER.getValue());
		
		//If the json list provided contains the value of "rackNumber" matching the input rackNumber, we will continue to do the next steps
		if(rackNumber.equalsIgnoreCase(outputRackNumber) == true)
		{
			//Level 2: Get JSONArray [] - Inside "panelList" . That is "panels"
			
			JSONArray arrPanels = arrPanelList.getJSONObject(0).getJSONArray(_virtualPanelsList.PANELS.getValue());
			
			int indexArrayPanels = Integer.parseInt(panelNumber) -1;
			
			//Check to see if JSONObject[panelNumber-1] exists the input key
			outputKeyValue = getKeyValueInJsonObject(arrPanels.getJSONObject(indexArrayPanels), key);
			
			if (outputKeyValue != null)
			{
				return outputKeyValue;
			}
			else
			{
				//Level 3: Get only one JSONArray [] - Inside "panels" . That is "kits"
				
				JSONArray arrKits = arrPanels.getJSONObject(indexArrayPanels).getJSONArray(_virtualPanelsList.KITS.getValue());
				outputPanelType = getKeyValueInJsonArray(arrKits, _virtualPanelsList.KITS_TYPE.getValue());
				//indexArrayKits depends on rowNumber. It can be from 0 to 1
				int indexArrayKits = Integer.parseInt(rowNumber)-1;
				outputKeyValue = getKeyValueInJsonObject(arrKits.getJSONObject(indexArrayKits), key);
				
				if (_virtualPanelsList.COPPER_1100PS.getValue().equalsIgnoreCase(outputPanelType)== true && outputKeyValue != null)
				{
					return outputKeyValue;
				}
				else
				{
					//Level 4: Get only one JSONArray [] - Inside "kits" . That is "modules"
					
					JSONArray arrModules = arrKits.getJSONObject(indexArrayKits).getJSONArray(_virtualPanelsList.MODULES.getValue());
					//Since there is only one array modules in array kits. So, I set the indexArrayModules as 0 meaning the first index in array
					int indexArrayModules = 0;
					outputKeyValue = getKeyValueInJsonObject(arrModules.getJSONObject(indexArrayModules), key);
				}
			}
		}
		return outputKeyValue;
				
	}
	
	public int selectCorrectJsonKit_MPO_96LC(String rowNumber, String modulePosition)
	{
		int correctJsonKit = 0;
		
		//Due to module A or B belong to json kit #1
		if (modulePosition.equalsIgnoreCase("A") || true && modulePosition.equalsIgnoreCase("B"))
		{
			correctJsonKit = 1 + Integer.parseInt(rowNumber) -1;
		}
		//Due to module C or D belong to json kit #2
		else if (modulePosition.equalsIgnoreCase("C") || true && modulePosition.equalsIgnoreCase("D"))
		{
			correctJsonKit = 2 + Integer.parseInt(rowNumber) -1;
		}
		
		return correctJsonKit;
	}
	public int selectCorrectJsonModule_MPO_96LC(String modulePosition)
	{
		int correctJsonModule = 0;
		
		//Due to module A or C belong to json module #1
		if (modulePosition.equalsIgnoreCase("A") || true && modulePosition.equalsIgnoreCase("C"))
		{
			correctJsonModule = 1;
		}
		//Due to module B or D belong to json kit #2
		else if (modulePosition.equalsIgnoreCase("B") || true && modulePosition.equalsIgnoreCase("D"))
		{
			correctJsonModule = 2 ;
		}
		
		return correctJsonModule;
	}
	/**This method is used to get value of key for MPO and 96LC panel which is listed from JSONArray "panels"
	 * @param rackNumber
	 * @param panelNumber
	 * @param rowNumber
	 * @param modulePosition
	 * @param key
	 * @return
	 */
	public String getMPO_96LCInfo(String rackNumber, String panelNumber, String rowNumber, String modulePosition, String key)
	{
		String outputRackNumber = null;
		String outputKeyValue = null;
		String outputPanelType = null;
		//Step 1: Get JSONobject from beginning  
		JSONObject obj = panelListObject;
		
		//Level 1: Get JSONArray Level 1 - Inside "panelList"
		JSONArray arrPanelList = obj.getJSONArray(_virtualPanelsList.PANELLIST.getValue());
		
		outputRackNumber = getKeyValueInJsonObject(arrPanelList.getJSONObject(0),_virtualPanelsList.RACKNUMBER.getValue());
		
		//If the json list provided contains the value of "rackNumber" matching the input rackNumber, we will continue to do the next steps
		if(rackNumber.equalsIgnoreCase(outputRackNumber) == true)
		{
			//Level 2: Get JSONArray [] - Inside "panelList" . That is "panels"
			
			JSONArray arrPanels = arrPanelList.getJSONObject(0).getJSONArray(_virtualPanelsList.PANELS.getValue());
			
			int indexArrayPanels = Integer.parseInt(panelNumber) -1;
			
			//Check to see if JSONObject[panelNumber-1] exists the input key
			outputKeyValue = getKeyValueInJsonObject(arrPanels.getJSONObject(indexArrayPanels), key);
			
			if (outputKeyValue != null)
			{
				return outputKeyValue;
			}
			else
			{
				//Level 3: Get only one JSONArray [] - Inside "panels" . That is "kits"
				
				JSONArray arrKits = arrPanels.getJSONObject(indexArrayPanels).getJSONArray(_virtualPanelsList.KITS.getValue());
				outputPanelType = getKeyValueInJsonArray(arrKits, _virtualPanelsList.KITS_TYPE.getValue());
				//indexArrayKits depends on rowNumber, modulePosition. The index in array must be the output position - 1 
				int indexArrayKits = selectCorrectJsonKit_MPO_96LC(rowNumber, modulePosition) -1;
				outputKeyValue = getKeyValueInJsonObject(arrKits.getJSONObject(indexArrayKits), key);
				
				if ((_virtualPanelsList.MPO_32MPO.getValue().equalsIgnoreCase(outputPanelType)== true || _virtualPanelsList.FIBER_96lc.getValue().equalsIgnoreCase(outputPanelType)== true) && outputKeyValue != null)
				{
					return outputKeyValue;
				}
				else
				{
					//Level 4: Get only one JSONArray [] - Inside "kits" . That is "modules"
					
					JSONArray arrModules = arrKits.getJSONObject(indexArrayKits).getJSONArray(_virtualPanelsList.MODULES.getValue());
					//indexArrayModules depend on modulePosition
					int indexArrayModules = selectCorrectJsonModule_MPO_96LC(modulePosition);
					
					outputKeyValue = getKeyValueInJsonObject(arrModules.getJSONObject(indexArrayModules), key);
					
				}
			}
		}
		return outputKeyValue;
				
	}
	/**This method is used to get value of key for HDF panel which is listed from JSONArray "panels"
	 * @param rackNumber
	 * @param panelNumber
	 * @param modulehdPosition
	 * @param key
	 * @return
	 */
	public String getHDFInfo(String rackNumber, String panelNumber,String modulehdPosition, String key)
	{
		String outputRackNumber = null;
		String outputKeyValue = null;
		String outputPanelType = null;
		//Step 1: Get JSONobject from beginning  
		JSONObject obj = panelListObject;
		
		//Level 1: Get JSONArray Level 1 - Inside "panelList"
		JSONArray arrPanelList = obj.getJSONArray(_virtualPanelsList.PANELLIST.getValue());
		outputRackNumber = getKeyValueInJsonObject(arrPanelList.getJSONObject(0),_virtualPanelsList.RACKNUMBER.getValue());
		
		//If the json list provided contains the value of "rackNumber" matching the input rackNumber, we will continue to do the next steps
		if(rackNumber.equalsIgnoreCase(outputRackNumber) == true)
		{
			//Level 2: Get JSONArray [] - Inside "panelList" . That is "panels"
			
			JSONArray arrPanels = arrPanelList.getJSONObject(0).getJSONArray(_virtualPanelsList.PANELS.getValue());
			
			int indexArrayPanels = Integer.parseInt(panelNumber) -1;
			
			//Check to see if JSONObject[panelNumber-1] exists the input key
			outputKeyValue = getKeyValueInJsonObject(arrPanels.getJSONObject(indexArrayPanels), key);
			
			if (outputKeyValue != null)
			{
				return outputKeyValue;
			}
			else
			{
				//Level 3: Get only one JSONArray [] - Inside "panels" . That is "kits"
				
				JSONArray arrKits = arrPanels.getJSONObject(indexArrayPanels).getJSONArray(_virtualPanelsList.KITS.getValue());
				outputPanelType = getKeyValueInJsonArray(arrKits, _virtualPanelsList.KITS_TYPE.getValue());
				//indexArrayKits depends on rowNumber. It can be from 0 to 1
				int indexArrayKits = Integer.parseInt(modulehdPosition)-1;
				outputKeyValue = getKeyValueInJsonObject(arrKits.getJSONObject(indexArrayKits), key);
				
				if (_virtualPanelsList.HDF.getValue().equalsIgnoreCase(outputPanelType)== true && outputKeyValue != null)
				{
					return outputKeyValue;
				}
				else
				{
					//Level 4: Get only one JSONArray [] - Inside "kits" . That is "modules"
					
					JSONArray arrModules = arrKits.getJSONObject(indexArrayKits).getJSONArray(_virtualPanelsList.MODULES.getValue());
					//Since there is only one array modules in array kits. So, I set the indexArrayModules as 0 meaning the first index in array
					int indexArrayModules = 0;
					outputKeyValue = getKeyValueInJsonObject(arrModules.getJSONObject(indexArrayModules), key);
				}
			}
		}
		return outputKeyValue;
				
	}
	

//This method will define the value of inputed key will be a number or string
public Boolean isValueOfKeyString( String key)
{
	//Step 1: create list of keys which their value is a string
	List<String> listKeyIsString = new ArrayList<String>();
	
	listKeyIsString.add(_virtualPanelsList.PANELLIST.getValue());
	listKeyIsString.add(_virtualPanelsList.RACKID.getValue());
	listKeyIsString.add(_virtualPanelsList.ID.getValue());
	listKeyIsString.add(_virtualPanelsList.KITS_TYPE.getValue());
	listKeyIsString.add(_virtualPanelsList.STATUS.getValue());
	listKeyIsString.add(_virtualPanelsList.FIRMWARETIMESTAMP.getValue());
	listKeyIsString.add(_virtualPanelsList.UPDATABLE.getValue());
	listKeyIsString.add(_virtualPanelsList.POSTION.getValue());
	listKeyIsString.add(_virtualPanelsList.ORIENTATION.getValue());
	listKeyIsString.add(_virtualPanelsList.MODULE_TYPE.getValue());
	
	//step 2: identify the inputed key is a string or not
	if (listKeyIsString.contains(key)== true)
		return true;
	else return false; 
			
}

//Select the father Key of the inputed key
public String getFatherKey(String inputKey) {
	
	//Step 1: Classify the keys by group it belong to
	List<String> listKeyOfPanelList = new ArrayList<String>();
	
	listKeyOfPanelList.add(_virtualPanelsList.RACKID.getValue());
	listKeyOfPanelList.add(_virtualPanelsList.TOTALPANELS.getValue());
	listKeyOfPanelList.add(_virtualPanelsList.TOTALVIRTUALKITS.getValue());
	listKeyOfPanelList.add(_virtualPanelsList.PANELS.getValue());
	
	List<String> listKeyOfPanels = new ArrayList<String>();
	
	listKeyOfPanels.add(_virtualPanelsList.PANELNUMBER.getValue());
	listKeyOfPanels.add(_virtualPanelsList.RUHEIGHT.getValue());
	listKeyOfPanels.add(_virtualPanelsList.ROWCOUNT.getValue());
	listKeyOfPanels.add(_virtualPanelsList.TOTALKITS.getValue());
	listKeyOfPanels.add(_virtualPanelsList.KITS.getValue());
	
	List<String> listKeyOfKits = new ArrayList<String>();
	
	listKeyOfKits.add(_virtualPanelsList.VIRTUALINDEX.getValue());
	listKeyOfKits.add(_virtualPanelsList.ID.getValue());
	listKeyOfKits.add(_virtualPanelsList.KITS_TYPE.getValue());
	listKeyOfKits.add(_virtualPanelsList.HARDWAREVERSION.getValue());
	listKeyOfKits.add(_virtualPanelsList.ROWNUMBER.getValue());
	listKeyOfKits.add(_virtualPanelsList.STATUS.getValue());
	listKeyOfKits.add(_virtualPanelsList.FIRMWARETIMESTAMP.getValue());
	listKeyOfKits.add(_virtualPanelsList.UPDATABLE.getValue());
	listKeyOfKits.add(_virtualPanelsList.PORTOFFSET.getValue());
	listKeyOfKits.add(_virtualPanelsList.MODULES.getValue());
	
	List<String> listKeyOfModules = new ArrayList<String>();
	
	listKeyOfModules.add(_virtualPanelsList.POSTION.getValue());
	listKeyOfModules.add(_virtualPanelsList.ORIENTATION.getValue());
	listKeyOfModules.add(_virtualPanelsList.MODULE_TYPE.getValue());
	listKeyOfModules.add(_virtualPanelsList.LOWESTPORTNUMBER.getValue());
	listKeyOfModules.add(_virtualPanelsList.SENSORPERPORTNUMBERS.getValue());
	listKeyOfModules.add(_virtualPanelsList.SENSORCOUNT.getValue());
	listKeyOfModules.add(_virtualPanelsList.OCCUPIEDSENSORMASK.getValue());
	
	//step 2: identify the father of the inputed key
	if (listKeyOfPanelList.contains(inputKey)== true)
		return "panelList";
	else if (listKeyOfPanels.contains(inputKey)== true)
		return "panels";
	else if (listKeyOfKits.contains(inputKey)== true)
		return "kits";
	if (listKeyOfModules.contains(inputKey)== true)	
		return "modules";
	else return "the " + inputKey + " not belong to any group of panels information";

}

//This method used to get 2 first characters of panel serial number
public String get2FirstCharOfSN(String fullSN)
{
	
	return fullSN.substring(0, 2);
}


	
}

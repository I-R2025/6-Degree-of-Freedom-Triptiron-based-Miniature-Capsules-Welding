//***********************************************control program for ases project*****************************************//

// ros header files
#include "ros/ros.h"
#include <ros/time.h>
// definitions header file
#include <ases_mc_pkg1/Definitions.h>
// service header files
#include <ases_mc_pkg1/parking.h>
#include <ases_mc_pkg1/trajectory.h>
#include <ases_mc_pkg1/axis_motion.h>
#include <ases_mc_pkg1/homing_axis_srv.h>
#include <ases_mc_pkg1/laser_control.h>
#include <ases_mc_pkg1/welding.h>
#include <ases_mc_pkg1/automatic_job.h>
#include <ases_mc_pkg1/grip_release.h>
// messages header files
#include <ases_mc_pkg1/status.h>
#include <ases_mc_pkg1/state.h>
// standard header files
#include <std_srvs/Trigger.h>
#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <string.h>
#include <sstream>
#include <unistd.h>
#include <getopt.h>
#include <stdlib.h>
#include <stdio.h>
#include <list>
#include <math.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/times.h>
#include <sys/time.h>
#include <iostream>



class Control
{
  public:
	
 	ros::NodeHandle nh;

	// start communication variables

	typedef void* HANDLE;
  	void* g_pKeyHandle;
  	void* g_subKeyHandle;
	unsigned short g_usNodeId;
	unsigned int g_baudrate; 
	std::string g_deviceName;
	std::string g_protocolStackName; 
	std::string g_interfaceName;
	std::string g_portName;
	std::string g_subdeviceName;
	std::string g_subprotocolStackName; 
	//std::hex p_ulErrorCode;
	unsigned int ulErrorCode;
	unsigned int Timeout;
	int sensortype;
	int enc_res;
	int InvertedPolarity;

	// faulty and enable status variables

	int x_axis_state; 
	int y_axis_state; 
	int z_axis_state; 
	int orient_axis_state;
	int grip_axis_state;
	int rot_axis_state;

	int x_axisEnable_state;
	int y_axisEnable_state;
        int z_axisEnable_state;
	int orient_axisEnable_state;
	int grip_axisEnable_state;
        int rot_axisEnable_state;


	// position variables

	int pPositionIsCounts_x;
	int pPositionIsCounts_y;
	int pPositionIsCounts_z;
	int pPositionIsCounts_o;
	int pPositionIsCounts_g;
	int pPositionIsCounts_r;

	// velocity variables

	int pVelocityIs_x;
	int pVelocityIs_y;
	int pVelocityIs_z;
	int pVelocityIs_o;
	int pVelocityIs_g;
	int pVelocityIs_r;

	// digital input variables

	unsigned short pInputs_x;
	unsigned short pInputs_y;
	unsigned short pInputs_z;
	unsigned short pInputs_o;
	unsigned short pInputs_g;
	unsigned short pInputs_r;

	// flags
	
	bool homingflag;
	bool xaxismovementflag;
	bool yaxismovementflag;
	bool zaxismovementflag;
	bool xhomeflag;
	bool yhomeflag;
	bool zhomeflag;
	bool ohomeflag;
	bool ostartrefflag;
	bool ghomeflag;
	bool gstartrefflag;
	bool automaticjobflag;
	bool grippingflag;
	bool releasingflag;
	bool gripedflag;
	bool releasedflag;
	bool starthomingflag;
	bool parkingflag;

	// home position variables

	int xaxishomeposoffset;
	int yaxishomeposoffset;
	int zaxishomeposoffset;
	int xcountpermm;
	int ycountpermm;
	int zcountpermm;
	int xhomepositioncounts;
	int yhomepositioncounts;
	int zhomepositioncounts;
	int xextpositioncounts;
	int yextpositioncounts;
	int zextpositioncounts;
	int xhomepositionmm;
	int yhomepositionmm;
	int zhomepositionmm;
	int xextpositionmm;
	int yextpositionmm;
	int zextpositionmm;
	int xtotaltravel;
	int ytotaltravel;
	int ztotaltravel;
	signed int xparkingpos;
	signed int yparkingpos;
	signed int zparkingpos;
	unsigned int overlappedpos_r;
	int x_pCurrentIsAveraged;
	int y_pCurrentIsAveraged;
	int z_pCurrentIsAveraged;
	int o_pCurrentIsAveraged;
	int g_pCurrentIsAveraged;
	int r_pCurrentIsAveraged;
        // services initialization

	ros::ServiceServer homing_service;
	ros::ServiceServer clear_fault_service;
	ros::ServiceServer quickstop_service;
	ros::ServiceServer movement_service;
	ros::ServiceServer extreme_position_service;
	ros::ServiceServer reset_service;
	ros::ServiceServer laser_control_service;
	ros::ServiceServer welding_service;
	ros::ServiceServer parking_service;
	ros::ServiceServer automatic_job_service;
	ros::ServiceServer grip_release_service;

	// publisher initialization

	ros::Publisher status_publisher; // position and velocity update
	ros::Publisher state_publisher;  // fault state update
	ros::Publisher errormsg_publisher; // error msg publish
 
	ases_mc_pkg1::status Position;
	ases_mc_pkg1::state State;
	std_msgs::String ErrorMsg;
	

	Control()
	{
		//nh.getParam("BaudRate",g_baudrate);
		g_pKeyHandle = 0;
		g_subKeyHandle = 0;	
		nh.getParam("deviceName",g_deviceName);	
		nh.getParam("protocolStackName",g_protocolStackName);
		nh.getParam("interfaceName",g_interfaceName);
		nh.getParam("portName",g_portName);
		nh.getParam("subdeviceName",g_subdeviceName);	
		nh.getParam("subprotocolStackName",g_subprotocolStackName);
		//nh.getParam("Timeout",Timeout);
		x_axis_state = 0; 
		y_axis_state = 0;
		z_axis_state = 0;
		orient_axis_state = 0;
		grip_axis_state = 0;
		rot_axis_state = 0;
		x_axisEnable_state = 0;
		y_axisEnable_state = 0;
        	z_axisEnable_state = 0;
		orient_axisEnable_state = 0;
		grip_axisEnable_state = 0;
        	rot_axisEnable_state = 0;
        	overlappedpos_r = 0;
                nh.getParam("sensortype",sensortype);
		nh.getParam("encoderresolution",enc_res);
		nh.getParam("invertedpolarity",InvertedPolarity);
		nh.getParam("xaxishomeposoffset",xaxishomeposoffset);
		nh.getParam("yaxishomeposoffset",yaxishomeposoffset);
		nh.getParam("zaxishomeposoffset",zaxishomeposoffset);
		nh.getParam("xcountpermm",xcountpermm);
		nh.getParam("ycountpermm",ycountpermm);
		nh.getParam("zcountpermm",zcountpermm);
		nh.getParam("xparkingpos",xparkingpos);
		nh.getParam("yparkingpos",yparkingpos);
		nh.getParam("zparkingpos",zparkingpos);
		xhomepositioncounts = xaxishomeposoffset*xcountpermm;
	    	yhomepositioncounts = yaxishomeposoffset*ycountpermm;
	    	zhomepositioncounts = zaxishomeposoffset*zcountpermm;
		xhomepositionmm = xaxishomeposoffset;
	    	yhomepositionmm = yaxishomeposoffset;
	    	zhomepositionmm = zaxishomeposoffset;
		xaxismovementflag = false;
		yaxismovementflag = false;
		zaxismovementflag = false;
		homingflag = false;
		xhomeflag = false;
		yhomeflag = false;
		zhomeflag = false;
		ohomeflag = false;
		ostartrefflag = false;
		ghomeflag = false;
		gstartrefflag = false;
		automaticjobflag = false;
		grippingflag = false;
		releasingflag = false;
		gripedflag = false;
		releasedflag = false;
		starthomingflag = false;
		parkingflag = false;
		x_pCurrentIsAveraged = 0;
		y_pCurrentIsAveraged = 0;
		z_pCurrentIsAveraged = 0;
		o_pCurrentIsAveraged = 0;
		g_pCurrentIsAveraged = 0;
		r_pCurrentIsAveraged = 0;
		overlappedpos_r = 0;
	        
	// publisher

	status_publisher = nh.advertise<ases_mc_pkg1::status>("status",10);
	state_publisher = nh.advertise<ases_mc_pkg1::state>("state",10);
	errormsg_publisher = nh.advertise<std_msgs::String>("errormsg",10);
	
	// service

	clear_fault_service = nh.advertiseService("clear_fault_srv",&Control::clearfault, this);
	homing_service = nh.advertiseService("homing_srv", &Control::homing,this);
	quickstop_service = nh.advertiseService("quickstop_srv", &Control::quickstop,this);
	movement_service = nh.advertiseService("movement_srv", &Control::axismovement, this);
	extreme_position_service = nh.advertiseService("extreme_position_srv", &Control::extpos,this);
	reset_service = nh.advertiseService("reset_srv", &Control::reset,this);
	laser_control_service = nh.advertiseService("laser_control_srv", &Control::lasercontrol, this);
	welding_service = nh.advertiseService("welding_srv", &Control::welding, this);
	parking_service = nh.advertiseService("parking_srv", &Control::parking, this);
	automatic_job_service= nh.advertiseService("automatic_job_srv", &Control::automaticjob, this);
	grip_release_service= nh.advertiseService("grip_release_srv", &Control::gripreleasejob, this);
	}

	// start communication function

  bool start_communication()
	{
	  // if(g_pKeyHandle = VCS_OpenDevice((char*)"EPOS2", (char*)"MAXON_RS232",(char*)"RS232", (char*)"/dev/ttyS1",&ulErrorCode))
	   if(g_pKeyHandle = VCS_OpenDevice((char*)g_deviceName.c_str(), (char*)g_protocolStackName.c_str(), (char*)g_interfaceName.c_str(), (char*)g_portName.c_str(), &ulErrorCode))
	   {  
		unsigned short p_usMaxLibraryNameStrSize= 100;
		char* p_pszLibraryName = new char[p_usMaxLibraryNameStrSize]; 
		unsigned short p_usMaxLibraryVersionStrSize = 100;
		char* p_pszLibraryVersion = new char[p_usMaxLibraryVersionStrSize];
		
		if(!VCS_GetDriverInfo(p_pszLibraryName, p_usMaxLibraryNameStrSize, p_pszLibraryVersion, p_usMaxLibraryVersionStrSize, &ulErrorCode))
		{
			DisplayError("SC01",ulErrorCode);
		}
		ROS_INFO_STREAM("Library Version Is:" << p_pszLibraryVersion);
		
		if(!VCS_GetProtocolStackSettings(g_pKeyHandle,&g_baudrate,&Timeout, &ulErrorCode))
		{
			DisplayError("SC03",ulErrorCode);
		  return false;
		}
		
		if(!VCS_SetProtocolStackSettings(g_pKeyHandle,1000000,Timeout, &ulErrorCode))
		{
		  DisplayError("SC04",ulErrorCode);
		  return false; 
		} 
		
		ROS_INFO_STREAM("Baudrate = " << g_baudrate<<" Timeout = " << Timeout);
		
		
    }
	  else 
	  {DisplayError("SC02",ulErrorCode);
	   return false;
	  }
	    
	    // Sub Device setting
	    
	    if(g_subKeyHandle = VCS_OpenSubDevice(g_pKeyHandle,(char*)g_subdeviceName.c_str(),(char*)g_subprotocolStackName.c_str(),&ulErrorCode))
	    {
				if(!VCS_GetGatewaySettings(g_pKeyHandle,&g_baudrate,&ulErrorCode))
				{
					DisplayError("SC05",ulErrorCode);
					return false;
				}
			
				ROS_INFO_STREAM("Sub Device Baudrate = " << g_baudrate);
				ROS_INFO_STREAM("KeyHandle = " << g_pKeyHandle << ", Sub KeyHandle = " << g_subKeyHandle);
	    }
	    else
	    {
	    	DisplayError("SC06",ulErrorCode);
	    	return false;
	    }
 /*	    if(!sensor_settings())
	    {
		ROS_INFO_STREAM("E: SC04");
		return false; 
	    }*/

	    if(!clear_fault())
	    {
				DisplayError("SC07",ulErrorCode);
				return false; 
	    }
	    
	    if(!set_Enable_state())
	    {
				DisplayError("SC08",ulErrorCode);
				return false; 
	    }
	    
	    if(!configure_IOs())
	    {
				DisplayError("SC09",ulErrorCode);
				return false; 
	    }

	   ROS_INFO("INFO: Communication started successfully");
	   
	    return true;
	  }

	  bool clear_fault()
	  {

	    if(!VCS_GetFaultState(g_pKeyHandle, 1, &x_axis_state, &ulErrorCode ))
	    {
	      DisplayError("CF01",ulErrorCode);
		return false;
	    }

	    if(x_axis_state)
	    {
	      if(!VCS_ClearFault(g_pKeyHandle,1,&ulErrorCode))
	      {
					DisplayError("CF02",ulErrorCode);
					return false;
	      }
	      ROS_INFO_STREAM("x-axis Fault is cleared");
	    }

	    if(!VCS_GetFaultState(g_pKeyHandle, 2, &y_axis_state, &ulErrorCode ))
	    {
	      DisplayError("CF03",ulErrorCode);
				return false;
	    }

	    if(y_axis_state)
	    {
	      if(!VCS_ClearFault(g_pKeyHandle,2,&ulErrorCode))
	      {
					DisplayError("CF04",ulErrorCode);
					return false;
	      }
	      ROS_INFO_STREAM("y-axis Fault is cleared");
	    }

	    if(!VCS_GetFaultState(g_pKeyHandle, 3, &z_axis_state, &ulErrorCode ))
	    {
	      DisplayError("CF05",ulErrorCode);
				return false;
	    }

	    if(z_axis_state)
	    {
	      
	      if(!VCS_ClearFault(g_pKeyHandle,3,&ulErrorCode))
	      {
					DisplayError("CF06",ulErrorCode);
					return false;
	      }
	      ROS_INFO_STREAM("z-axis Fault is cleared");
	    }
		
	    if(!VCS_GetFaultState(g_pKeyHandle, 4, &orient_axis_state, &ulErrorCode ))
	    {
	      DisplayError("CF07",ulErrorCode);
				return false;
	    }

	    if(orient_axis_state)
	    {
	      if(!VCS_ClearFault(g_pKeyHandle,4,&ulErrorCode))
	      {
					DisplayError("CF08",ulErrorCode);
					return false;
	      }
	      ROS_INFO_STREAM("orient-axis Fault is cleared");
	    }

	    if(!VCS_GetFaultState(g_pKeyHandle, 5, &grip_axis_state, &ulErrorCode ))
	    {
	      DisplayError("CF09",ulErrorCode);
				return false;
	    }

	    if(grip_axis_state)
	    {
	      if(!VCS_ClearFault(g_pKeyHandle,5,&ulErrorCode))
	      {
					DisplayError("CF10",ulErrorCode);
					return false;
	      }
	      ROS_INFO_STREAM("grip-axis Fault is cleared");
	    }

	    if(!VCS_GetFaultState(g_pKeyHandle, 6, &rot_axis_state, &ulErrorCode ))
	    {
	      DisplayError("CF11",ulErrorCode);
				return false;
	    }

	    if(rot_axis_state)
	    {
	      if(!VCS_ClearFault(g_pKeyHandle,6,&ulErrorCode))
	      {
					DisplayError("CF12",ulErrorCode);
					return false;
	      }
	      ROS_INFO_STREAM("rot-axis Fault is cleared");
	    }
	  return true;	
	 }

	bool set_Enable_state()
	{
		if(!VCS_GetEnableState(g_pKeyHandle, 1, &x_axisEnable_state, &ulErrorCode))
		{
			DisplayError("SES01",ulErrorCode); return false;
		}

		if(!VCS_GetEnableState(g_pKeyHandle, 2, &y_axisEnable_state, &ulErrorCode))
		{
			
			DisplayError("SES02",ulErrorCode); return false;
		}

		if(!VCS_GetEnableState(g_pKeyHandle, 3, &z_axisEnable_state, &ulErrorCode))
		{
			DisplayError("SES03",ulErrorCode); return false;
		}
		if(!VCS_GetEnableState(g_pKeyHandle, 4, &orient_axisEnable_state, &ulErrorCode))
		{
			DisplayError("SES04",ulErrorCode); return false;
		}

		if(!VCS_GetEnableState(g_pKeyHandle, 5, &grip_axisEnable_state, &ulErrorCode))
		{
			DisplayError("SES05",ulErrorCode); return false;
		}

		if(!VCS_GetEnableState(g_pKeyHandle, 6, &rot_axisEnable_state, &ulErrorCode))
		{
			DisplayError("SES06",ulErrorCode); return false;
		}


		if(!x_axisEnable_state)
		{
			if(!VCS_SetEnableState(g_pKeyHandle, 1, &ulErrorCode))
			{
				DisplayError("SES07",ulErrorCode); return false;
			}
		}
		if(!y_axisEnable_state)
		{
			if(!VCS_SetEnableState(g_pKeyHandle, 2, &ulErrorCode))
			{
				DisplayError("SES08",ulErrorCode); return false;
			}
		}
		if(!z_axisEnable_state)
		{
			if(!VCS_SetEnableState(g_pKeyHandle, 3, &ulErrorCode))
			{
				DisplayError("SES09",ulErrorCode); return false;
			}
		}
		if(!orient_axisEnable_state)
		{
			if(!VCS_SetEnableState(g_pKeyHandle, 4, &ulErrorCode))
			{
				DisplayError("SES10",ulErrorCode); return false;
			}
		}
		if(!grip_axisEnable_state)
		{
			if(!VCS_SetEnableState(g_pKeyHandle, 5, &ulErrorCode))
			{
				DisplayError("SES11",ulErrorCode); return false;
			}
		}
		if(!rot_axisEnable_state)
		{
			if(!VCS_SetEnableState(g_pKeyHandle, 6, &ulErrorCode))
			{
				DisplayError("SES12",ulErrorCode); return false;
			}
		}
	return true;
	}

	bool sensor_settings()
	{
		if(!VCS_SetSensorType(g_pKeyHandle, 1, 1, &ulErrorCode))
		{
			DisplayError("SS01",ulErrorCode); 
			return false;
		}
		if(!VCS_SetIncEncoderParameter(g_pKeyHandle, 1, (unsigned int)enc_res, InvertedPolarity, &ulErrorCode))
		{
		  DisplayError("SS02",ulErrorCode); return false;
		}
		if(!VCS_SetSensorType(g_pKeyHandle, 2, (unsigned int)sensortype, &ulErrorCode))
		{
			DisplayError("SS03",ulErrorCode); return false;
		}
		if(!VCS_SetIncEncoderParameter(g_pKeyHandle, 2, (unsigned int)enc_res, InvertedPolarity, &ulErrorCode))
		{
		  DisplayError("SS04",ulErrorCode); return false;
		}
		if(!VCS_SetSensorType(g_pKeyHandle, 3, (unsigned int)sensortype, &ulErrorCode))
		{
			DisplayError("SS05",ulErrorCode); return false;
		}
		if(!VCS_SetIncEncoderParameter(g_pKeyHandle, 3, (unsigned int)enc_res, InvertedPolarity, &ulErrorCode))
		{
		   DisplayError("SS06",ulErrorCode);  return false;
		}
		if(!VCS_SetSensorType(g_pKeyHandle, 4, (unsigned int)sensortype, &ulErrorCode))
		{
			DisplayError("SS07",ulErrorCode);  return false;
		}
		if(!VCS_SetIncEncoderParameter(g_pKeyHandle, 4, (unsigned int)enc_res, InvertedPolarity, &ulErrorCode))
		{
		  DisplayError("SS08",ulErrorCode);  return false;
		}
		if(!VCS_SetSensorType(g_pKeyHandle, 5, (unsigned int)sensortype, &ulErrorCode))
		{
			DisplayError("SS09",ulErrorCode);  return false;
		}
		if(!VCS_SetIncEncoderParameter(g_pKeyHandle, 5, (unsigned int)enc_res, InvertedPolarity, &ulErrorCode))
		{
		  DisplayError("SS10",ulErrorCode);  return false;
		}
		if(!VCS_SetSensorType(g_pKeyHandle, 6, (unsigned int)sensortype, &ulErrorCode))
		{
			DisplayError("SS11",ulErrorCode);  return false;
		}
		if(!VCS_SetIncEncoderParameter(g_pKeyHandle, 6, (unsigned int)enc_res, InvertedPolarity, &ulErrorCode))
		{
		  DisplayError("SS12",ulErrorCode);  return false;
		}
	return true;
	}

	bool configure_IOs()
	{

	// Home Switch configuration of all axis

	if(!VCS_DigitalInputConfiguration(g_pKeyHandle,1,4,2,1,0,0,&ulErrorCode))
	{
	      DisplayError("CI01",ulErrorCode);
	      return false;
	}
	if(!VCS_DigitalInputConfiguration(g_pKeyHandle,2,4,2,1,0,0,&ulErrorCode))
	{
	      DisplayError("CI02",ulErrorCode);
	      return false;
	}
	if(!VCS_DigitalInputConfiguration(g_pKeyHandle,3,4,2,1,0,0,&ulErrorCode))
	{
	      DisplayError("CI03",ulErrorCode);
	      return false;
	}

	// Positive Limit Switch Configuration
	if(!VCS_DigitalInputConfiguration(g_pKeyHandle,1,5,1,1,1,1,&ulErrorCode))
	{
	      DisplayError("CI04",ulErrorCode);
	      return false;
	}
	if(!VCS_DigitalInputConfiguration(g_pKeyHandle,2,5,1,1,1,1,&ulErrorCode))
	{
	      DisplayError("CI05",ulErrorCode);
	      return false;
	}
	if(!VCS_DigitalInputConfiguration(g_pKeyHandle,3,5,1,1,1,1,&ulErrorCode))
	{
	      DisplayError("CI06",ulErrorCode);
	      return false;
	}

	// Digital Output Configuration
	// laser
	if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,1,15,0,1,0,&ulErrorCode))
	{
	      DisplayError("CI07",ulErrorCode);
	      return false;
	}
	// welding
	if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,2,14,0,1,0,&ulErrorCode))
	{
	      DisplayError("CI08",ulErrorCode);
	      return false;
	}
	return true;
	}
        
        // automatic job service
	bool automaticjob(ases_mc_pkg1::automatic_job::Request& request, ases_mc_pkg1::automatic_job::Response& response)
	{
	      int motorrpm = abs(((request.rpm) *529 * 80)/(16 * 16));
	      if(request.job == "start job")
	      {
	      		if(gripedflag == true)
			{ 
			      ROS_INFO_STREAM("INFO: Capsule is gripped");
			      if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,2,14,1,1,0,&ulErrorCode))
			      {
					      DisplayError("AJ01",ulErrorCode);response.success = false;
					      return false;
			      }
		      
		      	      ros::Duration(11.0).sleep();
		      	 }
		      	 else
			 {
				ROS_INFO_STREAM("INFO: Capsule is not gripped, welding is not possible");
			 }
	      }
	      if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,6,&ulErrorCode))
	      {
		DisplayError("AJ02",ulErrorCode);response.success = false;
		return false;
	      }
	    //  ROS_INFO_STREAM("INFO: rpm = "<<(request.rpm));
	      if(!VCS_SetPositionProfile(g_pKeyHandle,6,motorrpm,2000,2000,&ulErrorCode))//z-axis
	      {
		DisplayError("AJ03",ulErrorCode);response.success = false;
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,6,&ulErrorCode))
	      {
		DisplayError("AJ04",ulErrorCode);response.success = false;
		return false;
	      }
	      
	      if((request.rpm) < 0.0)
	      {
	      	overlappedpos_r = float(pPositionIsCounts_r - (float((request.overlap*330625)/100) + 330625));
	      	//ROS_INFO_STREAM("INFO: RPM is less than zero ="<<pPositionIsCounts_r);
	      }
	      
	      if((request.rpm) >= 0.0)
	      {
	      	overlappedpos_r = float(pPositionIsCounts_r + float((request.overlap*330625)/100) + 330625);
	      	//ROS_INFO_STREAM("INFO: RPM is greater than zero ="<<overlappedpos_r);
	      }
	      
	      //signed int(pPositionIsCounts_r + ((((request.overlap)*(360/100))* (330625/360)) + (360 * (330625/360)))));
	    // ROS_INFO_STREAM("demanded position of rotation = "<<int(overlappedpos_r)<<","<<(request.overlap)<<","<<float((request.overlap*330625)/100));
	   //   ROS_INFO_STREAM("current position of rotation = "<<pPositionIsCounts_r);
	      
	      	      
	      if(!VCS_MoveToPosition(g_pKeyHandle,6,overlappedpos_r,true,true,&ulErrorCode))
	      {
		DisplayError("AJ05",ulErrorCode);response.success = false;
		return false;
	      }
	      
	      automaticjobflag = true;
	      response.success = true;
	      return true;
	}
	
	//  position and velocity update topic

	bool position_update()
        {
		if(!VCS_GetPositionIs(g_pKeyHandle,1,&pPositionIsCounts_x,&ulErrorCode))
		{
			DisplayError("PU01",ulErrorCode);
			return false;
		}
	  if(!VCS_GetPositionIs(g_pKeyHandle,2,&pPositionIsCounts_y,&ulErrorCode))
		{
			DisplayError("PU02",ulErrorCode);
			return false;
	      	}
		if(!VCS_GetPositionIs(g_pKeyHandle,3,&pPositionIsCounts_z,&ulErrorCode))
		{
			DisplayError("PU03",ulErrorCode);
			return false;
		}
		if(!VCS_GetPositionIs(g_subKeyHandle,4,&pPositionIsCounts_o,&ulErrorCode))
		{
			DisplayError("PU04",ulErrorCode);
			return false;
		}
	  	if(!VCS_GetPositionIs(g_subKeyHandle,5,&pPositionIsCounts_g,&ulErrorCode))
		{
			DisplayError("PU05",ulErrorCode);
			return false;
	  	}
		if(!VCS_GetPositionIs(g_subKeyHandle,6,&pPositionIsCounts_r,&ulErrorCode))
		{
			DisplayError("PU06",ulErrorCode);
			return false;
		}   
		if(!VCS_GetVelocityIs(g_pKeyHandle,1,&pVelocityIs_x,&ulErrorCode))
		{
			DisplayError("PU07",ulErrorCode);
			return false;
		}
		if(!VCS_GetVelocityIs(g_pKeyHandle,2,&pVelocityIs_y,&ulErrorCode))
		{
			DisplayError("PU08",ulErrorCode);
			return false;
		}
		if(!VCS_GetVelocityIs(g_pKeyHandle,3,&pVelocityIs_z,&ulErrorCode))
		{
			DisplayError("PU09",ulErrorCode);
			return false;
		}
		if(!VCS_GetVelocityIs(g_subKeyHandle,4,&pVelocityIs_o,&ulErrorCode))
		{
			DisplayError("PU10",ulErrorCode);
			return false;
		}
		if(!VCS_GetVelocityIs(g_subKeyHandle,5,&pVelocityIs_g,&ulErrorCode))
		{
			DisplayError("PU11",ulErrorCode);
			return false;
		}
		if(!VCS_GetVelocityIs(g_subKeyHandle,6,&pVelocityIs_r,&ulErrorCode))
		{
			DisplayError("PU12",ulErrorCode);
			return false;
		}
			      
		if(!VCS_GetAllDigitalInputs(g_pKeyHandle,1,&pInputs_x,&ulErrorCode))
		{
	
			DisplayError("PU13",ulErrorCode);return false;
		}
		    
		if(!VCS_GetAllDigitalInputs(g_pKeyHandle,2,&pInputs_y,&ulErrorCode))
		{
	
			DisplayError("PU14",ulErrorCode);return false;
		}
		  
		if(!VCS_GetAllDigitalInputs(g_pKeyHandle,3,&pInputs_z,&ulErrorCode))
		{
	
			DisplayError("PU15",ulErrorCode);return false;
		} 
	//	ROS_INFO_STREAM("pinputxyz "<<pInputs_x << pInputs_y << pInputs_z);
		if(pInputs_x == 4 )
		{
			xhomeflag == true;
			
		//	ROS_INFO_STREAM("X-axis is at Home position"); 
		//	ROS_INFO_STREAM("x home position counts "<<xhomepositioncounts);
		}
		if(pPositionIsCounts_x > xhomepositioncounts)
		{
			xhomeflag == false;
		}
		if(pInputs_x == 2)
		{
			if(homingflag == true)
			{
				    xextpositionmm = pPositionIsCounts_x/10248;
				    xextpositioncounts = pPositionIsCounts_x;
				    xtotaltravel = xextpositionmm - xhomepositionmm;
				    ROS_INFO_STREAM("x extreme position counts " <<xextpositioncounts);
				   
			}
			  if(!VCS_SetQuickStopState(g_pKeyHandle,1,&ulErrorCode))
			  {
		    	  DisplayError("PU16",ulErrorCode);
			      return false;
			  } 
			  ROS_INFO_STREAM("X-axis is at extreme position");
		}
	
		if(pInputs_y == 4)
		{
			 yhomeflag == true;
		//	 ROS_INFO_STREAM("Y-axis is at home position"); 
		//	 ROS_INFO_STREAM("y home position counts "<<yhomepositioncounts);
		}
		if(pPositionIsCounts_y > yhomepositioncounts)
		{
			yhomeflag == false;
		}
		if(pInputs_y == 2)
		{
			if(homingflag == true)
			{
				    yextpositionmm = pPositionIsCounts_y/10248;
				    yextpositioncounts = pPositionIsCounts_y;
				    ytotaltravel = yextpositionmm - yhomepositionmm;
				    ROS_INFO_STREAM("y extreme position counts " <<yextpositioncounts);
				    
			}		
	  		if(!VCS_SetQuickStopState(g_pKeyHandle,2,&ulErrorCode))
			  {
		    	  DisplayError("PU17",ulErrorCode);
			      return false;
			  } 
			  ROS_INFO_STREAM("Y-axis is at Extreme position");
		}

		if(pInputs_z == 4)
		{
			 
			 	if(starthomingflag == true && ohomeflag != true)
				{
				    if(!VCS_ActivateProfileVelocityMode(g_subKeyHandle,4,&ulErrorCode))
				    {
				      DisplayError("H13",ulErrorCode);
				      return false;
				    }
				    if(!VCS_SetVelocityProfile(g_subKeyHandle,4,2000,2000,&ulErrorCode))
				    {
				      DisplayError("H14",ulErrorCode);
				      return false;
				    }
				    if(!VCS_SetEnableState(g_subKeyHandle,4,&ulErrorCode))
				    {
				      DisplayError("H15",ulErrorCode);
				      return false;
				    } 
				    if(!VCS_MoveWithVelocity(g_subKeyHandle,4,80,&ulErrorCode))
				    {
				      DisplayError("H19",ulErrorCode);
				      return false;
				    } 
				    ostartrefflag = true;
				 }	 
			    zhomeflag == true;
			    starthomingflag == false;
		//	 ROS_INFO_STREAM("Z-axis is at Home position"); 
		//	 ROS_INFO_STREAM("z home position counts "<<zhomepositioncounts);
		}
		if(pPositionIsCounts_z > zhomepositioncounts)
		{
			zhomeflag == false;
			
		}
		if(pInputs_z == 2)
		{
			if(homingflag == true)
			{
				    zextpositionmm = pPositionIsCounts_z/10248;
				    zextpositioncounts = pPositionIsCounts_z;
				    ztotaltravel = zextpositionmm - zhomepositionmm;
				    ROS_INFO_STREAM("z extreme position counts " <<zextpositioncounts);
			}
			  if(!VCS_SetQuickStopState(g_pKeyHandle,3,&ulErrorCode))
			  {
		    	  DisplayError("PU18",ulErrorCode);
			      return false;
			  } 
			  ROS_INFO_STREAM("z-axis is at Extreme position");
		}

		// Current of all three axis of gripper i.e. o,g,r is monitored here
		if(VCS_GetCurrentIsAveragedEx(g_pKeyHandle,1,&x_pCurrentIsAveraged,&ulErrorCode) == 0)
		{
		   DisplayError("PU19",ulErrorCode);
		   return false;
		}
		if(VCS_GetCurrentIsAveragedEx(g_pKeyHandle,2,&y_pCurrentIsAveraged,&ulErrorCode) == 0)
		{
		   DisplayError("PU20",ulErrorCode);
		   return false;
		}
		if(VCS_GetCurrentIsAveragedEx(g_pKeyHandle,3,&z_pCurrentIsAveraged,&ulErrorCode) == 0)
		{
		   DisplayError("PU21",ulErrorCode);
		   return false;
		}
		if(VCS_GetCurrentIsAveragedEx(g_subKeyHandle,4,&o_pCurrentIsAveraged,&ulErrorCode) == 0)
		{
		   DisplayError("PU22",ulErrorCode);
		   return false;
		} //ROS_INFO_STREAM("orientation axis current: "<<o_pCurrentIsAveraged<<" mA");
		if(VCS_GetCurrentIsAveragedEx(g_subKeyHandle,5,&g_pCurrentIsAveraged,&ulErrorCode) == 0)
		{
		   DisplayError("PU23",ulErrorCode);
		   return false;
		} //ROS_INFO_STREAM("gripper axis current: "<<g_pCurrentIsAveraged<<" mA");
		if(VCS_GetCurrentIsAveragedEx(g_subKeyHandle,6,&r_pCurrentIsAveraged,&ulErrorCode) == 0)
		{
		   DisplayError("PU24",ulErrorCode);
		   return false;
		} //ROS_INFO_STREAM("rotation axis current: "<<r_pCurrentIsAveraged<<" mA");
		
		
		Position.Position_x = abs((float(pPositionIsCounts_x) - float(xhomepositioncounts))/float(10248.4));
		Position.Position_y = abs((float(pPositionIsCounts_y) - float(yhomepositioncounts))/float(10248.4));
		Position.Position_z = abs((float(pPositionIsCounts_z) - float(zhomepositioncounts))/float(10248.4));
		Position.Position_o = (float(pPositionIsCounts_o)* (float(360.0/380218.75)));
		Position.Position_g = float(pPositionIsCounts_g);
		Position.Position_r = ((float(pPositionIsCounts_r))*(float(360.0/330625.0)));
		Position.Current_x = float(x_pCurrentIsAveraged);
		Position.Current_y = float(y_pCurrentIsAveraged);
		Position.Current_z = float(z_pCurrentIsAveraged);
		Position.Current_o = float(o_pCurrentIsAveraged);
		Position.Current_g = float(g_pCurrentIsAveraged);
		Position.Current_r = float(r_pCurrentIsAveraged);
		status_publisher.publish(Position);
			
		// homing of o axis performed at horizontal position
		
		if((abs(o_pCurrentIsAveraged))>=850)
		{
			if(!VCS_SetQuickStopState(g_subKeyHandle,4,&ulErrorCode))
		  	{
			   ROS_INFO_STREAM("E: PU37"); 
			   return false;
			} 
			ROS_INFO_STREAM("E: Orientation Stucked");
		}
		
		if(ostartrefflag == true)
		{	
			if(abs(o_pCurrentIsAveraged) > 700)//||o_pCurrentIsAveraged>=600)
			{
			  if(!VCS_SetQuickStopState(g_pKeyHandle,4,&ulErrorCode))
			  {
				     DisplayError("E: PU25",ulErrorCode);
				     return false;
			  } 
			  if(!VCS_ActivateHomingMode(g_pKeyHandle,4,&ulErrorCode))
			  {
				 DisplayError("E: PU26",ulErrorCode);
				 return false;
			  }
			/*  if(!VCS_SetEnableState(g_pKeyHandle,4,&ulErrorCode))
			  {
				 DisplayError("PU27",ulErrorCode);
				 return false;
			  }
			  */
			  if(!VCS_FindHome(g_subKeyHandle,4,HM_ACTUAL_POSITION,&ulErrorCode))
			  {
			      	DisplayError("E: PU28",ulErrorCode);
			      	return false;
			  }
			  
			 ohomeflag = true;
			}	
			
			if(ohomeflag == true)
			{
				if(!VCS_DefinePosition(g_subKeyHandle,4,95055,&ulErrorCode))
				{
					DisplayError("E: PU29",ulErrorCode);
					return false;
				}
				if(!VCS_WaitForHomingAttained(g_subKeyHandle,4,1000,&ulErrorCode))
				{
					DisplayError("E: PU40",ulErrorCode);
					return false;
				}
				//ohomeflag = true;			 
			  	ROS_INFO_STREAM("INFO: Orientation axis has been homed"<<ostartrefflag);
				ostartrefflag = false;
			}		
		}
		
		if((abs(g_pCurrentIsAveraged))>=700)
		{
			if(!VCS_SetQuickStopState(g_subKeyHandle,5,&ulErrorCode))
		  	{
			   ROS_INFO_STREAM("E: PU30"); 
			   return false;
			} 
			ROS_INFO_STREAM("E: Gripper Stucked");
		}
		
		if(gstartrefflag == true)
		{	
			if(g_pCurrentIsAveraged >=450)//||o_pCurrentIsAveraged>=600)
			{
			  if(!VCS_SetQuickStopState(g_pKeyHandle,5,&ulErrorCode))
			  {
				     DisplayError("E: PU31",ulErrorCode);
				     return false;
			  } 
			  if(!VCS_ActivateHomingMode(g_pKeyHandle,5,&ulErrorCode))
			  {
				 DisplayError("E: PU32",ulErrorCode);
				 return false;
			  }
			/*  if(!VCS_SetEnableState(g_pKeyHandle,5,&ulErrorCode))
			  {
				 DisplayError("PU33",ulErrorCode);
				 return false;
			  }
			  */
			  if(!VCS_FindHome(g_subKeyHandle,5,HM_ACTUAL_POSITION,&ulErrorCode))
			  {
			      	return false;
			  }
			  gstartrefflag = false;
			  if(!VCS_DefinePosition(g_subKeyHandle,5,0,&ulErrorCode))
			  {
				DisplayError("E: PU35",ulErrorCode);
				return false;
			  }
			  if(!VCS_WaitForHomingAttained(g_subKeyHandle,5,1000,&ulErrorCode))
			  {
					DisplayError("E: PU41",ulErrorCode);
					return false;
			  }
			  ghomeflag = true;
			  Position.GR_g = 1;gripedflag = true;
			  ROS_INFO_STREAM("INFO: Gripper has been homed in close position");
			 
			}
					
		}
		
		if(ghomeflag == true)
		{
			if(pPositionIsCounts_g > 10000)
			{
				if(!VCS_SetQuickStopState(g_pKeyHandle,5,&ulErrorCode))
			  	{
				     DisplayError("E: PU38",ulErrorCode);
				     return false;
			  	} 
			  	ROS_INFO_STREAM("INFO: Gripper can not close beyond this position");
			}
		}
		
		if(automaticjobflag == true)
		{
		   //  ROS_INFO_STREAM("demanded position of rotation1 = "<<(overlappedpos_r-1000));
	      	    // ROS_INFO_STREAM("current position of rotation1 = "<<pPositionIsCounts_r);
		    if(pPositionIsCounts_r >= (overlappedpos_r-10000))
		     {
		     	if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,2,14,0,1,0,&ulErrorCode))
			{
			      DisplayError("PU36",ulErrorCode);
			      return false;
			}
			ROS_INFO_STREAM("INFO: Automatic job is complete");
			/*ros::Duration(3.0).sleep();
			if(!VCS_SetQuickStopState(g_pKeyHandle,6,&ulErrorCode))
		    	{
			     	DisplayError("PU37",ulErrorCode);
				return false;
		  	}*/
		  	  automaticjobflag = false;
		     }
		     
		     
		}
		
		if(grippingflag == true)
		{
			Position.GR_g = 2;
			if(g_pCurrentIsAveraged >=300)
			{
				  if(!VCS_SetQuickStopState(g_pKeyHandle,5,&ulErrorCode))
				  {
					     DisplayError("E: PU39",ulErrorCode);
					     return false;
				  } 
				  gripedflag = true; Position.GR_g = 1;
				  grippingflag = false;
				  releasingflag=false;
			}
			
		}
		if(releasingflag == true)
		{
			Position.GR_g = 3;
			if(pPositionIsCounts_g <=-79000)
			{
				releasedflag = true; Position.GR_g = 0;
				releasingflag = false;
				grippingflag=false;
			}
			
		}
		if((Position.Position_x < 1.0) && (Position.Position_y < 1.0) && (Position.Position_z < 1.0))
		{
			parkingflag = true;
		}
		else
		{
			parkingflag = false;
		}
	return true;
	}
	
	// fault update topic

	bool fault_update()
	{
		if(!VCS_GetFaultState(g_pKeyHandle, 1, &x_axis_state, &ulErrorCode ))
		{
		  DisplayError("FU01",ulErrorCode);
			return false;
		}
		if(!VCS_GetFaultState(g_pKeyHandle, 2, &y_axis_state, &ulErrorCode ))
		{
		  DisplayError("FU02",ulErrorCode);
			return false;
		}
		if(!VCS_GetFaultState(g_pKeyHandle, 3, &z_axis_state, &ulErrorCode ))
		{
		  DisplayError("FU03",ulErrorCode); 
			return false;
		}
		if(!VCS_GetFaultState(g_pKeyHandle, 4, &orient_axis_state, &ulErrorCode ))
		{
		  DisplayError("FU04",ulErrorCode);
			return false;
		}
		if(!VCS_GetFaultState(g_pKeyHandle, 5, &grip_axis_state, &ulErrorCode ))
		{
		  DisplayError("FU05",ulErrorCode); 
			return false;
		}
		if(!VCS_GetFaultState(g_pKeyHandle, 6, &rot_axis_state, &ulErrorCode ))
		{
		  DisplayError("FU06",ulErrorCode); 
			return false;
		}
		
		State.x = x_axis_state;
		State.y = y_axis_state; 
		State.z = z_axis_state; 
		State.o = orient_axis_state;
		State.g = grip_axis_state;
		State.r = rot_axis_state;
		state_publisher.publish(State);
	return true;	
	}

	// clear fault service
	
	bool clearfault(std_srvs::Trigger::Request& request, std_srvs::Trigger::Response& response)
	{
	    if(!clear_fault())
	    {
				DisplayError("CF01",ulErrorCode);response.success = false;
				return false; 
	    }
	    response.success = true;
	    return true;
        }
	
	// homing service

	bool homing(std_srvs::Trigger::Request& request, std_srvs::Trigger::Response& response)
	{
	    
	    homingflag = false;
	    xaxismovementflag = false;
	    yaxismovementflag = false;
	    zaxismovementflag = false;
	    xhomeflag = false;
	    yhomeflag = false;
	    zhomeflag = false;
	    ohomeflag = false;
	    ostartrefflag = false;
	    ghomeflag = false;
	    gstartrefflag = false;
	    
	    // Move all axis to safe limit 
	    
	  
	    if(!VCS_ActivateProfileVelocityMode(g_subKeyHandle,4,&ulErrorCode))
	    {
	      DisplayError("H30",ulErrorCode);
	      return false;
	    }
	    if(!VCS_SetVelocityProfile(g_subKeyHandle,4,800,800,&ulErrorCode))
	    {
	      DisplayError("H31",ulErrorCode);
	      return false;
	    }
	    if(!VCS_SetEnableState(g_subKeyHandle,4,&ulErrorCode))
	    {
	      DisplayError("H32",ulErrorCode);
	      return false;
	    } 
	    
	    if(!VCS_ActivateProfileVelocityMode(g_subKeyHandle,5,&ulErrorCode))
	    {
	      DisplayError("H33",ulErrorCode);
	      return false;
	    }
	    if(!VCS_SetVelocityProfile(g_subKeyHandle,5,800,800,&ulErrorCode))
	    {
	      DisplayError("H34",ulErrorCode);
	      return false;
	    }
	    if(!VCS_SetEnableState(g_subKeyHandle,5,&ulErrorCode))
	    {
	      DisplayError("H35",ulErrorCode);
	      return false;
	    } 
	    
	
	    if(!VCS_MoveWithVelocity(g_subKeyHandle,4,-100,&ulErrorCode))
	    {
	      DisplayError("H42",ulErrorCode);
	      return false;
	    }
	    if(!VCS_MoveWithVelocity(g_subKeyHandle,5,-80,&ulErrorCode))
	    {
	      DisplayError("H43",ulErrorCode);
	      return false;
	    }
	
	    ros::Duration(2.0).sleep();
	    
	  
	    if(!VCS_SetQuickStopState(g_pKeyHandle,4,&ulErrorCode))
	    {
	    	DisplayError("QS04",ulErrorCode);response.success = false;
		return false;
	    }

	    if(!VCS_SetQuickStopState(g_pKeyHandle,5,&ulErrorCode))
	    {
	     	DisplayError("QS05",ulErrorCode);response.success = false;
		return false;
	    }
  
  	    ROS_INFO_STREAM("INFO: Safe Limit reached, Starting homing now");
  	    
	    // Node 1 homing

	    if(!VCS_ActivateHomingMode(g_pKeyHandle,1,&ulErrorCode))
	    {
	      DisplayError("H01",ulErrorCode);response.success = false;
	      return false;
	    }
	    if(!VCS_SetHomingParameter(g_pKeyHandle,1,1000,800,50,0,0,xhomepositioncounts,&ulErrorCode))
	    {
	      DisplayError("H02",ulErrorCode);ROS_INFO_STREAM("keyhandle " << ulErrorCode);response.success = false;
	      return false;
	    }
	    
	    if(!VCS_SetEnableState(g_pKeyHandle,1,&ulErrorCode))
	    {
	      DisplayError("H03",ulErrorCode);response.success = false;
	      return false;
	    }

   
	    // Node 2 homing
	    
	    if(!VCS_ActivateHomingMode(g_pKeyHandle,2,&ulErrorCode))
	    {
	      DisplayError("H04",ulErrorCode);response.success = false;
	      return false;
	    }

	    if(!VCS_SetHomingParameter(g_pKeyHandle,2,1000,800,50,0,0,yhomepositioncounts,&ulErrorCode))
	    {
	      DisplayError("H05",ulErrorCode);response.success = false;
	      return false;
	    }

	    if(!VCS_SetEnableState(g_pKeyHandle,2,&ulErrorCode))
	    {
	      DisplayError("H06",ulErrorCode);response.success = false;
	      return false;
	    }

	    // Node 3 homing
	    
	    if(!VCS_ActivateHomingMode(g_pKeyHandle,3,&ulErrorCode))
	    {
	      DisplayError("H07",ulErrorCode);response.success = false;
	      return false;
	    }

	    if(!VCS_SetHomingParameter(g_pKeyHandle,3,1000,800,50,0,0,zhomepositioncounts,&ulErrorCode))
	    {
	      DisplayError("H08",ulErrorCode);response.success = false;
	      return false;
	    }

	    if(!VCS_SetEnableState(g_pKeyHandle,3,&ulErrorCode))
	    {
	      DisplayError("H09",ulErrorCode);response.success = false;
	      return false;
	    }
		
            // start homing of all axis

	    if(!VCS_FindHome(g_pKeyHandle,1,27,&ulErrorCode))
	    {
	      DisplayError("H10",ulErrorCode);response.success = false;
	      return false;
	    }

	    if(!VCS_FindHome(g_pKeyHandle,2,27,&ulErrorCode))
	    {
	      DisplayError("H11",ulErrorCode);response.success = false;
	      return false;
	    }
	    
	    if(!VCS_FindHome(g_pKeyHandle,3,27,&ulErrorCode))
	    {
	      DisplayError("H12",ulErrorCode);response.success = false;
	      return false;
	    }
	    
	 
	    if(!VCS_ActivateProfileVelocityMode(g_subKeyHandle,5,&ulErrorCode))
	    {
	      DisplayError("H16",ulErrorCode);
	      return false;
	    }
	    if(!VCS_SetVelocityProfile(g_subKeyHandle,5,-300,800,&ulErrorCode))
	    {
	      DisplayError("H17",ulErrorCode);
	      return false;
	    }
	    if(!VCS_SetEnableState(g_subKeyHandle,5,&ulErrorCode))
	    {
	      DisplayError("H18",ulErrorCode);
	      return false;
	    } 
	      
	    
	    if(!VCS_MoveWithVelocity(g_subKeyHandle,5,80,&ulErrorCode))
	    {
	      DisplayError("H20",ulErrorCode);
	      return false;
	    }
	    
	    ros::Duration(2.0).sleep();
	    gstartrefflag = true;
	    homingflag = true;
	    starthomingflag = true;  
	    response.success = true;
	    return true;
 
        }
	// exterme position service
	bool extpos(std_srvs::Trigger::Request& request, std_srvs::Trigger::Response& response)
	{
	    if(!PVM(900,900,900,0,0,0))
	    {
				DisplayError("EP01",ulErrorCode);response.success = false;
				return false; 
	    }
			response.success = true;
			return true;
	}
	// quickstop service
	
	bool quickstop(std_srvs::Trigger::Request& request, std_srvs::Trigger::Response& response)
	{
	    if(!VCS_SetQuickStopState(g_pKeyHandle,1,&ulErrorCode))
	    {
	    	DisplayError("QS01",ulErrorCode);response.success = false;
		return false;
	    }

	    if(!VCS_SetQuickStopState(g_pKeyHandle,2,&ulErrorCode))
	    {
	     	DisplayError("QS02",ulErrorCode);response.success = false;
		return false;
	    }

	    if(!VCS_SetQuickStopState(g_pKeyHandle,3,&ulErrorCode))
	    {
	    	DisplayError("QS03",ulErrorCode);response.success = false;
		return false;
	    }
    	    
	    if(!VCS_SetQuickStopState(g_pKeyHandle,4,&ulErrorCode))
	    {
	    	DisplayError("QS04",ulErrorCode);response.success = false;
		return false;
	    }

	    if(!VCS_SetQuickStopState(g_pKeyHandle,5,&ulErrorCode))
	    {
	     	DisplayError("QS05",ulErrorCode);response.success = false;
		return false;
	    }

	    if(!VCS_SetQuickStopState(g_pKeyHandle,6,&ulErrorCode))
	    {
	    	DisplayError("QS06",ulErrorCode);;response.success = false;
		return false;
	    }
    
	    response.success = true;
	    return true;
        }
	
	// move axis in profile velocity mode ogr need to be added
	bool PVM(signed int vel_x, signed int vel_y, signed int vel_z, signed int vel_o, signed int vel_g, signed int vel_r)
	{
		ROS_INFO_STREAM("INFO: I am in PVM"); 
		if(!VCS_ActivateProfileVelocityMode(g_pKeyHandle,1,&ulErrorCode))
		{
		  DisplayError("PVM01",ulErrorCode);
		  return false;
		}
		if(!VCS_SetVelocityProfile(g_pKeyHandle,1,4000,4000,&ulErrorCode))
		{
		  DisplayError("PVM02",ulErrorCode);
		  return false;
		}
		if(!VCS_SetEnableState(g_pKeyHandle,1,&ulErrorCode))
		{
		  DisplayError("PVM03",ulErrorCode);
		  return false;
		}   
	      
		if(!VCS_ActivateProfileVelocityMode(g_pKeyHandle,2,&ulErrorCode))
		{
		  DisplayError("PVM04",ulErrorCode);
		  return false;
		}
		if(!VCS_SetVelocityProfile(g_pKeyHandle,2,4000,4000,&ulErrorCode))
		{
		  DisplayError("PVM05",ulErrorCode);;
		  return false;
		}
		if(!VCS_SetEnableState(g_pKeyHandle,2,&ulErrorCode))
		{
		  DisplayError("PVM06",ulErrorCode);
		  return false;
		}   
	       
		if(!VCS_ActivateProfileVelocityMode(g_pKeyHandle,3,&ulErrorCode))
		{
		  DisplayError("PVM07",ulErrorCode);
		  return false;
		}
		if(!VCS_SetVelocityProfile(g_pKeyHandle,3,4000,4000,&ulErrorCode))
		{
		  DisplayError("PVM08",ulErrorCode);
		  return false;
		}
		if(!VCS_SetEnableState(g_pKeyHandle,3,&ulErrorCode))
		{
		  DisplayError("PVM09",ulErrorCode);
		  return false;
		}  
		 
		if(!VCS_ActivateProfileVelocityMode(g_pKeyHandle,4,&ulErrorCode))
		{
		  DisplayError("PVM10",ulErrorCode);
		  return false;
		}
		if(!VCS_SetVelocityProfile(g_pKeyHandle,4,4000,4000,&ulErrorCode))
		{
		  DisplayError("PVM11",ulErrorCode);
		  return false;
		}
		if(!VCS_SetEnableState(g_pKeyHandle,4,&ulErrorCode))
		{
		  DisplayError("PVM12",ulErrorCode);
		  return false;
		}  
		 
		if(!VCS_ActivateProfileVelocityMode(g_pKeyHandle,5,&ulErrorCode))
		{
		  DisplayError("PVM13",ulErrorCode);
		  return false;
		}
		if(!VCS_SetVelocityProfile(g_pKeyHandle,5,4000,4000,&ulErrorCode))
		{
		  DisplayError("PVM14",ulErrorCode);
		  return false;
		}
		if(!VCS_SetEnableState(g_pKeyHandle,5,&ulErrorCode))
		{
		  DisplayError("PVM15",ulErrorCode);
		  return false;
		}   
		
		if(!VCS_ActivateProfileVelocityMode(g_pKeyHandle,6,&ulErrorCode))
		{
		  DisplayError("PVM16",ulErrorCode);
		  return false;
		}
		if(!VCS_SetVelocityProfile(g_pKeyHandle,6,4000,4000,&ulErrorCode))
		{
		  DisplayError("PVM17",ulErrorCode);
		  return false;
		}
		if(!VCS_SetEnableState(g_pKeyHandle,6,&ulErrorCode))
		{
		  DisplayError("PVM18",ulErrorCode);
		  return false;
		}   
		
		
		if(!VCS_MoveWithVelocity(g_pKeyHandle,1,vel_x,&ulErrorCode))
		{
		  DisplayError("PVM19",ulErrorCode);
		  return false;
		}		
		if(!VCS_MoveWithVelocity(g_pKeyHandle,2,vel_y,&ulErrorCode))
		{
		  DisplayError("PVM20",ulErrorCode);
		  return false;
		}
		if(!VCS_MoveWithVelocity(g_pKeyHandle,3,vel_z,&ulErrorCode))
		{
		  DisplayError("PVM21",ulErrorCode);
		  return false;
		}
		if(!VCS_MoveWithVelocity(g_pKeyHandle,4,vel_o,&ulErrorCode))
		{
		  DisplayError("PVM22",ulErrorCode);
		  return false;
		}	
		if(!VCS_MoveWithVelocity(g_pKeyHandle,5,vel_g,&ulErrorCode))
		{
		  DisplayError("PVM23",ulErrorCode);
		  return false;
		}	
		if(!VCS_MoveWithVelocity(g_pKeyHandle,6,vel_r,&ulErrorCode))
		{
		  DisplayError("PVM24",ulErrorCode);
		  return false;
		}
	return true;	
	}
	// move axis in profile position mode ogr need to be added
	bool PPM(signed int pos_x, signed int pos_y, signed int pos_z, signed int pos_o, signed int pos_g, signed int pos_r)
	{
	      ROS_INFO_STREAM("INFO: I am in PPM function with pos_o="<<pos_o<<"posy="<<pos_y<<"posz="<<pos_z);
	      if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,1,&ulErrorCode))
	      {
		DisplayError("PPM01",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetPositionProfile(g_pKeyHandle,1,1000,500,500,&ulErrorCode))//x-axis
	      {
		DisplayError("PPM02",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,1,&ulErrorCode))
	      {
		DisplayError("PPM03",ulErrorCode);
		return false;
	      }
	      
	      if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,2,&ulErrorCode))//y-axis
	      {
		DisplayError("PPM04",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetPositionProfile(g_pKeyHandle,2,1000,500,500,&ulErrorCode))
	      {
		DisplayError("PPM05",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,2,&ulErrorCode))
	      {
		DisplayError("PPM06",ulErrorCode);
		return false;
	      }

	      if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,3,&ulErrorCode))
	      {
		DisplayError("PPM07",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetPositionProfile(g_pKeyHandle,3,1000,500,500,&ulErrorCode))//z-axis
	      {
		DisplayError("PPM08",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,3,&ulErrorCode))
	      {
		DisplayError("PPM09",ulErrorCode);
		return false;
	      }

	      if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,4,&ulErrorCode))
	      {
		DisplayError("PPM10",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetPositionProfile(g_pKeyHandle,4,100,2000,2000,&ulErrorCode))//z-axis
	      {
		DisplayError("PPM11",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,4,&ulErrorCode))
	      {
		DisplayError("PPM12",ulErrorCode);
		return false;
	      }


              if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,5,&ulErrorCode))
	      {
		DisplayError("PPM13",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetPositionProfile(g_pKeyHandle,5,200,2000,2000,&ulErrorCode))//z-axis
	      {
		DisplayError("PPM14",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,5,&ulErrorCode))
	      {
		DisplayError("PPM15",ulErrorCode);
		return false;
	      }
	      
	      if(!VCS_ActivateProfilePositionMode(g_pKeyHandle,6,&ulErrorCode))
	      {
		DisplayError("PPM16",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetPositionProfile(g_pKeyHandle,6,150,2000,2000,&ulErrorCode))//z-axis
	      {
		DisplayError("PPM17",ulErrorCode);
		return false;
	      }
	      if(!VCS_SetEnableState(g_pKeyHandle,6,&ulErrorCode))
	      {
		DisplayError("PPM18",ulErrorCode);
		return false;
	      }
	      
	      	      
	      if(!VCS_MoveToPosition(g_pKeyHandle,1,pos_x,true,true,&ulErrorCode))
	      {
		DisplayError("PPM19",ulErrorCode);
		return false;
	      }
	      if(!VCS_MoveToPosition(g_pKeyHandle,2,pos_y,true,true,&ulErrorCode))
	      {
		DisplayError("PPM20",ulErrorCode);
		return false;
	      }
	      if(!VCS_MoveToPosition(g_pKeyHandle,3,pos_z,true,true,&ulErrorCode))
	      {
		DisplayError("PPM21",ulErrorCode);
		return false;
	      }
	      if(!VCS_MoveToPosition(g_pKeyHandle,4,pos_o,true,true,&ulErrorCode))
	      {
		DisplayError("PPM22",ulErrorCode);
		return false;
	      }
	      if(!VCS_MoveToPosition(g_pKeyHandle,5,pos_g,true,true,&ulErrorCode))
	      {
		DisplayError("PPM23",ulErrorCode);
		return false;
	      }
	      if(!VCS_MoveToPosition(g_pKeyHandle,6,pos_r,true,true,&ulErrorCode))
	      {
		DisplayError("PPM24",ulErrorCode);
		return false;
	      }
	return true;
	}

	// movement service
	
	bool axismovement(ases_mc_pkg1::axis_motion::Request& request, ases_mc_pkg1::axis_motion::Response& response)
	{
	    if(!clear_fault())
	    {
		DisplayError("AM01",ulErrorCode);
		return false; 
	    }
	    ROS_INFO_STREAM("The selected mode [PPM/PVM] is: "<< request.Mode);
	       
	    unsigned int pos_x;
	    unsigned int pos_y;
	    unsigned int pos_z;
	    unsigned int pos_o;
	    unsigned int pos_g;
	    unsigned int pos_r;
	    unsigned int vel_x;
	    unsigned int vel_y;
	    unsigned int vel_z;
	    unsigned int vel_o;
	    unsigned int vel_g;
	    unsigned int vel_r;
	    if(request.Mode == "PPM")
	    {
		    if(homingflag == true)
		    {
		    /*  ROS_INFO_STREAM(" x home position counts = "<<xhomepositioncounts);//xhomepositioncounts);
		      ROS_INFO_STREAM(" y home position counts = "<<yhomepositioncounts);
		      ROS_INFO_STREAM(" z home position counts = "<<zhomepositioncounts);
		      ROS_INFO_STREAM("x ext position counts = "<<xextpositioncounts);
		      ROS_INFO_STREAM("y ext position counts = "<<yextpositioncounts);
		      ROS_INFO_STREAM("z ext position counts = "<<zextpositioncounts);*/
		      
		      // Conversion from mm to qc for each axis

		      // Node 1
		      
		      if(request.position_x >= 0)
		      {
		      	pos_x = ((request.position_x)*10248) + xhomepositioncounts;
			ROS_INFO_STREAM("x demanded position counts = "<<pos_x);
		   
				if(pos_x<xhomepositioncounts) 
				{
					if(xhomeflag == true)
					{
						ROS_INFO_STREAM("The x-axis position entered is less than the minimum limit");
						DisplayError("AM03",ulErrorCode);				
						response.success = false;
						return false;
					}
					else
					{ 
						pos_x = xhomepositioncounts + 350;
						ROS_INFO_STREAM("The x-axis position entered is less than the minimum limit");
					}
				}
		      }
		      else 
		      {
		        pos_x = pPositionIsCounts_x;
			ROS_INFO_STREAM("The x-axis cannot move in this direction");
		      }

		      	      
		      // Node 2
		      
		      if(request.position_y >= 0)
		      {
		      		pos_y = (request.position_y*10248) + yhomepositioncounts;
		      		ROS_INFO_STREAM("y demanded position counts = "<<pos_y);
				if(pos_y<=yhomepositioncounts) 
				{
					if(yhomeflag == true)
					{
						ROS_INFO_STREAM("The y-axis position entered is less than the minimum limit");
						DisplayError("AM02",ulErrorCode);				
						response.success = false;
						return false;
					}
					else
					{ 
						pos_y = yhomepositioncounts + 350;
						ROS_INFO_STREAM("The y-axis position entered is less than the minimum limit");
					}
				}
			
				
		      }
		      else
		      {
		      	pos_y = pPositionIsCounts_y;
			ROS_INFO_STREAM("The y-axis cannot move in this direction");
		      }

		      // Node 3
		      
		      if(request.position_z >= 0)
		      {
		      		pos_z = (request.position_z*10248) + zhomepositioncounts;
		      		ROS_INFO_STREAM("z demanded position counts = "<<pos_z);
				if(pos_z<=zhomepositioncounts) 
				{
					if(zhomeflag == true)
					{
						ROS_INFO_STREAM("The z-axis position entered is less than the minimum limit");
						DisplayError("AM04",ulErrorCode);		
						response.success = false;
						return false;
					}
					else
					{ 
						pos_z = zhomepositioncounts + 350;
						ROS_INFO_STREAM("The z-axis position entered is less than the minimum limit");
					}
				}
			
		      }
		      else
		      {
		      	pos_z = pPositionIsCounts_z;
			ROS_INFO_STREAM("The z-axis cannot move in this direction");
		      }

		  
//ROS_INFO_STREAM("orientation logic="<<(((request.position_o) != -1.0 || (request.position_o) < -3.0) && (request.position_o) > 90.0));
//ROS_INFO_STREAM("parkingflag="<<parkingflag);
		if((request.position_o) == -1.0 || (request.position_o) < -3.0 || (request.position_o) > 90.0)
			{
				pos_o = pPositionIsCounts_o;
				ROS_INFO_STREAM("INFO: Cannot move orientation the position required is out of limit or stop position");
			}
			else 
			{
				if(parkingflag == true)
				{
					//ROS_INFO_STREAM("request.position="<<request.position_o);
				
					if(ohomeflag == true)
					{
						ROS_INFO_STREAM("pos_o="<<pos_o);
						pos_o = (request.position_o * (380218.75/360)) ;
						
						
					}
				}
				else
				{
					//ROS_INFO_STREAM("pos_o="<<pos_o);
					pos_o = pPositionIsCounts_o;
					ROS_INFO_STREAM("INFO: First click parking button than move orientation");
				}

			}
			if((request.position_g) != -1.0)
			{
				if(ghomeflag == true)
				{
					if((request.position_g) <=1000)
					{
						pos_g = request.position_g ;
					}
					else
					{
						ROS_INFO_STREAM("The position entered is out of bound. The gripper axis can move within (0-600000) qc");
					}
				}
			}
			else
			{
				pos_g = pPositionIsCounts_g;
			}
			if((request.position_r) != -1.0)
			{
				pos_r = (request.position_r * (330625/360))  ;
			}
			else
			{
				pos_r = pPositionIsCounts_r;
			}
			
			      if(!PPM(pos_x,pos_y,pos_z,pos_o,pos_g,pos_r))
			      {
							DisplayError("AM05",ulErrorCode); response.success = false;
							return false; 
			      }
		      } else
		      {
			    	ROS_INFO_STREAM("INFO: Perform homing first"); 
			    	response.success = false;
		      }
		}
		   
	    
	    
		    if(request.Mode == "PVM")
		    {
					vel_x = request.velocity_x;
					vel_y = request.velocity_y;
					vel_z = request.velocity_z;
					vel_o = request.velocity_o;
					vel_g = request.velocity_g;
					vel_r = request.velocity_r;
				ROS_INFO_STREAM("INFO: Start moving in PVM"); 
					if(!PVM(vel_x,vel_y,vel_z,vel_o,vel_g,vel_r))
					{
						DisplayError("AM05",ulErrorCode);response.success = false;
						return false; 
					}
		    } 
		    response.success = true;
	    
	    
	    return true;
	  }
	
	// reset service
	bool reset(std_srvs::Trigger::Request& request, std_srvs::Trigger::Response& response)
	{
		/*if(!VCS_ResetDevice(g_pKeyHandle,3,&ulErrorCode))
		{
			ROS_INFO_STREAM("E: R01");response.success = false;
	      		return false;
		}
		if(!VCS_ResetDevice(g_pKeyHandle,2,&ulErrorCode))
		{
			ROS_INFO_STREAM("E: R02");response.success = false;
	      		return false;
		}
		if(!VCS_ResetDevice(g_pKeyHandle,1,&ulErrorCode))
		{
			ROS_INFO_STREAM("E: R03");response.success = false;
	      		return false;
		}*/
		if(!VCS_SendNMTService(g_pKeyHandle,0,129,&ulErrorCode))
		{
		  DisplayError("R01",ulErrorCode);
		  return false;
		}
		
		 if(!clear_fault())
		 {
			DisplayError("R02",ulErrorCode);
			return false; 
		 }
		    
        homingflag= false;
	response.success = true;
	ROS_INFO_STREAM("Device Successfully Reset ");
	return true;
	}
	
	// laser control service
	bool lasercontrol(ases_mc_pkg1::laser_control::Request& request, ases_mc_pkg1::laser_control::Response& response)
	{
		 if(request.cmd_lasercontrol == "ON")
	    	 {
			if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,1,15,1,1,0,&ulErrorCode))
			{
			      DisplayError("LC01",ulErrorCode);response.success = false;
			      return false;
			}
		 }
		 else if(request.cmd_lasercontrol == "OFF")
	    	 {
			if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,1,15,0,1,0,&ulErrorCode))
			{
			      DisplayError("LC02",ulErrorCode); response.success = false;
			      return false;
			}
		 }
	response.success = true;
	return true;
	}
	
	// welding service
	bool welding(ases_mc_pkg1::welding::Request& request, ases_mc_pkg1::welding::Response& response)
	{
		 if(request.cmd_welding == "ON")
	    	 {
	    	 	if(gripedflag == true)
			{
				ROS_INFO_STREAM("INFO: Capsule is gripped");
				if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,2,14,1,1,0,&ulErrorCode))
				{
				      DisplayError("W01",ulErrorCode);response.success = false;
				      return false;
				}
			}
			else
			{
				ROS_INFO_STREAM("INFO: Capsule is not gripped, welding is not possible");
			}
		 }
		 else if(request.cmd_welding == "OFF")
	    	 {
			if(!VCS_DigitalOutputConfiguration(g_pKeyHandle,1,2,14,0,1,0,&ulErrorCode))
			{
			      DisplayError("W02",ulErrorCode);response.success = false;
			      return false;
			}
		 }
	response.success = true;
	return true;
	}

	// parking service
	bool parking(std_srvs::Trigger::Request& request, std_srvs::Trigger::Response& response)
	{
		signed int par_pos_x =  0; //(xparkingpos*10248) + xhomepositioncounts;
		signed int par_pos_y =  0; //(yparkingpos*10248) + yhomepositioncounts;
		signed int par_pos_z =  0;// (zparkingpos*10248) + zhomepositioncounts;
		signed int par_pos_o = -3170;
		signed int par_pos_g = pPositionIsCounts_g;
		signed int par_pos_r = pPositionIsCounts_r;
		
		ROS_INFO_STREAM("Parking position of xyz" <<par_pos_x<<", "<<par_pos_y<<", "<<par_pos_z);
		if(!PPM(par_pos_x,par_pos_y,par_pos_z,par_pos_o,par_pos_g,par_pos_r))
	        {
			DisplayError("P01",ulErrorCode); response.success = false;
			return false; 
	        }
	     
	response.success = true;
	return true;
	}
	
	
	// function to display the error message where en is error number like "SC01" and ec is maxon error code
	
	bool DisplayError(std::string en, unsigned int ec)
	{
		std::stringstream ss;
		ss<<std::hex<<ec;
	  std::string hex_value = ss.str();
	  std::stringstream full_message;
	  full_message<<en<<", MCode : 0x"<<hex_value;
	  ROS_ERROR("%s",full_message.str().c_str());
	  ErrorMsg.data = full_message.str().c_str();
	  errormsg_publisher.publish(ErrorMsg);
	  return true;
	}
	
	// grip_release function
	bool gripreleasejob(ases_mc_pkg1::grip_release::Request& request, ases_mc_pkg1::grip_release::Response& response)
	{
		 if(request.command == "grip")
	    	 {
	    	 	    if(!VCS_ActivateProfileVelocityMode(g_subKeyHandle,5,&ulErrorCode))
			    {
			      DisplayError("GRJ01",ulErrorCode);response.success = false;
			      return false;
			    }
			    if(!VCS_SetVelocityProfile(g_subKeyHandle,5,-300,800,&ulErrorCode))
			    {
			      DisplayError("GRJ02",ulErrorCode);response.success = false;
			      return false;
			    }
			    if(!VCS_SetEnableState(g_subKeyHandle,5,&ulErrorCode))
			    {
			      DisplayError("GRJ03",ulErrorCode);response.success = false;
			      return false;
			    } 
			      
			    if(!VCS_MoveWithVelocity(g_subKeyHandle,5,80,&ulErrorCode))
			    {
			      DisplayError("GRJ04",ulErrorCode);response.success = false;
			      return false;
			    }
	    
	  		    grippingflag = true;
				gripedflag=false;
				releasedflag=false;
				releasingflag=false;
		
		 }
		 else if(request.command == "release")
	    	 {
	    	 	      
			      if(!PPM(pPositionIsCounts_x,pPositionIsCounts_y,pPositionIsCounts_z,pPositionIsCounts_o,-80000,pPositionIsCounts_r))
			      {
							DisplayError("GRJ05",ulErrorCode); response.success = false;
							return false; 
			      }
			 	releasingflag = true;
			 	releasedflag = false;
		     	gripedflag = false;
			 	grippingflag=false;     
		 }
		    
		     ros::Duration(1.0).sleep();
			 response.success = true;
		     return true;
		 
	}
	
	
};

int main(int argc, char**argv)
{

  ros::init(argc, argv, "ases_publisher");
  ros::NodeHandle nh;
  ros::Rate loop_rate(100);


  Control program;
  if(program.start_communication())
  {
  /*	if(!program.clear_fault())
  	{
  		ROS_INFO_STREAM("Fault not cleared");
  	}*/
  }

  while (ros::ok())
  {
	
	program.position_update();
	program.fault_update();
	ros::spinOnce();
	loop_rate.sleep();
  }

  // program.close_device();
  return 0;
}

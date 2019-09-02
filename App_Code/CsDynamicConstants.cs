﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CsDynamicConstants 的摘要描述
/// This class is to store all the Constants that are likely to change depending on the situation.
/// </summary>
public class CsDynamicConstants 
{
#region The folder that keeps the AIQ for "Knee" 
    //the file path of the AITypeQuetion XML folder that will be accessed by browser and .Net Server.
    public static string relativeKneeXMLFolder = "IPC_Questions/1161-1450/";

    //the file path of the AITypeQuetion XML folder that will be accessed by 3DBuilder.exe .
    //Ben//public static string absoluteKneeXMLFolder = "D:\\IPC_interact_with_3DBuilder\\IPC_Questions\\1161-1450\\";
    public static string absoluteKneeXMLFolder = HttpContext.Current.Request.MapPath("~/").Replace(@"\", @"\\") + "IPC_Questions\\1161-1450\\";
   
    //this is organ xml file contains all the organs in a certain body part.
    //e.g., ./IPC_Question_Origin/SceneFile_ex.xml stores all the organs in Knee.
    public static string completeKneeOrgansXMLPath = "./IPC_Question_Origin/SceneFile_Knee_ex.xml";
#endregion

    //the download link of the 3DBuilder RemoteDeskTopRDPFile.
    public static string RemoteDeskTopRDPFile_For3DBuilder_DownloadLink="https://drive.google.com/open?id=1h7QUiN2iXEKbTzMXn4UWj-c56tfoAO6i";

}
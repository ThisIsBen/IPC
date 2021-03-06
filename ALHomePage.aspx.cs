﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;


public partial class ALHomePage : CsSessionManager
{
    

    //set the default value of each parameters that are retrieved from URL.
    //string questionXMLPath = "tea1_Q_20181210231100"; ////Surgery Mode xml file name //it's included in exam paper cPaperID=tea120181122231914 and cPaperID=tea120181126201801
    string questionXMLPath = "tea1_Q_20181225144451";
    string strUserID = "stu2";
    string examMode = "Yes";//ExamMode的中控, we set its default value to Yes
    string cActivityID = "1023";


    protected void Page_Load(object sender, EventArgs e)
    {
       
        //int osID = Int32.Parse(Session["osId"].ToString());
        //os = System.Diagnostics.Process.GetProcessById(osID);
        //os.StartInfo.RedirectStandardInput = true;
        //os.StartInfo.UseShellExecute = false;

        //check if the ASP Application Variable works
        //Response.Write("The num of users online=" + Application["visitors"].ToString());


        //get the parameters in URL and store there value in global var.
        retrieveURLParameters();



        if (!IsPostBack)
        {

            


            //temporarily we only activate CSNamedPipe.exe, and manually activate 3DBuilder before clicking the button btnCheck
            //run CSNamedPipe.exe
            runCSNamedPipe();


            //store the URL of the previous page to a session var.
            storePreviousPageURL();
        }

    }


    private void storePreviousPageURL()
    {
        Previous_Page_URL_Session = Request.UrlReferrer.AbsoluteUri;
    }


    protected void btnCheck_Click(object sender, EventArgs e)
    {


       

        //initiate 3DBuilder:  Set Mode to Practice Mode in 3DBuilder for initialization
        setModeIn3DBuilderForInit();

        Response.Redirect("Items.aspx?examMode=" + examMode + "&strQID=" + questionXMLPath + "&strUserID=" + strUserID + "&cActivityID=" + cActivityID);
    }

    //initiate 3DBuilder:  Set Mode to Practice Mode in 3DBuilder for initialization
    private void setModeIn3DBuilderForInit()
    {
        /*
        //originating from ALHomePage.aspx
        StreamWriter wr = (StreamWriter)Session["Writer"];
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('" + os.StartInfo.RedirectStandardInput + os.Id + "');</script>"); 
        //StreamWriter wr = os.StandardInput;

        wr.WriteLine("1 2");
         * */
        NamedPipe_IPC_Connection.sendMsg23DBuilder("1 2");
    }

    //get the parameters in URL and store there value in global var.
    private void retrieveURLParameters()
    {
        //set the variable questionXMLPath with the parameter strQID in URL if it is provided.
        if (Request.QueryString["strQID"] != null && Request.QueryString["strQID"] != "")
        {
            questionXMLPath = Request.QueryString["strQID"];
        }

        //set the variable strUserID with the parameter strUserID in URL if it is provided.
        if (Request.QueryString["strUserID"] != null && Request.QueryString["strUserID"] != "")
        {
            strUserID = Request.QueryString["strUserID"];
        }


        //set the variable ExamMode with the parameter ExamMode in URL if it is provided.
        if (Request.QueryString["ExamMode"] != null && Request.QueryString["ExamMode"] != "")
        {
            examMode = Request.QueryString["ExamMode"];
        }

        //set the variable cActivityID with the parameter cActivityID in URL if it is provided.
        if (Request.QueryString["cActivityID"] != null && Request.QueryString["cActivityID"] != "")
        {
            cActivityID = Request.QueryString["cActivityID"];
        }
        
    }


    //run the CSNamedPipe.exe
    private void runCSNamedPipe()
    {

        NamedPipe_IPC_Connection IPC_Connection = new NamedPipe_IPC_Connection(Request.MapPath("~/"), Request.MapPath("App_Code/CSNamedPipe/bin/Debug/CSNamedPipe.exe"), strUserID);

        /*
        //store the StreamWriter of the CSNamedPipe.exe to a session variable
        //for writing message to CSNamedPipe.exe, and CSNamedPipe.exe will send it to the 3DBuilder.       
        Session["Writer"] = IPC_Connection.CSNamedPipeWriter;

        //store the StreamReader of the CSNamedPipe.exe to a session variable
        //for reading message from CSNamedPipe.exe 
        //because 3DBuilder can send message to the CSNamedPipe.exe with named pipe.      
        Session["Reader"] = IPC_Connection.CSNamedPipeReader;

        //store the process of CSNamedPipe.exe to a session variable  
        //so that we can access it in other AIQ pages.
        Session["Process"] = IPC_Connection.CSNamedPipeProcess;

        //get process ID of the CSNamedPipe, and store it in a session var so that we can kill the CSNamedPipe process after the user finishes using the connection with 3DBuilder
        Session["ProcessID"] = IPC_Connection.CSNamedPipePID;

       */
        





    }
}
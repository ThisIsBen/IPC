﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="./Site.Master" CodeFile="AITypeQuestion_EditingPage.aspx.cs" Inherits="IPC"  MaintainScrollPositionOnPostback="true"%>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!--Include Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
   
    <link href="Content/IPC_Layout.css" rel="stylesheet" />
   
     <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="./bootstrap-checkbox/dist/js/bootstrap-checkbox.min.js" defer></script>

    <style type="text/css">
        th {
            
            font-size:20px;
            text-align: center;         
            background-color: #ffd800;
            
           
        }

        .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
            background-color: #b6ff00;
        }

        .menu_img {
            width: 100%;
        }

        .questionNoFontStyle {

           font-size: 35px;

        }

        .organNameoFontStyle {
             font-size: 35px;
             text-align: left;
        }
        
        .template-checkbox {
           text-align:center;
        }

        .jumbotron {
            padding-bottom: 0;
            padding-top: 0;
        }
    </style>

    <script type="text/javascript">
        
        visibleImg = "Image/visible.png";
        invisibleImg = "Image/invisible.png";
       
        //Close CSNamePipe.exe before close the webpage.
        //$(window).unload(function () {
         //   document.getElementById('<%= FinishBtn.ClientID %>').click();
        //});
        /////////////////////////////////



        //detect user close webpage event,but it is also fired when you leave a site over a link or your browsers back button. 
        //Bind webpage default close cross button with "Finish" button to shot down CsNamedPipe.exe when user close IPC webpage.
        //window.addEventListener("beforeunload", function (e) {
        //    document.getElementById('<%= FinishBtn.ClientID %>').click();
        //});
        //window.onbeforeunload = function () {
        //    document.getElementById('<%= FinishBtn.ClientID %>').click();
        //};
        
        ///////////////////////////////////////////
        
        //resume scroll position after asp.net postback

        


        window.onload = function () {
            //resume scroll position after asp.net postback
            //divAnswerSheet.scrollTop = hdnScroll.value;


           
            //comment it to test why "Can't read"
            
            //recover visbility icon of hide_showAll
           
           
           
           
            

            ///////////////////////////////////////////////////
            
            /*
            else {
                iconHide_ShowAll.src = "Image/invisible.png";
            }
            */



            //suspects of can't read
            ///////////////////////////////////////////////////
            //resume mark icon in gridView
            
            var gvDrv = document.getElementById("<%= gvScore.ClientID %>");

            /*
            for (i = 1; i < gvDrv.rows.length; i++) {

                
                
                //recover visbility icon of each row
                if (gvDrv.rows[i].cells[1].getElementsByTagName("input")[2].value == "true") {
                    gvDrv.rows[i].cells[3].getElementsByTagName("input")[0].src = "Image/visible.png";
                }
                else {
                    gvDrv.rows[i].cells[3].getElementsByTagName("input")[0].src = "Image/invisible.png";
                }
                
                //recover mark icon of each row
                switch (parseInt(gvDrv.rows[i].cells[1].getElementsByTagName("input")[3].value)) {

                    case 0:
                        gvDrv.rows[i].cells[4].getElementsByTagName("input")[0].src = "image/notSure.png";
                        gvDrv.rows[i].cells[4].getElementsByTagName("input")[1].src = "image/giveUp.png";
                        break;
                    case 1:
                        gvDrv.rows[i].cells[4].getElementsByTagName("input")[0].src = "image/notSureClick.png";
                        break;
                    case 2:
                        gvDrv.rows[i].cells[4].getElementsByTagName("input")[1].src = "image/giveUpClick.png";
                        break;




                }


            }
            */
//////////////////////////////////////////////////////////////
        }

        //check whether there is at least one organ is picked as a question
        //This function should be called by Save button and Create IPC button.
        function checkIfAtLeastOneOrganIsPickedAsQuestion() {

            if ($("#<%= gvScore.ClientID %> input:checkbox:checked").length == 0) {
                alert('You must pick at least one organ for the question.');

                return false;
            }

            return true;
        }


        //change mark icon to "not sure " icon and remove the mark when the mark has existed with single click.
        function toNotSureIcon(lnk) {
            //get the clicked row of TemplageField
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex;


            //change " " to "not sure"icon or change"not sure"icon and "give up"Icon to " "
            var img = row.cells[4].getElementsByTagName("input")[0].src;
            var imgBesideIt = row.cells[4].getElementsByTagName("input")[1].src;
            if (img.indexOf('notSureClick.png') != -1 ) {
                row.cells[4].getElementsByTagName("input")[0].src = "image/notSure.png";
                //record the current mark icon in the hidden field,0 means empty
                row.cells[1].getElementsByTagName("input")[3].value = 0;
            }

            
            else {
                if (imgBesideIt.indexOf('giveUpClick.png') != -1)
                {
                    row.cells[4].getElementsByTagName("input")[1].src = "image/giveUp.png";
                }
                row.cells[4].getElementsByTagName("input")[0].src = "image/notSureClick.png";
                
                //record the current mark icon in the hidden field,1 means notSure.png
                row.cells[1].getElementsByTagName("input")[3].value = 1;
            }

            //to prevent refreshing of page when button inside form clicked
            return false;
        }

        //change mark icon to "give up " icon with double click.
        function toGiveUpIcon(lnk) {
            //get the clicked row of TemplageField
            var row = lnk.parentNode.parentNode;
            var rowIndex = row.rowIndex;

           
            //change to "give up" icon
            var img = row.cells[4].getElementsByTagName("input")[1].src;
            var imgBesideIt = row.cells[4].getElementsByTagName("input")[0].src;
            if (img.indexOf('giveUpClick.png') != -1) {

                row.cells[4].getElementsByTagName("input")[1].src = "image/giveUp.png";
                //record the current mark icon in the hidden field,0 means empty
                row.cells[1].getElementsByTagName("input")[3].value = 0;
            }
          
            else {
                if (imgBesideIt.indexOf('notSureClick.png') != -1)
                {
                    row.cells[4].getElementsByTagName("input")[0].src = "image/notSure.png";
                }
                row.cells[4].getElementsByTagName("input")[1].src = "image/giveUpClick.png";

                //record the current mark icon in the hidden field,1 means notSure.png
                row.cells[1].getElementsByTagName("input")[3].value = 2;
            }

            //to prevent refreshing of page when button inside form clicked
            return false;
        }


        function checkPickedOrgans_InvisibleOrgans(questionOrganArray, invisibleOrganArray) {

            var gvDrv = document.getElementById("<%= gvScore.ClientID %>");

            //create an organ Name_Number HashMap with Name as key and Number as value.
            var organName_NumberHashMap = {};
            //put all the organ name in the GridView table to a hash map
            for (i = 1; i < gvDrv.rows.length; i++) {
                organName_NumberHashMap[gvDrv.rows[i].cells[1].getElementsByTagName("span")[0].innerHTML] = i;

            }


            //check the radio buttons of the organs that are set to be the question
            checkPickedOrgans(gvDrv, organName_NumberHashMap, questionOrganArray);

            //switch the icon of the visibility column if the organ is set to be invisible
            recoverVisibilityBtnIcon(gvDrv, organName_NumberHashMap, invisibleOrganArray);
        }
      

        //check the radio buttons of the organs that are set to be the question
        function checkPickedOrgans(gvDrv, organName_NumberHashMap, questionOrganArray) {

            //check the checkbox of the organ that has been chosen as part of question.
            for (j = 0; j < questionOrganArray.length; j++) {

                questionOrganRow = organName_NumberHashMap[questionOrganArray[j]];
                //check the organ that has been chosen as part of question.
                $("#" + gvDrv.rows[questionOrganRow].cells[3].getElementsByTagName("input")[0].id).prop('checked', true);

            }


        }



        //switch the icon of the visibility column if the organ is set to be invisible
        function recoverVisibilityBtnIcon(gvDrv, organName_NumberHashMap, invisibleOrganArray) {


            for (j = 0; j < invisibleOrganArray.length; j++) {

                questionOrganRow = organName_NumberHashMap[invisibleOrganArray[j]];

                //set the icon of the visibility column if the organ is set to be invisibleIcon 
                gvDrv.rows[questionOrganRow].cells[2].getElementsByTagName("input")[0].src = invisibleImg

                //store the name of the selected organ that should be hidden in 3DBuilder in the hidden field,hidden_markHideShowOrgan.
                //we also use the value of the hidden field ,hidden_markHideShowOrgan, to indicate if the corresponding organ is to be stored as visible or hidden to the xml file when we store the content of the AITypeQuestion. 
                gvDrv.rows[questionOrganRow].cells[2].getElementsByTagName("input")[1].value = invisibleOrganArray[j];
            }

        }


        //clear the ajax cache to read the latest content from the organ xml file
        function clearAjaxCache() {
            $.ajaxSetup({
                cache: false
            });
        }


        function readInExistingQuestion() {

            //get the QID from URL parameter as the target file name if the instructor wants to check the contnet of the existing AI Type question.
            questionXMLPath = url.searchParams.get("strQID") + ".xml";

            //clear the ajax cache to read the latest content from the organ xml file
            //if we don't clear the cache, ajax will return an old version of the organ xml file cached in the memory.
            clearAjaxCache();


            $.ajax({
                type: "GET",
                url: XMLFolder + questionXMLPath,
                dataType: "xml",
                success: function (xml) {

                    //store the organs Name that are set to be the question
                    var questionOrganArray = []

                    //store the organs that are set to be invisible
                    var invisibleOrganArray = []


                    $(xml).find('Organ').each(function () {

                        //keep the organs Name that are set to be the question in the questionOrganArray
                        var isQuestion = $(this).find("Question").text();

                        if (isQuestion == "Yes") {
                            $questionOrganName = $(this).find("Name");

                            //push to questionOrganArray
                            questionOrganArray.push($questionOrganName.text());
                            

                        }




                        //keep the organs that are set to be invisible in the invisibleOrganArray
                        var isInvisible = $(this).find("Visible").text();

                        if (isInvisible == "0") {
                            $invisibleOrganName = $(this).find("Name");

                            //push to questionOrganArray
                            invisibleOrganArray.push($invisibleOrganName.text());


                        }


                        





                    });


                    //check the mode of the AITypeQuestion and check its radio buttn accordingly.
                    checkAITypeQuestionMode_RadioBtn(xml);
                    
                    //2019/4/23 Ben temp commented
                    
                    //check the radio buttons of the organs that are set to be the question
                    //and switch the icon of the visibility column if the organ is set to be invisible
                    checkPickedOrgans_InvisibleOrgans(questionOrganArray, invisibleOrganArray);
                    

                  
                }

            });
        }

       

        //check the mode of the AITypeQuestion and check its radio buttn accordingly.
        function checkAITypeQuestionMode_RadioBtn(xml)
        {
            //if the mode of the AITypeQuestion is "Surgery Mode"   
            if ($(xml).find("AITypeQuestionMode").text() == "Surgery Mode") {
                //check the radio button of the Surgery Mode
                document.getElementById("SurgeryModeRadioBtn").checked = true;
                       

            }

            //if the mode of the AITypeQuestion is "Anatomy Mode"
            else {
            //check the radio button of the Anatomy Mode
                document.getElementById("AnatomyModeRadioBtn").checked = true;


            }
        }
    </script>


  
    <div align="center">
       
        <div class="jumbotron" >
            <%--        <asp:Button ID="StartIPC" OnClick="StartIPC_Click" Text="開始" runat="server" />
        <asp:Button ID="Button1" OnClick="Button1_Click" Text="傳遞參數" runat="server" />--%>


             
            <div class="container">
                <div class="row">
                    <div  style="text-align: center;">
                       <div class="col-sm-6">
                        <asp:Button ID="FinishBtn" CssClass='btn-info btn-lg' OnClick="FinishBtn_Click" Text="Save the Question" runat="server" OnClientClick="if(!checkIfAtLeastOneOrganIsPickedAsQuestion()) return false;"/>
                        </div>
                           
                       <div class="col-sm-6">
                        
                       <input type="button"  class="btn-danger btn-lg"   id="btnBack" runat="server" value="<< Back"   onserverclick="btnBack_Click">
                       </div>
                    </div>
                   </div>

                 <asp:UpdatePanel ID="UpdatePanel1"   UpdateMode="Conditional"  runat="server">
                    <ContentTemplate>
                <div class="row">
                    <div >
                     
                     
                     
                        <div >
                          <h3 style="text-align: left;"><b>Step 1</b> Please write down the question description here. </h3>
                          <textarea class="form-control" rows="5" style="min-width: 100%;font-size: 22px;" id="AITypeQuestionDescription" runat="server" ></textarea>
                        </div>


                        <div class="row">
                         

                          <!-- 9 + 4 = 13 > 12，因此以下斷行放置多出來的Column -->
                          <div class="col-md-8">

                               <div class="roles" style="text-align: left; width:100%">
                            <h3 ><b>Step 2</b> Please choose the question mode here.</h3><h4>(Surgery/Anatomy Mode)</h4>
                            
                            <label class="role" for="SurgeryModeRadioBtn"><input type="radio" name="radioBtn_AITypeQuestionMode" value="Surgery Mode" id="SurgeryModeRadioBtn" checked="checked" >&nbsp <b >Surgery Mode</b> &nbsp &nbsp  &nbsp<h4>(The skin of the body part will be displayed and can not be hidden.The stuents can only use the surgery knife provided in 3DBuilder to cut and see the interal organ like a real surgery.) </h4> </label>
                       <br />
                           
                            <label class="role" for="AnatomyModeRadioBtn"> <input type="radio" name="radioBtn_AITypeQuestionMode" value="Anatomy Mode" id="AnatomyModeRadioBtn" >&nbsp <b >Anatomy Mode</b> <h4>(The skin of the body part will be hidden.)</h4></label>
                        </div>

                      
                         <asp:HiddenField ID="hidden_selectedAnatomyMode" runat="server" Value="Surgery Mode"/>
                                

                        <div class="roles" style="text-align: left; width:100%; display: none;">
                            <h3 >If you want to use the this AITypeQuestion in IRS system,<br />click the button edit the corresponding IRS selection question.</h3><h4>(Surgery/Anatomy Mode)</h4>
                             <input type="button" class='btn-danger btn-lg' value="Create IRS selection question"  onclick="go2HintsSelectionQuestionEditingPage()">
                           
                        </div>
                          </div>
                          <div class="col-md-4  text-left">
                             <h3 ><b>Step 4</b></br> Preview the question in the 3DBuilder.</h3>
                              <input type="button"  class="btn-info btn-lg" style="display:block;"  id="btn_cutBodyPartIn3DBuilder" runat="server" value="Step4-1 Create IPC Pipe"   onclick=" sethidden_selectedAnatomyMode(); askUserOpen3DBuilder();" onserverclick="btn_cutBodyPartIn3DBuilder_Onclick">&nbsp &nbsp  &nbsp</br> <input type="button"  class="btn-info btn-lg" style="display:inline;"  id="btn_connectTo3DBuilder" runat="server" value="Step4-2 Connect to 3DBuilder"  onclick="    sethidden_selectedAnatomyMode();" onserverclick="btn_connectTo3DBuilder_Onclick">
                          </div>
                        </div>
                        
                      

                       

                     
                    </div>

                    
                </div>
                <%--<input type="text" id="TBX_Input" runat="server" />--%>
                <%--<input type="button" onclick="" ID="StartRemoteApp"  Text="開始RemoteAPP" runat="server" />--%>
             </ContentTemplate>
            </asp:UpdatePanel>
                        </div>
        </div>
    </div>
        

                 
        <div class="row">
            
            <asp:Panel ID="scorePanel" runat="server" Width="100%" HorizontalAlign="Center">
                <div>
                    
            
            </div>
            <div>

               
                <div class="row text-left">
                    <div class="col-md-9"> <h3 ><b>Step 3</b> Select the organs to be the questions.<br />You can also set the visibility of each organ</h3></div>

                </div>
              
            </div>
                <asp:GridView CssClass="table  table-condensed table-bordered table-hover table-responsive " ID="gvScore" runat="server" ShowHeaderWhenEmpty="true" OnRowCommand="gvScore_RowCommand">
                  
                    <Columns>

                        <asp:TemplateField ItemStyle-Width="40px" HeaderText="Organ Number">
                            <ItemTemplate>
                                <asp:Label ID="TextBox_Number" CssClass="questionNoFontStyle" CliendIDMode="static" name="TextBox3" Visible="true" runat="server" Text='<%# Eval("Number") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ControlStyle-Width="90%" ControlStyle-Height="5px" HeaderText="Organ Name">
                            <ItemTemplate>
                              
                                <asp:Label ID="LBTextBox_OrganName"  CssClass="organNameoFontStyle" runat="server" Text='<%# Eval("Name") %>' />
                                

                            </ItemTemplate>

                        </asp:TemplateField>

                         <asp:TemplateField ItemStyle-Width="30px" ItemStyle-CssClass="template-checkbox" HeaderText="Visibility">
                            <ItemTemplate>
                                <%--use onclick() to call the JS function and return false to avoid activating postback automatically--%>
                                <input type="image" class="img-thumbnail hideShowOrganBtn"  id="btnHideShowOrgan" onclick="if (!hideShowSelectedOrgan(this)) return false;" src="Image/visible.png">
                                 
                                <%-- <input type="hidden" id="hidden_markHideShowOrgan" runat="server" value="-1"> It doesn't work in Gridview--%>
                                <asp:HiddenField ID="hidden_markHideShowOrgan" runat="server" Value="-1"/>
                                

                             
                            </ItemTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField ItemStyle-Width="150px" ItemStyle-CssClass="template-checkbox" HeaderText="Select for testing">
                            <ItemTemplate>
                               
                                 <asp:CheckBox runat="server" ID="checkbox_pickedOrgan" />


                             
                            </ItemTemplate>
                        </asp:TemplateField>



                        
                        

                        

                    </Columns>
                </asp:GridView>
                  <input type="hidden" id="hidden_AITypeQuestionTitle"  runat="server" >
               

            </asp:Panel>
        </div>
    </div>
                         
     
    <script type="text/javascript">
        /*Temporary hard-code variable*/
        //In the near future ,we will get the questionXMLPath from URL para or other para transmission method.
        XMLFolder = "<%=  CsDynamicConstants.relativeKneeXMLFolder %>";

        
        /*Temporary hard-code variable*/

       

        //"../Mirac3DBuilder/HintsAccounts/Student/Mirac/1161-1450/SceneFile_Q1.xml";

        //to extract para in URL
        var url = new URL(window.location.href);
       

        $(document).ready(function () {

            readyInitProcess();

            //Let the function called 'EndRequestHandler' executed after coming back from UpdatePanel AJAX 
            //This is the fix terms for using ASP UpdatePanel AJAX
            loadAfterUpdatePanel()

        });


        //Ben show the activate 3DBuilder btn be shown for the all time
        
       // $('input[type=radio][name=radioBtn_AITypeQuestionMode]').change(function () {
       //    if (this.value == 'Surgery Mode') {
       //         $("#<%= btn_cutBodyPartIn3DBuilder.ClientID %>").css("display", "inline");
       //       $("#<%= btn_connectTo3DBuilder.ClientID %>").css("display", "inline");
                

       //     }
       //     else {
       //         $("#<%= btn_cutBodyPartIn3DBuilder.ClientID %>").css("display", "none");
       //         $("#<%= btn_connectTo3DBuilder.ClientID %>").css("display", "none");
       //     }
            
       // });
        

        function hideShowSelectedOrgan(selectedHideShowOrganBtn) {
            
            //to know which row's OrganSubmitBtn is clicked
            //get the clicked row of TemplageField
            var row = selectedHideShowOrganBtn.parentNode.parentNode;

           

            //set the icon of the btn of the selected organ to be invisibleBtn 
            if (row.cells[2].getElementsByTagName("input")[0].src.includes(visibleImg)) {
               
                row.cells[2].getElementsByTagName("input")[0].src = invisibleImg;

                //store the name of the selected organ that should be hidden in 3DBuilder in the hidden field,hidden_markHideShowOrgan.
                //we also use the value of the hidden field ,hidden_markHideShowOrgan, to indicate if the corresponding organ is to be stored as visible or hidden to the xml file when we store the content of the AITypeQuestion. 
                row.cells[2].getElementsByTagName("input")[1].value = row.cells[1].getElementsByTagName("span")[0].innerHTML;

                //console.log(row.cells[2].getElementsByTagName("input")[1].value);
            }
            else {

                //switch the icon of the btn of the selected organ to be visibleBtn
                row.cells[2].getElementsByTagName("input")[0].src = visibleImg;

                //restore the corresponding hidden field,hidden_markHideShowOrgan, from invisible organ to visible organ to indicate that the organ is set to be visible now.
                row.cells[2].getElementsByTagName("input")[1].value = "-1";

               

            }

            
            
            
        }
       

        function go2HintsSelectionQuestionEditingPage() {

            location.href = 'http://localhost/HINTS/AuthoringTool/CaseEditor/Paper/CommonQuestionEdit/Page/ShowQuestion.aspx?Opener=AITypeQuestion_EditingPage&GroupID=' + url.searchParams.get("strQuestionGroupID");
        }

        function readyInitProcess() {
            $(':checkbox').checkboxpicker();


            //load XML to check the organs that are picked to be part of question.
            if (url.searchParams.get("viewContent") != null && url.searchParams.get("viewContent") == "Yes") {

                //load XML to check the organs that are picked to be part of question.              
                readInExistingQuestion();

            }


            if (url.searchParams.get("strQID") != null) {
                //load XML to check the organs that are picked to be part of question.
                var hidden_AITypeQuestionTitle = document.getElementById("<%= hidden_AITypeQuestionTitle.ClientID %>");
                hidden_AITypeQuestionTitle.value = url.searchParams.get("strQID");

            }


            //keep the visibility icon after coming back from UpdatePanel AJAX
            keepVisibilityIcon();

            //keep the Anatomy Mode radio box after coming back from UpdatePanel AJAX
            keepAnatomyModeRadioBox();


           

        }
        //keep the Anatomy Mode radio box after coming back from UpdatePanel AJAX
        function keepAnatomyModeRadioBox() {
            //if the mode of the AITypeQuestion is "Surgery Mode"   
            if (document.getElementById("<%= hidden_selectedAnatomyMode.ClientID %>").value == "Surgery Mode") {
                //check the radio button of the Surgery Mode
                document.getElementById("SurgeryModeRadioBtn").checked = true;


            }

                //if the mode of the AITypeQuestion is "Anatomy Mode"
            else {
                //check the radio button of the Anatomy Mode
                document.getElementById("AnatomyModeRadioBtn").checked = true;


            }

        }

        //set the selected Anatomy Mode in hidden_selectedAnatomyMode before PostBack
        function sethidden_selectedAnatomyMode() {


            if (document.getElementById("SurgeryModeRadioBtn").checked) {
                //the radio button of the Surgery Mode is checked
                document.getElementById("<%= hidden_selectedAnatomyMode.ClientID %>").value = "Surgery Mode";
                       

            }

               
            else {
                //the radio button of the Anatomy Mode is checked
                document.getElementById("<%= hidden_selectedAnatomyMode.ClientID %>").value = "Anatomy Mode";


            }
           
        }




        //keep the visibility icon after coming back from UpdatePanel AJAX
        function keepVisibilityIcon() {

            var gvDrv = document.getElementById("<%= gvScore.ClientID %>");

            for (i = 1; i < gvDrv.rows.length; i++) {



                //recover visbility icon of each row

                //keep submit btn visible at all times
                

                if (gvDrv.rows[i].cells[2].getElementsByTagName("input")[1].value == "-1") {
                    gvDrv.rows[i].cells[2].getElementsByTagName("input")[0].src = visibleImg;
                }
                else {
                    gvDrv.rows[i].cells[2].getElementsByTagName("input")[0].src = invisibleImg;
                }
                

            }
        }

        //Let the function called 'EndRequestHandler' executed after coming back from UpdatePanel AJAX 
        //This is the fix terms for using ASP UpdatePanel AJAX
        function loadAfterUpdatePanel() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler() {


            //do the init ready function again after coming back from UpdatePanel AJAX 
            //partOf_documentReadyFun();

            //do the window.onload function again because AJAX doesn't trigger window.onload event.
            //onloadFun();
            readyInitProcess();
            //alert("Back from updatePanel")






        }


        function askUserOpen3DBuilder() {

            alert("IPC Pipe has been created! \n\nNow,please activate the 3DBuilder by clicking the '3DBuilder MFC Application.rdp'.");
        }
     </script>

</asp:Content>

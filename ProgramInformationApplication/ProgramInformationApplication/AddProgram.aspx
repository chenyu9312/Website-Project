<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddProgram.aspx.cs" Inherits="ProgramInformationApplication.AddProgram" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
                <div class="row">
                    <div class="form-horizontal">
                        <div>
                            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
                        </div>
                        <fieldset>
                            <legend>Program Information</legend>
                            <p><span style="color: red; font-size: 18px">*</span>Indicates Required Fields</p>
                            <br />
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>School Short Form</label>
                                <asp:DropDownList ID="SchoolAbbrev" class="col-sm-2 form-control" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="SchoolAbbrev_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldSAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="SchoolAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Department Short Form</label>
                                <asp:DropDownList ID="DepartmentAbbrev" class="col-sm-2 form-control" runat="server" Width="300px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="DepartmentAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Program Code</label>
                                <asp:TextBox ID="ProgramCodeTxtbox" class="col-sm-3 form-control" Width="300px" placeholder="Program Code" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPCode" class="col-sm-4" runat="server" ErrorMessage="Program Code Required" ControlToValidate ="ProgramCodeTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Full Program Name</label>
                                <asp:TextBox ID="ProgramNameTxtbox" class="col-sm-3 form-control" Width="300px" placeholder="Program Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPName" class="col-sm-4" runat="server" ErrorMessage="Program Name Required" ControlToValidate ="ProgramNameTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Credential</label>
                                <asp:RadioButton ID="Degree" Text="Degree" GroupName="RG1" class="RadioButton" runat="server" />
                                <asp:RadioButton ID="Certificate" Text="Certificate" GroupName="RG1" class="RadioButton" runat="server" />
                                <asp:RadioButton ID="Diploma" Text="Diploma" GroupName="RG1" class="RadioButton" runat="server" checked="true"/>
                                <asp:RadioButton ID="AdvancedDiploma" Text="Advanced Diploma" GroupName="RG1" class="RadioButton" runat="server"  />
                                <asp:RadioButton ID="GraduateCertificate" Text="Graduate Certificate" GroupName="RG1" class="RadioButton" runat="server" />

                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Program Status</label>
                                <asp:RadioButton ID="Pending" Text="Pending" GroupName="RG2" class="RadioButton" runat="server" AutoPostBack="true" OnCheckedChanged="Current_CheckedChanged" />
                                <asp:RadioButton ID="Disapproved" Text="Disapproved" GroupName="RG2" class="RadioButton" runat="server" AutoPostBack="true" OnCheckedChanged="Current_CheckedChanged"/>
                                <asp:RadioButton ID="Current" Text="Current" GroupName="RG2" class="RadioButton" runat="server" checked="true" AutoPostBack="true" OnCheckedChanged="Current_CheckedChanged"/>
                                <asp:RadioButton ID="Suspended" Text="Suspended" GroupName="RG2" class="RadioButton" runat="server" AutoPostBack="true" OnCheckedChanged="Suspended_CheckedChanged"/>
                                <asp:RadioButton ID="Canceled" Text="Canceled" GroupName="RG2" class="RadioButton" runat="server" AutoPostBack="true" OnCheckedChanged="Suspended_CheckedChanged"/>
                            </div>
                             <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Program Duration</label>
                                <asp:TextBox ID="ProgramDurationTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="Year(s)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPDuration" class="col-sm-4" runat="server" ErrorMessage="Program Duration Required" ControlToValidate ="ProgramDurationTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPDuration" class="col-sm-2" runat="server" ErrorMessage="Positive Integers Only" BorderColor="White" ValidationExpression="^[1-9]\d*$" ControlToValidate="ProgramDurationTxtBox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Program Start Date</label>
                                <asp:TextBox ID="StartDateTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDate" class="col-sm-2" runat="server" ErrorMessage="Incorrect Date, Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="StartDateTxtbox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                             <div class="row form-group">
                                 <asp:Panel ID="HideReason" runat="server" Visible ="false" Enabled="False">
                                     <label class="col-sm-2 control-label">Reason</label>
                                 </asp:Panel>
                                <asp:TextBox ID="ReasonTxtbox" class="col-sm-3 form-control" Width="450px" placeholder="The Reason This Program is Suspended or Canceled is..." runat="server" Rows="4" TextMode="MultiLine" Visible="False" Enabled="False"></asp:TextBox>
                            </div>
                            
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminProgramSubmitBtn" runat="server" Text="Submit" style="height:40px; width:150px; padding:0px" OnClick="AdminProgramSubmitBtn_Click"/>
                             </div>
                        </fieldset>
                    </div>
                </div>
        
            </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MTCUApprovalForm.aspx.cs" Inherits="ProgramInformationApplication.MTCUApprovalForm" %>
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
                            <legend>MTCU Approval Form</legend>
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
                                <asp:DropDownList ID="DepartmentAbbrev" class="col-sm-2 form-control" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="DepartmentAbbrev_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="DepartmentAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Program Short Form</label>
                                <asp:DropDownList ID="ProgramAbbrevDDL" class="col-sm-2 form-control" runat="server" Width="300px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="ProgramAbbrevDDL" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Request for Funding Form</label>
                                <asp:FileUpload ID="MTCURequestUp" class="col-sm-2 form-control" runat="server" Width="300px"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMTCURequest" class="col-sm-2" runat="server" ErrorMessage="Upload a File" ControlToValidate="MTCURequestUp" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Decision</label>
                                <asp:RadioButton ID="MTCUApproved" Text="Approved" GroupName="RG3" class="RadioButton" runat="server" Checked="true" />
                                <asp:RadioButton ID="MTCUNotApproved" Text="Not Approved" GroupName="RG3" class="RadioButton" runat="server" />
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Date of Response</label>
                                <asp:TextBox ID="ResponseTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorResponse" class="col-sm-2" runat="server" ErrorMessage="Incorrect Date, Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="ResponseTxtBox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorResponse" class="col-sm-2" runat="server" ErrorMessage="Enter a Date" ControlToValidate="ResponseTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                             <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Funding Approval Letter</label>
                                <asp:FileUpload ID="FundingApprovalUp" class="col-sm-2 form-control" runat="server" Width="300px"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFundingApproval" class="col-sm-2" runat="server" ErrorMessage="Upload a File" ControlToValidate="FundingApprovalUp" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Funding Code</label>
                                <asp:TextBox ID="FundingCodeTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFCode" class="col-sm-2" runat="server" ErrorMessage="Enter the Funding Code" ControlToValidate="FundingCodeTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Funding Name</label>
                                <asp:TextBox ID="FundingNameTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFName" class="col-sm-2" runat="server" ErrorMessage="Enter the Funding Name" ControlToValidate="FundingNameTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div><div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>APS Code</label>
                                <asp:TextBox ID="APSCodeTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAPSC" class="col-sm-2" runat="server" ErrorMessage="Enter an APS Code" ControlToValidate="APSCodeTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div><div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>APS Name</label>
                                <asp:TextBox ID="APSNameTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAPSN" class="col-sm-2" runat="server" ErrorMessage="Enter an APS Name" ControlToValidate="APSNameTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminMTCUSubmitBtn" runat="server" Text="Submit" Style="height: 40px; width: 150px; padding: 0px" OnClick="AdminMTCUSubmitBtn_Click" />
                            </div>
                        </fieldset>
                    </div>
                </div>
      
            </div>
</asp:Content>

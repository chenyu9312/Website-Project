<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PEQABReportForm.aspx.cs" Inherits="ProgramInformationApplication.PEQABReportForm" %>
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
                            <legend>PEQAB Report Form</legend>
                            <p><span style="color: red; font-size: 18px">*</span>Indicates Required Fields</p>
                            <br />
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>School Short Form</label>
                                <asp:DropDownList ID="SchoolAbbrev" class="col-sm-2 form-control" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="SchoolAbbrev_SelectedIndexChanged" >
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
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>PEQAB Report</label>
                                <asp:FileUpload ID="PEQABReportUp" class="col-sm-2 form-control" runat="server" Width="300px"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPEQABR" class="col-sm-2" runat="server" ErrorMessage="Upload a File" ControlToValidate="PEQABReportUp" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>PEQAB Decision</label>
                                <asp:FileUpload ID="PEQABDecisionUp" class="col-sm-2 form-control" runat="server" Width="300px"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPEQABD" class="col-sm-2" runat="server" ErrorMessage="Upload a File" ControlToValidate="PEQABDecisionUp" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>MTCU Date of Response</label>
                                <asp:TextBox ID="ResponseTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorResponse" class="col-sm-2" runat="server" ErrorMessage="Incorrect Date, Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="ResponseTxtBox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorResponse" class="col-sm-2" runat="server" ErrorMessage="Enter a Date" ControlToValidate="ResponseTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminPEQABSubmitBtn" runat="server" Text="Submit" Style="height: 40px; width: 150px; padding: 0px" OnClick="AdminPEQABSubmitBtn_Click" />
                            </div>
                        </fieldset>
                    </div>
                </div>
        
            </div>
</asp:Content>

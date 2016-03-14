<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddCoordinatorInfo.aspx.cs" Inherits="ProgramInformationApplication.AddCoordinatorInfo" %>
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
                            <legend>Coordinator Information</legend>
                            <p><span style="color: red; font-size: 18px">*</span>Indicates Required Fields</p>
                            <br />
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>School Short Form</label>
                                <asp:DropDownList ID="SchoolAbbrev" AutoPostBack="true" class="col-sm-2 form-control" runat="server" Width="300px" OnSelectedIndexChanged="SchoolAbbrev_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldSAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="SchoolAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Department Short Form</label>
                                <asp:DropDownList ID="DepartmentAbbrev" AutoPostBack="true" class="col-sm-2 form-control" runat="server" Width="300px" OnSelectedIndexChanged="DepartmentAbbrev_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="DepartmentAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Program Code</label>
                                <asp:DropDownList ID="ProgramCode" class="col-sm-2 form-control" runat="server" Width="300px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPCode" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="ProgramCode" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Coordinator First Name</label>
                                <asp:TextBox ID="CoordinatorFirstTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCoFirst" runat="server" class="col-sm-6" ErrorMessage="Coordinator First Name is required" ControlToValidate="CoordinatorFirstTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorCoFirst" runat="server" ErrorMessage="Letters Only" ControlToValidate="CoordinatorFirstTxtBox" class="col-sm-3" ValidationExpression="[a-zA-Z ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Coordinator Last Name</label>
                                <asp:TextBox ID="CoordinatorLastTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCoLast" runat="server" class="col-sm-6" ErrorMessage="Coordinator Last Name Required" ControlToValidate="CoordinatorLastTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorCoLast" runat="server" ErrorMessage="Letters Only" ControlToValidate="CoordinatorLastTxtBox" class="col-sm-3" ValidationExpression="[a-zA-Z ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Coordinator Start Date</label>
                                <asp:TextBox ID="StartDateTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDate" class="col-sm-2" runat="server" ErrorMessage="Incorrect Date, Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="StartDateTxtbox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Coordinator End Date</label>
                                <asp:TextBox ID="EndDateTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEDate" class="col-sm-2" runat="server" ErrorMessage="Incorrect Date, Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="StartDateTxtbox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Acting</label>
                                <asp:CheckBox ID="ActingCkBox" runat="server" />
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Description</label>
                                <asp:TextBox ID="DescriptionTxtbox" class="col-sm-3 form-control" placeholder="Chair Description" Width="300px" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminCoordinatorSubmitBtn" runat="server" Text="Submit" style="height:40px; width:150px; padding:0px" OnClick="AdminCoordinatorSubmitBtn_Click" />
                             </div>
                        </fieldset>
                    </div>
                </div>
       
            </div>
</asp:Content>

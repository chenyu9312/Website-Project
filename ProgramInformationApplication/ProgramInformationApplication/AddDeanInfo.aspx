<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddDeanInfo.aspx.cs" Inherits="ProgramInformationApplication.AddDeanInfo" %>
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
                            <legend>Dean Information</legend>
                            <p><span style="color: red; font-size: 18px">*</span>Indicates Required Fields</p>
                            <br />
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>School Short Form</label>
                                <asp:DropDownList ID="SchoolAbbrev" class="col-sm-2 form-control" runat="server" Width="300px" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldSAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="SchoolAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Dean First Name</label>
                                <asp:TextBox ID="DeanFirstTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDFirst" runat="server" class="col-sm-6" ErrorMessage="Required" ControlToValidate="DeanFirstTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorDFirst" runat="server" ErrorMessage="Letters Only" ControlToValidate="DeanFirstTxtBox" class="col-sm-3" ValidationExpression="[a-zA-Z ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Dean Last Name</label>
                                <asp:TextBox ID="DeanLastTxtBox" class="col-sm-3 form-control" Width="300px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDLast" runat="server" class="col-sm-6" ErrorMessage="Required" ControlToValidate="DeanLastTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorDLast" runat="server" ErrorMessage="Letters Only" ControlToValidate="DeanLastTxtBox" class="col-sm-3" ValidationExpression="[a-zA-Z ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Dean Start Date</label>
                                <asp:TextBox ID="StartDateTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorSDate" class="col-sm-2" runat="server" ErrorMessage="Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="StartDateTxtbox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Dean End Date</label>
                                <asp:TextBox ID="EndDateTxtBox" class="col-sm-3 form-control" Width="300px" placeholder="MM/DD/YYYY" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEDate" runat="server" class="col-sm-4" ErrorMessage="Dean End Date Required" ControlToValidate="EndDateTxtBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEDate" class="col-sm-2" runat="server" ErrorMessage="Follow (MM/DD/YYYY)" BorderColor="White" ValidationExpression="^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" ControlToValidate="EndDateTxtbox" BorderStyle="Solid" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Acting</label>
                                <asp:CheckBox ID="ActingCkBox" runat="server" />
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Description</label>
                                <asp:TextBox ID="DescriptionTxtbox" class="col-sm-3 form-control" placeholder="Dean Description" Width="300px" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminDeanSubmitBtn" runat="server" Text="Submit" style="height:40px; width:150px; padding:0px" OnClick="AdminDeanSubmitBtn_Click"  />
                             </div>
                        </fieldset>
                    </div>
                </div>
        
            </div>
</asp:Content>

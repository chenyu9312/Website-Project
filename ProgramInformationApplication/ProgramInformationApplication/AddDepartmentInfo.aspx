<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddDepartmentInfo.aspx.cs" Inherits="ProgramInformationApplication.AddDepartmentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
     <div class="container">
                <div class="row">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Department Information</legend>
                            <p><span style="color: red; font-size: 18px">*</span>Indicates Required Fields</p>
                            <br />
                            <div class=" row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>School Short Form</label>
                                <asp:DropDownList ID="SchoolAbbrev" class="col-sm-2 form-control" runat="server" Width="300px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldSAbbrev" class="col-sm-2" runat="server" ErrorMessage="Select an Option" ControlToValidate="SchoolAbbrev" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Department Short Form</label>
                                <asp:TextBox ID="DepartmentAbbrevTxtbox" class="col-sm-3 form-control" Width="300px" placeholder="Department Abbrev" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDAbbrev" class="col-sm-4" runat="server" ErrorMessage="Department Name Short Form Required" ControlToValidate ="DepartmentAbbrevTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Full Department Name</label>
                                <asp:TextBox ID="DepartmentNameTxtbox" class="col-sm-3 form-control" Width="300px" placeholder="Department Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDName" class="col-sm-4" runat="server" ErrorMessage="Department Name Required" ControlToValidate ="DepartmentNameTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                             <div class="row form-group">
                                <label class="col-sm-2 control-label">Description</label>
                                <asp:TextBox ID="DescriptionTxtbox" class="col-sm-3 form-control" placeholder="Dean Description" Width="300px" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminDepartmentSubmitBtn" runat="server" Text="Submit" style="height:40px; width:150px; padding:0px" OnClick="AdminDepartmentSubmitBtn_Click"/>
                             </div>
                        </fieldset>
                    </div>
                </div>
        <div>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </div>
            </div>
</asp:Content>

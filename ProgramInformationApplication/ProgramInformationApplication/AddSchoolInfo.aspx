<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddSchoolInfo.aspx.cs" Inherits="ProgramInformationApplication.AddSchoolInfo" %>
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
                            <legend>School Information</legend>
                            <p><span style="color: red; font-size: 18px">*</span>Indicates Required Fields</p>
                            <br />
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>School Short Form</label>
                                <asp:TextBox ID="SchoolAbbrevTxtbox" class="col-sm-3 form-control" Width="300px" placeholder="School Abbrev" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSAbbrev" class="col-sm-4" runat="server" ErrorMessage="School Name Short Form Required" ControlToValidate ="SchoolAbbrevTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Full School Name</label>
                                <asp:TextBox ID="SchoolNameTxtbox" class="col-sm-3 form-control" Width="300px" placeholder="School Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSName" class="col-sm-4" runat="server" ErrorMessage="School Name Required" ControlToValidate ="SchoolNameTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-2 control-label">Description</label>
                                <asp:TextBox ID="DescriptionTxtbox" class="col-sm-3 form-control" placeholder="School Description" Width="300px" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-7 control-label">
                                <asp:Button ID="AdminSchoolInfobtnSubmit" runat="server" Text="Submit" style="height:40px; width:150px; padding:0px" OnClick="AdminSchoolInfobtnSubmit_Click" />
                             </div>
                        </fieldset>
                    </div>
                </div>
        
            </div>
</asp:Content>

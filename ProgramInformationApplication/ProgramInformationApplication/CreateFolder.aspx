<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CreateFolder.aspx.cs" Inherits="ProgramInformationApplication.CreateFolder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Create Folder in Program Folders</legend>
                    <br />
                    <div class="row form-group">
                        <label class="col-sm-2 control-label">Folder Name</label>
                        <asp:TextBox ID="FolderNameTxtBox" class="col-sm-3 form-control" Width="300px" runat="server" TabIndex="1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldFolderName" class="col-sm-2" runat="server" ErrorMessage="Enter a Name for the Folder" ControlToValidate="FolderNameTxtBox" Display="Dynamic" ViewStateMode="Inherit" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-sm-7 control-label">
                        <asp:Button ID="AdminFolderSubmitBtn" runat="server" Text="Submit" Style="height: 40px; width: 150px; padding: 0px" OnClick="AdminFolderSubmitBtn_Click" />
                    </div>
                </fieldset>
            </div>
        </div>
        <div>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

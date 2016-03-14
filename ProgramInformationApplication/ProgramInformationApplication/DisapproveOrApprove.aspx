<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DisapproveOrApprove.aspx.cs" Inherits="ProgramInformationApplication.DisapproveOrApprove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Approve Or Disapprove Pending Programs</legend>
                    <br />
                    <div class="row form-group">
                        <label class="col-sm-2 control-label">Pending Programs</label>
                        <asp:ListBox ID="PendingLbox" runat="server"></asp:ListBox>
                    </div>
                    <br />
                    <div class="col-sm-7 control-label">
                        <asp:Button ID="AdminApproveSubmitBtn" runat="server" Text="Approve Program" Style="height: 40px; width: 200px; padding:0px; margin-right:20px" OnClick="AdminApproveSubmitBtn_Click"/>
                        <asp:Button ID="AdminDisapproveSubmitBtn" runat="server" Text="Disapprove Program" Style="height: 40px; width: 200px; padding: 0px" Visible="false" OnClick="AdminDisapproveSubmitBtn_Click"/>
                    </div>
                </fieldset>
            </div>
        </div>
        <div>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

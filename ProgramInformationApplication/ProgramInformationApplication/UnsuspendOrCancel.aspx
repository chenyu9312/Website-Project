<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UnsuspendOrCancel.aspx.cs" Inherits="ProgramInformationApplication.Unsuspend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Unsuspend Programs</legend>
                    <br />
                    <div class="row form-group">
                        <label class="col-sm-2 control-label">Suspended Programs</label>
                        <asp:ListBox ID="SuspendedLbox" runat="server" AutoPostBack="true"></asp:ListBox>
                    </div>
                    <div class="col-sm-7 control-label">
                        <asp:Button ID="AdminUnsuspendSubmitBtn" runat="server" Text="Unsuspend Program" Style="height: 40px; width: 200px; padding: 0px; margin-right:15px" OnClick="AdminUnsuspendSubmitBtn_Click" />
                        <asp:Button ID="AdminCanceleSubmitBtn" runat="server" Text="Cancel Program" Style="height: 40px; width: 200px; padding: 0px" OnClick="AdminCanceleSubmitBtn_Click"/>
                    </div>
                </fieldset>
            </div>
        </div>
        <div>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SuspendOrCancel.aspx.cs" Inherits="ProgramInformationApplication.SuspendOrCancel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Suspend Or Cancel Programs</legend>
                    <br />
                    <div class="row form-group">
                        <label class="col-sm-2 control-label">Current Programs</label>
                        <asp:ListBox ID="CurrentLbox" runat="server" AutoPostBack="true"></asp:ListBox>
                    </div>
                    <div class="row form-group">
                                <label class="col-sm-2 control-label"><span style="color: red; font-size: 18px">*</span>Reason</label>
                                <asp:TextBox ID="ReasonTxtbox" class="col-sm-3 form-control" Width="450px" placeholder="The Reason This Program is Suspended or Canceled is..." runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorReason" class="col-sm-4" runat="server" ErrorMessage="A Reason for This Action is Required" ControlToValidate ="ReasonTxtbox" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                    <div class="col-sm-7 control-label">
                        <asp:Button ID="AdminSuspendSubmitBtn" runat="server" Text="Suspend Program" Style="height: 40px; width: 200px; padding:0px; margin-right:20px" OnClick="AdminSuspendSubmitBtn_Click"  />
                        <asp:Button ID="AdminCanceleSubmitBtn" runat="server" Text="Cancel Program" Style="height: 40px; width: 200px; padding: 0px" OnClick="AdminCanceleSubmitBtn_Click" />
                    </div>
                </fieldset>
            </div>
        </div>
        <div>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

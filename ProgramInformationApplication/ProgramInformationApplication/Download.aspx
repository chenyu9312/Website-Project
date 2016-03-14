<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="ProgramInformationApplication.Download" %>

<%@ Register Src="~/UserGridView.ascx" TagPrefix="uc1" TagName="UserGridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
                <div class="row">
                    <div class="form-horizontal">
                        <fieldset>
                            <legend>Download</legend>
                            <br />
                            <div>
                                <uc1:UserGridView runat="server" id="UserGridView" HomeFolder="~/Upload"/>
                            </div>
                        </fieldset>
                    </div>
                </div>
        <div>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </div>
            </div>
</asp:Content>

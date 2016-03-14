<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProgramInformationApplication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Home Page</h2>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                            <i class="fa fa-square fa-stack-2x text-primary"></i>
                            <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Add a Program</h4>
                        <a href="AddProgram.aspx" class="btn btn-primary">Add</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                            <i class="fa fa-square fa-stack-2x text-primary"></i>
                            <i class="fa fa-download fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Create Folders</h4>
                        <a href="CreateFolder.aspx" class="btn btn-primary">Create</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                            <i class="fa fa-square fa-stack-2x text-primary"></i>
                            <i class="fa fa-user-plus fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>CVS Approval</h4>
                        <a href="CVSApprovalForm.aspx" class="btn btn-primary">Move to Page</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                            <i class="fa fa-square fa-stack-2x text-primary"></i>
                            <i class="fa fa-database fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>About Us</h4>
                        <a href="AboutUs.aspx" class="btn btn-primary">Move to Page</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

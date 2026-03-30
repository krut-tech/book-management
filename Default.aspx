<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="book_management.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-wrapper">
        <div class="header-banner">
            📚 Welcome to Book Management System
        </div>

        <h1>Dashboard Overview</h1>

        <!-- DASHBOARD CARDS -->
        <div class="dashboard">

            <div class="card">
                <h2>Authors</h2>
                <span>
                    <asp:Label ID="lblAuthor" runat="server" /></span>
            </div>

            <div class="card">
                <h2>Categories</h2>
                <span>
                    <asp:Label ID="lblCategory" runat="server" /></span>
            </div>

            <div class="card">
                <h2>Books</h2>
                <span>
                    <asp:Label ID="lblBook" runat="server" /></span>
            </div>

        </div>



    </div>

</asp:Content>

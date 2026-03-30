<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" 
AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="book_management.AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="page-wrapper">

    <h2>Add Book</h2>

    <div class="form-box">

        <!-- 🔥 VALIDATION SUMMARY -->
        <asp:ValidationSummary 
            runat="server" 
            ForeColor="Red"
            HeaderText="⚠ Please fix these errors:"
        />

        <div class="form-grid">

            <!-- BOOK NAME -->
            <div class="full">
                <label>Book Name</label>
                <asp:TextBox ID="txtBook" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator 
                    ControlToValidate="txtBook"
                    ErrorMessage="Book Name Required"
                    Display="None"
                    runat="server" />
            </div>

            <!-- AUTHOR -->
            <div>
                <label>Author</label>
                <asp:DropDownList ID="ddlAuthor" runat="server"></asp:DropDownList>

                <asp:RequiredFieldValidator 
                    ControlToValidate="ddlAuthor"
                    InitialValue="0"
                    ErrorMessage="Select Author"
                    Display="None"
                    runat="server" />
            </div>

            <!-- CATEGORY -->
            <div>
                <label>Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>

                <asp:RequiredFieldValidator 
                    ControlToValidate="ddlCategory"
                    InitialValue="0"
                    ErrorMessage="Select Category"
                    Display="None"
                    runat="server" />
            </div>

            <!-- PRICE -->
            <div class="full">
                <label>Price</label>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator 
                    ControlToValidate="txtPrice"
                    ErrorMessage="Price Required"
                    Display="None"
                    runat="server" />

                <asp:RangeValidator 
                    ControlToValidate="txtPrice"
                    MinimumValue="1"
                    MaximumValue="10000"
                    Type="Double"
                    ErrorMessage="Price must be between 1–10000"
                    Display="None"
                    runat="server" />
            </div>

            <!-- BUTTON -->
            <div class="full">
                <asp:Button ID="btnSave" runat="server" 
                    Text="Save Book" 
                    OnClick="btnSave_Click" />
            </div>

        </div>

    </div>

</div>

<!-- 📊 TABLE -->
<div class="table-container">
    <h3>📚 Book List</h3>

    <asp:GridView ID="gvBook" runat="server" AutoGenerateColumns="false" CssClass="grid">
        <Columns>
            <asp:BoundField DataField="BookID" HeaderText="Book ID" />
            <asp:BoundField DataField="BookName" HeaderText="Book Name" />
            <asp:BoundField DataField="AuthorName" HeaderText="Author" />
            <asp:BoundField DataField="CategoryName" HeaderText="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
        </Columns>  
    </asp:GridView>
</div>

</asp:Content>
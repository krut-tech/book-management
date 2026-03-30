<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddAuthor.aspx.cs" Inherits="book_management.AddAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add Author</h2>


<div class="form-box">

    <h2>Add Author</h2>

    <label>Author Name</label>
    <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>

    <asp:RequiredFieldValidator ControlToValidate="txtAuthor"
        ErrorMessage="Author Required" ForeColor="Red" runat="server" />

    <asp:Button ID="btnSave" runat="server" Text="Save Author" OnClick="btnSave_Click" />

</div>
    <div class="table-container">
<asp:GridView ID="gvAuthor" runat="server" CssClass="grid" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="AuthorID" HeaderText="Author ID" />
        <asp:BoundField DataField="AuthorName" HeaderText="Author Name" />
    </Columns>
</asp:GridView>
        </div>
</asp:Content>

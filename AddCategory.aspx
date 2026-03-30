<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="book_management.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-box">

        <h2>Add Category</h2>

        <label>Category Name</label>
        <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>

        <asp:RequiredFieldValidator
            ControlToValidate="txtCategory"
            ErrorMessage="Category Required"
            ForeColor="Red"
            runat="server" />

        <asp:Button ID="btnSave" runat="server" Text="Save Category" OnClick="btnSave_Click" />

    </div>
    <div class="table-container">
        <asp:GridView ID="gvCategory" runat="server" CssClass="grid" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="CategoryID" HeaderText="Category ID" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>

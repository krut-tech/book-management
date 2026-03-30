<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="AddBook.aspx.cs"
    Inherits="book_management.AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="page-wrapper">

    <!-- FORM -->
    <div class="form-box">
        <h2>Add Book</h2>

        <div class="form-group">
            <label>Book Name</label>
            <asp:TextBox ID="txtBook" runat="server" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Author</label>
            <asp:DropDownList ID="ddlAuthor" runat="server" CssClass="input"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Category</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="input"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="input"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="btnSave" runat="server"
                Text="Save Book"
                CssClass="btn"
                OnClick="btnSave_Click" />
        </div>
    </div>

    <!-- TABLE -->
    <div class="table-container">
        <h3>Book List</h3>

        <asp:GridView ID="gvBook" runat="server"
            CssClass="grid"
            AutoGenerateColumns="false"
            DataKeyNames="BookID"
            OnRowEditing="gvBook_RowEditing"
            OnRowCancelingEdit="gvBook_RowCancelingEdit"
            OnRowUpdating="gvBook_RowUpdating"
            OnRowDeleting="gvBook_RowDeleting"
            OnRowDataBound="gvBook_RowDataBound">

            <Columns>

                <asp:BoundField DataField="BookID" HeaderText="ID" ReadOnly="true" />

                <asp:TemplateField HeaderText="Book Name">
                    <ItemTemplate>
                        <%# Eval("BookName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBookName" runat="server"
                            Text='<%# Bind("BookName") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Author">
                    <ItemTemplate>
                        <%# Eval("AuthorName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlAuthorEdit" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%# Eval("CategoryName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCategoryEdit" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <%# Eval("Price") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPriceEdit" runat="server"
                            Text='<%# Bind("Price") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />

            </Columns>

        </asp:GridView>
    </div>

</div>

</asp:Content>
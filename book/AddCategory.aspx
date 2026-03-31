<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs"
    Inherits="book_management.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="page-wrapper">

    <!-- FORM -->
    <div class="form-box">
        <h2>Add Category</h2>

        <div class="form-group">
            <label>Category Name</label>
            <asp:TextBox ID="txtCategory" runat="server" CssClass="input"></asp:TextBox>

            <asp:RequiredFieldValidator
                ControlToValidate="txtCategory"
                ErrorMessage="Category Required"
                ForeColor="Red"
                runat="server" />
        </div>

        <div class="form-group">
            <asp:Button ID="btnSave" runat="server"
                Text="Save Category"
                CssClass="btn"
                OnClick="btnSave_Click" />
        </div>
    </div>

    <!-- TABLE -->
    <div class="table-container">
        <h3>Category List</h3>

       <asp:GridView ID="gvCategory" runat="server"
    CssClass="grid"
    AutoGenerateColumns="false"
    DataKeyNames="CategoryID"
    OnRowEditing="gvCategory_RowEditing"
    OnRowCancelingEdit="gvCategory_RowCancelingEdit"
    OnRowUpdating="gvCategory_RowUpdating"
    OnRowDeleting="gvCategory_RowDeleting">

    <Columns>

        <%-- ID --%>
        <asp:BoundField DataField="CategoryID" HeaderText="ID" ReadOnly="true" />

        <%-- CATEGORY NAME --%>
        <asp:TemplateField HeaderText="Category Name">
            <ItemTemplate>
                <%# Eval("CategoryName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtCategoryName" runat="server"
                    Text='<%# Bind("CategoryName") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

       
<asp:TemplateField>
    <ItemTemplate>
        <asp:LinkButton runat="server"
            CommandName="Edit"
            Text="Edit"
            CssClass="btn-edit"
            CausesValidation="false" />

        &nbsp;

        <asp:LinkButton runat="server"
            CommandName="Delete"
            Text="Delete"
            CssClass="btn-delete"
            CausesValidation="false"
            OnClientClick="return confirm('Delete?');" />
    </ItemTemplate>

    <EditItemTemplate>
        <asp:LinkButton runat="server"
            CommandName="Update"
            Text="Update"
            CssClass="btn-update"
            CausesValidation="false" />

        &nbsp;

        <asp:LinkButton runat="server"
            CommandName="Cancel"
            Text="Cancel"
            CssClass="btn-cancel"
            CausesValidation="false" />
    </EditItemTemplate>
</asp:TemplateField>
    </Columns>

</asp:GridView>
    </div>

</div>

</asp:Content>
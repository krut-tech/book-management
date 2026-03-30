<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="AddAuthor.aspx.cs"
    Inherits="book_management.AddAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-wrapper">

        <!-- FORM -->
        <div class="form-box">

            <h2>Add Author</h2>

            <div class="form-group">
                <label>Author Name</label>
                <asp:TextBox ID="txtAuthor" runat="server" CssClass="input"></asp:TextBox>

                <asp:RequiredFieldValidator
                    ControlToValidate="txtAuthor"
                    ErrorMessage="Author Required"
                    ForeColor="Red"
                    runat="server" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnSave" runat="server"
                    Text="Save Author"
                    CssClass="btn"
                    OnClick="btnSave_Click" />
            </div>

        </div>

        <!-- TABLE -->
        <div class="table-container">

            <h3>Author List</h3>
<asp:GridView ID="gvAuthor" runat="server"
    AutoGenerateColumns="false"
    CssClass="grid"
    DataKeyNames="AuthorID"

    OnRowEditing="gvAuthor_RowEditing"
    OnRowCancelingEdit="gvAuthor_RowCancelingEdit"
    OnRowUpdating="gvAuthor_RowUpdating"
    OnRowDeleting="gvAuthor_RowDeleting">

    <Columns>

        <asp:BoundField DataField="AuthorID" HeaderText="ID" ReadOnly="true" />

        <asp:TemplateField HeaderText="Author Name">
            <ItemTemplate>
                <%# Eval("AuthorName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtAuthorName" runat="server"
                    Text='<%# Bind("AuthorName") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="true" CausesValidation="false" />

       
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton runat="server"
                    CommandName="Delete"
                    Text="Delete"
                    CausesValidation="false"
                    ForeColor="Red"
                    OnClientClick="return confirm('Delete this author?');" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

        </div>

    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="AddBook.aspx.cs"
    Inherits="book_management.AddBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .page-wrapper {
            padding: 20px;
        }

        .form-box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .input {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            background: linear-gradient(to right,#007bff,#00c6ff);
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 5px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

            .grid th {
                background: #007bff;
                color: white;
                padding: 10px;
            }

            .grid td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

        .btn-delete {
            background: red;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .btn-edit {
            background: blue;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .btn-update {
            background: green;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .btn-cancel {
            background: gray;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }
    </style>

    <div class="page-wrapper">

        <!-- FORM -->
        <div class="form-box">
            <h2>Add Book</h2>

            <!-- Validation Summary -->
            <asp:ValidationSummary ID="vs" runat="server"
                ForeColor="Red"
                HeaderText="Please fix these errors:" />

            <div class="form-group">
                <label>Book Name</label>
                <asp:TextBox ID="txtBook" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtBook"
                    ErrorMessage="Book Name required"
                    ForeColor="Red" />
            </div>

            <div class="form-group">
                <label>Author</label>
                <asp:DropDownList ID="ddlAuthor" runat="server" CssClass="input"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="ddlAuthor"
                    InitialValue="0"
                    ErrorMessage="Select Author"
                    ForeColor="Red" />
            </div>

            <div class="form-group">
                <label>Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="input"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="ddlCategory"
                    InitialValue="0"
                    ErrorMessage="Select Category"
                    ForeColor="Red" />
            </div>

            <div class="form-group">
                <label>Price</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="input"></asp:TextBox>

                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtPrice"
                    ErrorMessage="Price required"
                    ForeColor="Red" />

                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="txtPrice"
                    ValidationExpression="^\d+(\.\d{1,2})?$"
                    ErrorMessage="Enter valid price"
                    ForeColor="Red" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnSave" runat="server"
                    Text="Save Book"
                    CssClass="btn"
                    OnClick="btnSave_Click"
                    CausesValidation="true" />
            </div>
        </div>

        <!-- TABLE -->
        <div class="form-box">
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
                        <ItemTemplate><%# Eval("BookName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBookName" runat="server"
                                Text='<%# Bind("BookName") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Author">
                        <ItemTemplate><%# Eval("AuthorName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlAuthorEdit" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate><%# Eval("CategoryName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCategoryEdit" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate><%# Eval("Price") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPriceEdit" runat="server"
                                Text='<%# Bind("Price") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Actions">
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
            OnClientClick="return confirm('Delete this book?');" />
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

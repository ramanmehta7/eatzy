<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="Eatzy.signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form2" runat="server">
        <section class="center">
            <div class="inCard">
                <img src="resources/img/download.png" />
            </div>

            <table style="margin-top:-25px;" class="inCardTable">
                <tr>
                    <td>
                        <asp:Label CssClass="label-design" runat="server" for="usernameInput">Username:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="usernameInput" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="usernameRequiredFieldValidator" runat="server" 
                        Style="color: red" 
                        ErrorMessage="*Username is required" Display="Dynamic" ControlToValidate="usernameInput">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label-design" runat="server" for="nameInput">Name:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="nameInput" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="nameRequiredFieldValidator" runat="server" 
                        Style="color: red" 
                        ErrorMessage="*Name is required" Display="Dynamic" ControlToValidate="nameInput">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label-design" runat="server" for="emailInput">Email:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="emailInput" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" 
                        Style="color: red" 
                        ErrorMessage="*Email is required" Display="Dynamic" ControlToValidate="emailInput">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        Style="color: red"   
                        ErrorMessage="*Invalid Email" Display="Dynamic" ControlToValidate="emailInput"   
                        ValidationExpression="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label-design" runat="server" for="passwordInput">Password:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="passwordInput" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" 
                        Style="color: red" 
                        ErrorMessage="*Password is required" Display="Dynamic" ControlToValidate="passwordInput">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <asp:Button ID="loginButton" OnClick="loginButton_Click" CausesValidation="false" UseSubmitBehavior="false" CssClass="btn btn-primary" Width="100%" runat="server" Text="Exists? Login" ToolTip="Login"/>                        
                    </td>
                    <td style="padding-top: 10px;">
                        <asp:Button ID="submitButton" OnClick="submitButton_Click" UseSubmitBehavior="true" CssClass="btn btn-success" Width="100%" runat="server" Text="Submit" ToolTip="Submit"/>
                    </td>
                </tr>
        </table>
    </section>
    </form>
</body>
</html>

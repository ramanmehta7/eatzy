<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Eatzy.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</head>
<body>

<form id="form1" runat="server">
    <section class="center">
        <div class="inCard">
            <img src="resources/img/download.png" />
        </div>

        <table class="inCardTable">
                <tr>
                    <td>
                        <asp:Label CssClass="label-design" runat="server" for="usernameInput">Username:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="usernameInput" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="usernameRequiredFieldValidator" runat="server" 
                        Style="color: red" 
                        ErrorMessage="*Username is empty!" Display="Dynamic" ControlToValidate="usernameInput">
                        </asp:RequiredFieldValidator>
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
                        ErrorMessage="*password is empty!" Display="Dynamic" ControlToValidate="passwordInput">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <asp:Button ID="signinButton" OnClick="SigninButton_Click" CausesValidation="false" UseSubmitBehavior="false" CssClass="btn btn-primary" Width="100%" runat="server" Text="New? Sign in" ToolTip="Sign in"/>                        
                    </td>
                    <td style="padding-top: 10px;">
                        <asp:Button ID="loginButton" onClick="loginButton_Click" UseSubmitBehavior="true" CssClass="btn btn-success" Width="100%" runat="server" Text="Login" ToolTip="Login"/>
                    </td>
                </tr>
            </table>
    </section>
</form>
</body>
</html>

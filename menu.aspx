<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Eatzy.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu</title>
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,300&display=swap" rel="stylesheet" />
</head>
<body style="background-color: white !important">
    <form id="form3" runat="server">
         <section>
             <div class="header">
                 <img src="resources/img/1818e8d5d4cffec4654bae8fb91f9acf.jpg" width="1380"/>
                 <div class="eatzy">
                    <h1>Eatzy.</h1>
                    <h5>Eat Easy.</h5>
                </div>
             </div>

             <div class="user-greeting">
                 <h1>Hello, <%= Session["Name"] %></h1>
             </div>

             <div class="total">
                 <h3>Total Amount: ₹<span id="totalAmount"><%= totalAmount %></span>/-</h3>
                 <asp:button runat="server" ID="checkoutButton" OnClick="checkoutBtn_Click" cssClass="btn btn-danger total-button" Text="Check Out!"></asp:button>
             </div>

             <div class="search">
                 <asp:TextBox runat="server" ID="searchTextBox" placeholder="Bill Number"></asp:TextBox>
                 <br />
                 <asp:button runat="server" ID="myOrdersButton" cssClass="btn btn-info myOrder-button" OnClick="myOrdersBtn_Click" Text="My Orders"></asp:button>
                 <asp:button runat="server" ID="searchButton" cssClass="btn btn-dark search-button" OnClick="searchBtn_Click" Text="Search"></asp:button>
             </div>
             
            <div class="menu">
                <h1>Menu</h1>
                
                <div class="menu-item">
                    <img src="resources/img/Tandoori-Soya-Chaap-3.jpg" />
                    <h2>Chaap</h2>
                    <h4>₹250/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Chaap,250" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/KadaiPaneer1.jpg" />
                    <h2>Kadai Paneer</h2>
                    <h4>₹300/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="KadaiPaneer,300" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/Dal-Makhani-New-3.jpg" />
                    <h2>Dal Makhani</h2>
                    <h4>₹230/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="DalMakhani,230" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/download.jfif"/>
                    <h2>Pizza</h2>
                    <h4>₹450/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Pizza,450" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/190524-classic-american-cheeseburger-ew-207p.jpg" />
                    <h2>Burger</h2>
                    <h4>₹150/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Burger,150" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/Espaguetis_carbonara.jpg" />
                    <h2>Carbonara</h2>
                    <h4>₹400/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Carbonara,400" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/Italian_Risotto.png" />
                    <h2>Risotto</h2>
                    <h4>₹350/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Risotto,350" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/fava-ravioli-bowl2.jpg" />
                    <h2>Ravioli</h2>
                    <h4>₹350/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Ravioli,350" Text="+Add"></asp:button>
                </div>

                <div class="menu-item">
                    <img src="resources/img/chinese-fried-noodles-basic-recipe-2.jpg" />
                    <h2>Noodles</h2>
                    <h4>₹250/-</h4>
                    <asp:button runat="server" CssClass="btn btn-primary add-button" OnClick="addBtnClick" CommandArgument="Noodles,250" Text="+Add"></asp:button>
                </div>

                <div class="menu-item" style="border: none !important;"></div>
                <p class="cp-text">
                    &nbsp;&nbsp;&nbsp;© Copyright 2021 Eatzy. Raman Mehta.
                </p>

            </div>


         </section>
    </form>

    <script type="text/javascript">
        $(document).ready(() => {
            //
        });
    </script>
</body>
</html>

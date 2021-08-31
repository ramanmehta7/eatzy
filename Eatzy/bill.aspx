<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="Eatzy.bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill</title>
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
    <script type="text/javascript">

        function incBtn(thisRef, price) {
            
            let btnId = thisRef.id;
            let textBoxId = "Qty" + btnId.slice(0, btnId.length - 3);

            let textBoxValue = $("#" + textBoxId).val();
            let totalAmount = document.getElementById("totalAmount").innerHTML;
            totalAmount = totalAmount.slice(1, totalAmount.length - 2);
            totalAmount = Number(totalAmount) + Number(price);
            $("#" + textBoxId).val(Number(textBoxValue) + 1);
            document.getElementById("totalAmount").innerHTML = "₹" + totalAmount + "/-";
        }

        function decBtn(thisRef, price) {
            
            let btnId = thisRef.id;
            let textBoxId = "Qty" + btnId.slice(0, btnId.length - 3);

            let textBoxValue = $("#" + textBoxId).val();
            let totalAmount = document.getElementById("totalAmount").innerHTML;
            totalAmount = totalAmount.slice(1, totalAmount.length - 2);

            if (textBoxValue > 1) {
                $("#" + textBoxId).val(Number(textBoxValue) - 1);
                totalAmount = Number(totalAmount) - Number(price);
                document.getElementById("totalAmount").innerHTML = "₹" + totalAmount + "/-";
            }
        }

        function getQty() {

            document.getElementById("QtyChaapHidden").value = $("#QtyChaap").val();
            document.getElementById("QtyKadaiPaneerHidden").value = $("#QtyKadaiPaneer").val();
            document.getElementById("QtyDalMakhaniHidden").value = $("#QtyDalMakhani").val();
            document.getElementById("QtyPizzaHidden").value = $("#QtyPizza").val();
            document.getElementById("QtyBurgerHidden").value = $("#QtyBurger").val();
            document.getElementById("QtyCarbonaraHidden").value = $("#QtyCarbonara").val();
            document.getElementById("QtyRisottoHidden").value = $("#QtyRisotto").val();
            document.getElementById("QtyRavioliHidden").value = $("#QtyRavioli").val();
            document.getElementById("QtyNoodlesHidden").value = $("#QtyNoodles").val();

            let totalAmount = document.getElementById("totalAmount").innerHTML;
            totalAmount = totalAmount.slice(1, totalAmount.length - 2);
            document.getElementById("totalAmountHidden").value = totalAmount;

            console.log(document.getElementById("QtyChaapHidden").value);
            console.log(document.getElementById("QtyKadaiPaneerHidden").value);
            console.log(document.getElementById("QtyDalMakhaniHidden").value);
            console.log(document.getElementById("QtyPizzaHidden").value);
            console.log(document.getElementById("QtyBurgerHidden").value);
            console.log(document.getElementById("QtyCarbonaraHidden").value);
            console.log(document.getElementById("QtyRisottoHidden").value);
            console.log(document.getElementById("QtyRavioliHidden").value);
            console.log(document.getElementById("QtyNoodlesHidden").value);
            console.log(document.getElementById("totalAmountHidden").value);

            return true;
        }
    </script>
</head>
<body>
    <form id="form4" runat="server">

        <asp:HiddenField ID="QtyChaapHidden" runat="server" />
        <asp:HiddenField ID="QtyKadaiPaneerHidden" runat="server" />
        <asp:HiddenField ID="QtyDalMakhaniHidden" runat="server" />
        <asp:HiddenField ID="QtyPizzaHidden" runat="server" />
        <asp:HiddenField ID="QtyBurgerHidden" runat="server" />
        <asp:HiddenField ID="QtyCarbonaraHidden" runat="server" />
        <asp:HiddenField ID="QtyRisottoHidden" runat="server" />
        <asp:HiddenField ID="QtyRavioliHidden" runat="server" />
        <asp:HiddenField ID="QtyNoodlesHidden" runat="server" />
        <asp:HiddenField ID="totalAmountHidden" runat="server" />

        <section class="center">
        <div class="inCard">
            <img src="resources/img/download.png" />
        </div>

        <div class="container inCardTable">
        
            <div id="billContainer" runat="server"></div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <asp:Label CssClass="label-design item-label" ID="totalLabel" runat="server">Total Amount:</asp:Label>
                </div>
                <div class="col-lg-6">
                    <asp:Label CssClass="label-design price-label float-end" ID="totalAmount" runat="server">₹<%= Session["totalAmount"] %>/-</asp:Label>
                </div>
            </div>
            <br />

            <div class="row">
                <div class="col-lg-12">
                    <asp:Button ID="orderBtn" CssClass="btn btn-danger order-btn" Width="100%" runat="server" OnClick="orderBtn_Click" OnClientClick="getQty(); return true;" Text="Confirm Order" ToolTip="order"/>                        
                </div>
            </div>
        </div>
    </section>
    </form>
</body>
</html>

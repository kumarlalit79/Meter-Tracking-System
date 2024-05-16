<%@ Page Title="" Language="C#" MasterPageFile="~/MTSMaster.master" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="mts_project.Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container table-responsive-md table-responsive-sm  table-hover">
         <table align="center" class="table-responsive-lg w-50 table shadow-lg w-75 rounded mt-5 border  table-bordered table-striped  border-dark mb-5">
    <caption style="caption-side:top; text-align:center;background-color:#EEEEEE;font-size:2rem ; color:white; background-color:#0802A3; border-top-left-radius:30px; border-top-right-radius:30px;" class="auto-style3 fw-bold text-center text-uppercase" >VIEW DETAILS</caption>
    <tr>
        <td  style="background-color:#e1f1f5;" class="headingss ">Account Number</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblAccNum" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>Name</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>Mobile Number</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblMobNum" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>Email Id</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblEmail" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>Bill Date</td>
        <td style="background-color:#e1f1f5"; class="auto-style1">
            <asp:Label ID="lblBillDate" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>Due Date</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblDueDate" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>From Date</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblFromDate" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>To Date</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblToDate" runat="server"></asp:Label>
        </td>
    </tr>
        
    <tr>
        <td  style="background-color:#e1f1f5"; class="auto-style2 headingss">Total Days</td>
        <td style="background-color:#e1f1f5"; class="auto-style2">
            <asp:Label ID="lblTotalDays" runat="server"></asp:Label>
        </td>
        <td  style="background-color:#e1f1f5"; class="auto-style2 headingss">Disconnection Date</td>
        <td style="background-color:#e1f1f5"; class="auto-style2">
            <asp:Label ID="lblDisconnectionDate" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>Previous RDG</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblPreviousRDG" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>Present RDG</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblPresentRGD" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>Total Billable Unit</td>
        <td style="background-color:#e1f1f5"; class="auto-style1">
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>View Bill</td>
        <td style="background-color:#e1f1f5";>
            <asp:LinkButton ID="lnbtnView" runat="server" >View Bill</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>Current&nbsp; Billable Amount</td>
        <td style="background-color:#e1f1f5"; class="auto-style1">
            <asp:Label ID="lblCurrentBill" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>Prev Balance</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblPrevBalance" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>Current LPS</td>
        <td style="background-color:#e1f1f5"; class="auto-style1">
            <asp:Label ID="lblCurrentLps" runat="server"></asp:Label>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>Total Bill</td>
        <td style="background-color:#e1f1f5";>
            <asp:Label ID="lblTotalBill" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headingss" style="background-color:#e1f1f5";>
            <asp:Label ID="lbldeposit" runat="server" Text="Bill Deposit Amount"></asp:Label>
        </td>
        <td style="background-color:#e1f1f5"; class="auto-style1">
            <asp:TextBox ID="txtdeposit" CssClass="form-control" runat="server"></asp:TextBox>
        </td>
        <td class="headingss" style="background-color:#e1f1f5";>
            <asp:Label ID="lbldepositDate" runat="server" Text="Bill Deposit Date"></asp:Label>
        </td>
        <td style="background-color:#e1f1f5";>
            <asp:TextBox ID="txtdepositdate" CssClass="form-control" runat="server" ></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style1" style="background-color:#e1f1f5";></td>
        <td style="background-color:#e1f1f5"; class="auto-style1">
        </td>
        <td class="auto-style1" style="background-color:#e1f1f5";>
            <asp:Button ID="btnDeposite" CssClass="btn btn-primary" runat="server"  Text="Save" />
        </td>

         &nbsp;&nbsp;
 <asp:Button ID="btnBack" Class="btn btn-lg btn-primary" runat="server" Text="Back"/>

        <td style="background-color:#e1f1f5"; class="auto-style1">
            </td>
    </tr>
    </table>
</div>
</asp:Content>

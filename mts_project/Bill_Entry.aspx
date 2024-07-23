<%@ Page Title="" Language="C#" MasterPageFile="~/MTSMaster.master" AutoEventWireup="true" CodeBehind="Bill_Entry.aspx.cs" Inherits="mts_project.Bill_Entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="icon" type="image/x-icon" href="img/MTS-Lobo.PNG">

    <script type="text/javascript">
        function validate() {
            var billDate = document.getElementById('<%=txtBillDate.ClientID %>').value;
            var dueDate = document.getElementById('<%=txtDueDate.ClientID %>').value;
            var fromDate = document.getElementById('<%=txtFromDate.ClientID %>').value;
            var toDate = document.getElementById('<%=txtToDate.ClientID %>').value;
            var disconnectionDate = document.getElementById('<%=txtDisconnected.ClientID %>').value;
            var previousRDG = document.getElementById('<%=txtPrevRDG.ClientID %>').value;
            var presentRDG = document.getElementById('<%=txtPresentRDG.ClientID %>').value;
        //var billUpld = document.getElementById('<%=FileUpload1.ClientID %>').value;
            var billAmt = document.getElementById('<%=txtBilableAmt.ClientID %>').value;
            var previousBalance = document.getElementById('<%=txtPrevBalance.ClientID %>').value;
            var currentLPS = document.getElementById('<%=txtCurrentLPS.ClientID %>').value;
            var totalBill = document.getElementById('<%=txtTotalBill.ClientID %>').value;

            if (billDate == "") {
                alert("Please enter Bill Date");
                return false;
            }
            if (dueDate == "") {
                alert("Please enter Due Date");
                return false;
            }
            if (fromDate == "") {
                alert("Please enter From Date");
                return false;
            }
            if (toDate == "") {
                alert("Please enter To Date");
                return false;
            }
            if (disconnectionDate == "") {
                alert("Please enter Disconnection Date");
                return false;
            }
            if (previousRDG == "") {
                alert("Please enter Previous Reading");
                return false;
            }
            if (presentRDG == "") {
                alert("Please enter Present Reading");
                return false;
            }

            if (billDate == "") {
                alert("Please enter Bill Date ");
                return false;
            }
            if (billAmt == "") {
                alert("Please enter Bill Amount");
                return false;
            }
            if (previousBalance == "") {
                alert("Please enter Previous Balance");
                return false;
            } if (currentLPS == "") {
                alert("Please enter Current LPS");
                return false;
            } if (totalBill == "") {
                alert("Please enter Total Bill");
                return false;
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="app-main__outer">
        <div class="app-main__inner">
            <div class="row">

                <div class="col-xl-12">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <form>
                                        <!-- Form Group (username)-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (first name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputFirstName">Account Number</label>
                                                <asp:Label ID="lblAccNum" class="form-control" runat="server"></asp:Label>
                                            </div>
                                            <!-- Form Group (last name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputLastName">Name</label>
                                                <asp:Label ID="lblName" class="form-control" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <!-- Form Row        -->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (organization name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputOrgName">Mobile Number</label>
                                                <asp:Label ID="lblMobNum" class="form-control" runat="server"></asp:Label>
                                            </div>
                                            <!-- Form Group (location)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputLocation">Email address</label>
                                                <asp:Label ID="lblEmail" class="form-control" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <%--<div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                            <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="username">
                        </div>--%>
                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (first name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputFirstName">Bill Date</label>
                                                <%--<input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie">--%>
                                                <asp:TextBox class="form-control" ID="txtBillDate" runat="server" TextMode="Date"></asp:TextBox>
                                            </div>
                                            <!-- Form Group (last name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputLastName">Due Date</label>
                                                <asp:TextBox CssClass="form-control" ID="txtDueDate" runat="server" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- Form Row        -->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (organization name)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputOrgName">From Date</label>
                                                <asp:TextBox CssClass="form-control" ID="txtFromDate" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtFromDate_TextChanged" TextMode="Date"></asp:TextBox>
                                            </div>
                                            <!-- Form Group (location)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputLocation">To Date</label>
                                                <asp:TextBox CssClass="form-control" ID="txtToDate" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtToDate_TextChanged" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- Form Row-->
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Total Days</label>
                                                <asp:Label CssClass="form-control" ID="lblTotalDays" runat="server"></asp:Label>
                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputBirthday">Disconnection Date</label>
                                                <asp:TextBox CssClass="form-control" ID="txtDisconnected" runat="server" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Previous RDG</label>
                                                <asp:TextBox CssClass="form-control" ID="txtPrevRDG" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtPrevRDG_TextChanged"></asp:TextBox>
                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputBirthday">Present RDG</label>
                                                <asp:TextBox CssClass="form-control" ID="txtPresentRDG" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtPresentRDG_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Total Billable Unit</label>
                                                <asp:Label CssClass="form-control" ID="lblTotal" runat="server"></asp:Label>
                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <%--<div class="col-md-6">
                                <label class="small mb-1" for="inputBirthday">Bill Upload</label>
                               <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                &nbsp;</div>
                        </div>--%>

                                            <div class="col-md-4">
                                                <label class="small mb-1" for="inputBirthday">Bill Upload</label>
                                                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                            </div>
                                            <div class="col-md-2">
                                                <%--<label class="small mb-1" for="inputBirthday"></label>--%>
                                                <asp:Button ID="BtnUpload" Class="btn btn-primary" runat="server" Text="Upload"
                                                    OnClick="BtnUpload_Click" />
                                            </div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Current Billable Amount</label>
                                                <asp:TextBox CssClass="form-control" ID="txtBilableAmt" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtBilableAmt_TextChanged"></asp:TextBox>
                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputBirthday">Prev Balance</label>
                                                <asp:TextBox CssClass="form-control" ID="txtPrevBalance" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtPrevBalance_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row gx-3 mb-3">
                                            <!-- Form Group (phone number)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputPhone">Current LPS</label>
                                                <asp:TextBox CssClass="form-control" ID="txtCurrentLPS" runat="server"
                                                    AutoPostBack="True" OnTextChanged="txtCurrentLPS_TextChanged"></asp:TextBox>
                                            </div>
                                            <!-- Form Group (birthday)-->
                                            <div class="col-md-6">
                                                <label class="small mb-1" for="inputBirthday">Total Bill</label>
                                                <asp:TextBox CssClass="form-control" ID="txtTotalBill" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- Save changes button-->
                                        <%--<button class="btn btn-primary" type="button">Save changes</button>--%>
                                        <asp:Button ID="btnSave" Class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return validate()" />
                                        &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnBack" Class="btn btn-primary" runat="server" Text="Back" OnClick="btnBack_Click" />
                                        <asp:HiddenField ID="HdfAccNo" runat="server" />
                                        <asp:HiddenField ID="HdfImg" runat="server" />
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </form>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSave" />
                                    <asp:PostBackTrigger ControlID="BtnUpload" />

                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>

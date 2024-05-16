<%@ Page Title="" Language="C#" MasterPageFile="~/MTSMaster.master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="mts_project.ViewDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="app-main__outer">
    <div class="app-main__inner">
         <div class="row">
              <div class="col-xl-12">
            <!-- Account details card-->          
              <div class="card mb-4">
                <div class="card-header">Account Details </div>
                    <div class="card-body">
                          <form>
                      
                               <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputFirstName">Name</label>
                               <asp:Label ID="lblName" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLastName">Meter Type</label>
                               <asp:Label ID="lblMeter" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                                <!-- Form Row        -->
                           <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Mobile Number</label>
                                <asp:Label ID="lblMob" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Account Number</label>
                                 <asp:Label ID="lblAccount" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Bill Date</label>
                                <asp:Label ID="lblBillDate" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Due Date</label>
                                 <asp:Label ID="lblDueDate" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">From Date</label>
                                <asp:Label ID="lblFromDate" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">To Date</label>
                                 <asp:Label ID="lblToDate" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Total Days</label>
                                <asp:Label ID="lblTotalDays" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Disconnection Date</label>
                                 <asp:Label ID="lblDisconnectionDate" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                         <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Previous RDG</label>
                                <asp:Label ID="lblPreviousRDG" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Present RDG</label>
                                 <asp:Label ID="lblPresentRGD" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                         <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Total Billable Unit</label>
                                <asp:Label ID="lblTotal" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress"></label>
                                  <%--<asp:LinkButton ID="lnbtnView" class="btn btn-link" style="margin-top: 20px;" target="_blank" runat="server" PostBackUrl="https://www.w3schools.com/images/myw3schoolsimage.jpg">Click me for View Bill</asp:LinkButton>--%>

                                  <a ID="lnbtnView" runat="server" href="#" class="btn btn-link" style="margin-top: 20px;"  target="_blank"> View Bill >></a>


                            </div>
                        </div>
                         <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Current Billable Amount</label>
                                <asp:Label ID="lblCurrentBill" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Prev Balance</label>
                                 <asp:Label ID="lblPrevBalance" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Current LPS</label>
                                <asp:Label ID="lblCurrentLps" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Total Bill</label>
                                 <asp:Label ID="lblTotalBill" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div id="divdeposit" runat="server" class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Bill Deposit Amount</label>
                                <asp:TextBox ID="txtdeposit" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 <label class="small mb-1" for="inputEmailAddress">Bill Deposit Date</label>
                                 <asp:TextBox ID="txtdepositdate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div id="divdepositbtn" runat="server" class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                               
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                 
                                 <asp:Button ID="btnDeposite" CssClass="btn btn-primary" runat="server" OnClick="btnDeposite_Click" Text="Save" />
                                 &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Back" />
                            </div>
                        </div>
                        <!-- Save changes button-->
                        
                        <%--<button class="btn btn-primary" type="button">Save changes</button>--%>
                       </form>
                   </div>
            </div>
         </div>
      </div>
    </div>
</div>
</asp:Content>

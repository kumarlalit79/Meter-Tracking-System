<%@ Page Title="" Language="C#" MasterPageFile="~/MTSMaster.master" AutoEventWireup="true" CodeBehind="My_Account.aspx.cs" Inherits="mts_project.My_Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="Styles/deshboard/bootstrap_ModalPopUp.min.css" rel="stylesheet" type="text/css" />--%>
    <script src="js/modalpopup/jquery.min.js" type="text/javascript"></script>
    <script src="js/modalpopup/popper.min.js" type="text/javascript"></script>
    <script src="js/modalpopup/bootstrap.min.js" type="text/javascript"></script>
    <link rel="icon" type="image/x-icon" href="img/MTS-Lobo.PNG">

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
                               <label class="small mb-1" for="inputFirstName">Meter Type</label>
                                <%--<input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie">--%>
                                <asp:TextBox class="form-control"  ID="lblMeter" runat="server" ></asp:TextBox>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                            <label class="small mb-1" for="inputOrgName">Mobile Number</label>
                                <asp:Label ID="lblMobNum" class="form-control" runat="server"></asp:Label>
                               
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
                               <label class="small mb-1" for="inputLocation">Email address</label>
                                <asp:Label ID="lblEmail" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLastName">Account Status</label>
                                <asp:Label ID="lblStatus" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Address</label>
                                 <asp:Label ID="lblAddress" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLocation">State</label>
                                 <asp:Label ID="lblState" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPhone">District</label>
                                  <asp:Label ID="lblDistrict" class="form-control" runat="server"></asp:Label>
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputBirthday">Pin Code</label>
                               <asp:Label ID="lblPin" class="form-control" runat="server"></asp:Label>
                            </div>
                        </div>
                         <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                               <asp:Button ID="btnSave" Class="btn btn-primary" runat="server" Text="Edit" 
                            onclick="btnSave_Click"  />
                            </div>

                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
           Add New account
        </button>
                        </div>
                        <!-- Save changes button-->
                        <%--<button class="btn btn-primary" type="button">Save changes</button>--%>
                        
                        
                    </form>
                </div>
            </div>
            
            </div>

            </div>
            </div>
        <div class="container">
        <!-- Button to Open the Modal -->
        
            
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title w-100 text-center">Add New Account</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!-- adding Bootstrap Form here -->

                        <form id="myForm" class="needs-validation" novalidate>
                            <div class="container">
                               <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-12">
                               <label class="small mb-1" for="inputFirstName">Account No.</label>
                                <%--<input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie">--%>
                               <asp:TextBox class="form-control" ID="txtaccountnumber" runat="server" placeholder="Account Number"></asp:TextBox>
                                        
                            </div>
                            <!-- Form Group (location)-->
                            
                        </div>
                             <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-12">
                               <label class="small mb-1" for="inputFirstName">Meter Type</label>
                                <%--<input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie">--%>
                                <asp:RadioButtonList ID="rbtMeterType" class="form-control"  runat="server" RepeatDirection="Horizontal">
    <asp:ListItem>Home</asp:ListItem>
    <asp:ListItem>Shop</asp:ListItem>
</asp:RadioButtonList>
                            </div>
                            <!-- Form Group (location)-->
                            
                        </div>
                      

                                 <div class="text-left">
                               <%--  <button class="btn btn-success" type="submit">Submit</button>--%>
                               <asp:Button class="btn btn-success" ID="BtnAddAccount" runat="server" 
                                         Text="Save changes" onclick="BtnAddAccount_Click" UseSubmitBehavior="false" data-dismiss="modal" />

                                         
                                 </div>
                            </div>
                        </form>

                        <script>
                           
                        </script>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

         <br><br>
      <%--<p style="color: green;">https://github.com/saurabh111121 </p>
      <p style="color: red;"> Bootstrap Validation + output in console </p>
         <p style="color: red;"> You can check your input's in the Console.</p>
         <p style="color: red;"> Ctrl + Shift + I (for opening Console)</p>
--%>


    </div>
            </div>
</asp:Content>

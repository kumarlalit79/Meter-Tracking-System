<%@ Page Title="" Language="C#" MasterPageFile="~/MTSMaster.master" AutoEventWireup="true" CodeBehind="Create_User.aspx.cs" Inherits="mts_project.Create_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                                <label class="small mb-1" for="inputFirstName">First Name</label>
                                <asp:TextBox class="form-control" ID="txtFname" runat="server" placeholder="First Name" ></asp:TextBox>
                            </div>
                            <!-- Form Group (last name)-->
                            <div id="Div1" class="col-md-6" runat="server" visible="false">
                                <label class="small mb-1" for="inputLastName">Last Name</label>
                                 <asp:TextBox class="form-control" ID="txtLname" runat="server" placeholder="Last Name" ></asp:TextBox>
                            </div>
                            <div id="Div2" class="col-md-6" runat="server" visible="true">
                                <label class="small mb-1" for="inputLastName">Account Statuse</label>
                                <asp:RadioButtonList ID="RadioButtonList2" class="form-control"  runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Value="1">Active</asp:ListItem>
    <asp:ListItem Value="0">InActive</asp:ListItem>
</asp:RadioButtonList>
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                               <label class="small mb-1" for="inputFirstName">Meter Type</label>
                                <%--<input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie">--%>
                                <asp:RadioButtonList ID="RadioButtonList1" class="form-control"  runat="server" RepeatDirection="Horizontal">
    <asp:ListItem>Home</asp:ListItem>
    <asp:ListItem>Shop</asp:ListItem>
</asp:RadioButtonList>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                            <label class="small mb-1" for="inputOrgName">Mobile Number</label>
                             <asp:TextBox class="form-control" ID="txtMob" runat="server" placeholder="Mobile Number" ></asp:TextBox>
                              
                                <%--<asp:Label ID="lblMob" class="form-control" runat="server"></asp:Label>--%>
                                
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
                                <asp:TextBox class="form-control" ID="txtEmail" runat="server" placeholder="Email address" ></asp:TextBox>
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLastName">Account Number</label>
                                <asp:TextBox class="form-control" ID="txtAccountNum" runat="server" placeholder="Account Number" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputOrgName">Address 1</label>
                                 <asp:TextBox class="form-control" ID="txtAdd1" runat="server" placeholder="Address 1" ></asp:TextBox>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLocation">Address 2</label>
                                 <asp:TextBox class="form-control" ID="txtAdd2" runat="server" placeholder="Address 2" ></asp:TextBox>
                            </div>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                            <label class="small mb-1" for="inputLocation">State</label>
                                <asp:DropDownList  class="form-control"   ID="ddlState" runat="server" >
</asp:DropDownList>
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                            <label class="small mb-1" for="inputPhone">District</label>
                                  <asp:DropDownList  class="form-control"   ID="ddlDist" runat="server" >
</asp:DropDownList>
                            </div>
                        </div>
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                            <label class="small mb-1" for="inputBirthday">Pin Code</label>
                              <asp:TextBox class="form-control" ID="txtPin" runat="server" placeholder="Pin Code" ></asp:TextBox>
                            </div>
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                            <label class="small mb-1" for="inputBirthday">x</label>
                            
                            <asp:Button class="btn btn-primary" ID="btnSave" runat="server" Text="Save changes" OnClick="btnSave_Click" style="height: 40px" />
                            </div>
                        </div>
                        
                        <!-- Save changes button-->
                        <%--<button class="btn btn-primary" type="button">Save changes</button>--%>
                       <%-- <asp:Button ID="btnSave" Class="btn btn-primary" runat="server" Text="Save"  />--%>
                       
                    </form>
                </div>
            </div>
            
            </div>

            </div>
            </div>
            </div>
</asp:Content>

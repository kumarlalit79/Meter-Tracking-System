<%@ Page Title="" Language="C#" MasterPageFile="~/MTSMaster.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="mts_project.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/HighChart/highcharts.js"></script>
<script src="js/HighChart/series-label.js"></script>
<script src="js/HighChart/exporting.js"></script>
<script src="js/HighChart/export-data.js"></script>
<script src="js/HighChart/accessibility.js"></script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="app-main__outer">
     <div class="app-main__inner">
    <div class="row">
       
        <div class="col-xl-12">
            <!-- Account details card-->          
              <div class="card mb-4">
                <div class="card-header">Account Details
                <div class="card-body">
                <div class="row gx-3 mb-3" style="margin-top: 20px;">
                            <!-- Form Group (first name)-->
                            <div class="col-md-3"  style="text-align:right;margin-top: 7px;">
                                 <label class="control-label" for="inputLastName">Year</label>
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                               <asp:DropDownList ID="ddlyear" class="form-control"  runat="server" 
                                     AutoPostBack="True" onselectedindexchanged="ddlyear_SelectedIndexChanged">
                                    
                                 </asp:DropDownList>
                                
                            </div>
                            <div class="col-md-3">
                                
                            </div>
                            
                        </div>
                </div>
                </div>
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
                  
                        <!-- Save changes button-->
                        <%--<button class="btn btn-primary" type="button">Save changes</button>--%>
                        
                       
                    </form>
                </div>

                 <div class="row">
                
             <div class="col-md-6 col-xl-4">
                 <div class="card mb-3 widget-content bg-midnight-bloom">
                     <div class="widget-content-wrapper text-white">
                         <div class="widget-content-left">
                             <div class="widget-heading">Total Record</div>
                             <div class="widget-subheading">As per MTS</div>
                         </div>
                         <div class="widget-content-right">
                             <div class="widget-numbers text-white"><span>
                                 <asp:Label ID="LblTotalRecord" runat="server" Text="Label"></asp:Label></span></div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-md-6 col-xl-4">
                 <div class="card mb-3 widget-content bg-arielle-smile">
                     <div class="widget-content-wrapper text-white">
                         <div class="widget-content-left">
                             <div class="widget-heading">Total Dues Count</div>
                             <div class="widget-subheading">As per MTS</div>
                         </div>
                         <div class="widget-content-right">
                             <div class="widget-numbers text-white"><span><asp:Label ID="LblTotalDues" runat="server" Text="Label"></asp:Label></span></div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="col-md-6 col-xl-4">
                 <div class="card mb-3 widget-content bg-grow-early">
                     <div class="widget-content-wrapper text-white">
                         <div class="widget-content-left">
                             <div class="widget-heading">Latest Dues Date</div>
                             <div class="widget-subheading">As per MTS</div>
                         </div>
                         <div class="widget-content-right">
                             <div class="widget-numbers text-white"><span><asp:Label ID="LblLatestDues" runat="server" Text="Label"></asp:Label></span></div>
                         </div>
                     </div>
                 </div>
             </div>
             
        
        <div class="col-xl-12">
           
            
          <div id="container" style="width:95%">
                 <asp:Literal ID="Literal1" runat="server"></asp:Literal>
          </div>
                        
            
         </div>
             <div class="col-md-12">
                 
                    
                     <div class="main-card mb-3 card">
                     <div class="table-responsive">
                     <asp:GridView CssClass="table table-bordered table-condensed table-responsive table-hover" ID="gvMyAcc" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="SRNO" HeaderText="SR. NO" />
        <asp:BoundField DataField="Bill_Date" HeaderText="Bill Date" />
        <asp:BoundField DataField="Due_Date" HeaderText="Due Date" />
        <asp:BoundField DataField="Total_Day" HeaderText="Total Day" />
        <asp:BoundField DataField="Disconnection" HeaderText="Dis-con Date" />
        <asp:BoundField DataField="Total_Bill_Unit" HeaderText="Total Unit" />
        <asp:BoundField DataField="Total_bill" HeaderText="Total Bill" />
       


        <asp:BoundField DataField="Bill_Deposit_AMT" HeaderText="Deposite Amount" />
        <asp:BoundField DataField="Bill_Deposit_Date" HeaderText="Deposite Date" />



        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" CommandName='<%# Bind("Bill_Id") %>'/>
                &nbsp;
                <asp:Button ID="Button2" runat="server" Text="Pay Bill" CommandName='<%# Bind("Bill_Id") %>' OnClick="Button2_Click" />
            </ItemTemplate>
        </asp:TemplateField>



    </Columns>
</asp:GridView>
</div>
 </div>
                     <div class="d-block text-center card-footer">
                         <button class="mr-2 btn-icon btn-icon-only btn btn-outline-danger"><i class="pe-7s-trash btn-icon-wrapper"> </i></button>
                         <button class="btn-wide btn btn-success">Save</button>
                     </div>
                 </div>
             </div>
       
            </div>
            
            </div>

            </div>
            </div>
            </div>

</asp:Content>

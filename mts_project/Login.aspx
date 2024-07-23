<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="mts_project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MTS</title>
    <link href="Styles/deshboard/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/deshboard/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/x-icon" href="img/MTS-Lobo.PNG"/>

    <style>
        .main-content {
            width: 50%;
            border-radius: 20px;
            box-shadow: 0 5px 5px rgba(0,0,0,.4);
            margin: 5em auto;
            display: flex;
        }

        .company__info {
            background-color: #008080;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #fff;
        }

        .fa-android {
            font-size: 3em;
        }

        @media screen and (max-width: 640px) {
            .main-content {
                width: 90%;
            }

            .company__info {
                display: none;
            }

            .login_form {
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;
            }
        }

        @media screen and (min-width: 642px) and (max-width:800px) {
            .main-content {
                width: 70%;
            }
        }

        .row > h2 {
            color: #008080;
        }

        .login_form {
            background-color: #fff;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            border-top: 1px solid #ccc;
            border-right: 1px solid #ccc;
        }

        form {
            padding: 0 2em;
        }

        .form__input {
            width: 100%;
            border: 0px solid transparent;
            border-radius: 0;
            border-bottom: 1px solid #aaa;
            padding: 1em .5em .5em;
            padding-left: 2em;
            outline: none;
            margin: 1.5em auto;
            transition: all .5s ease;
        }

            .form__input:focus {
                border-bottom-color: #008080;
                box-shadow: 0 0 5px rgba(0,80,80,.4);
                border-radius: 4px;
            }

        .btn {
            transition: all .5s ease;
            width: 70%;
            border-radius: 30px;
            color: #008080;
            font-weight: 600;
            background-color: #fff;
            border: 1px solid #008080;
            margin-top: 1.5em;
            margin-bottom: 1em;
        }

            .btn:hover, .btn:focus {
                background-color: #008080;
                color: #fff;
            }
    </style>

    <script>
        window.console = window.console || function (t) { };
    </script>

    <script type="text/javascript">
        function validate() {
            var phoneNum = document.getElementById('<%=txtPhoneNum.ClientID %>').value;
            
            if (phoneNum == "") {
                alert("Please enter your phone number");
                return false;
            }
        }
    </script>

    <script type="text/javascript">
        function validatePhoneNumber() {
            var phoneNumber = document.getElementById('<%= txtPhoneNum.ClientID %>').value;
            var phonePattern = /^\d{10}$/;

            if (!phonePattern.test(phoneNumber)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;   
            }
             
        }

        function wireUpValidation() {
            var btnSubmit = document.getElementById('<%= Button1.ClientID %>');
            if (btnSubmit) {
                btnSubmit.onclick = validatePhoneNumber;
            }
        }

        window.onload = wireUpValidation;
    </script>



</head>
<body>
    <form id="form1" runat="server" >

        <div>
            <div class="container-fluid">
                <div class="row main-content bg-success text-center">
                    <div class="col-md-5 text-center company__info">
                        <h3>MTS</h3>
                        <img alt="MTS" src="img/MTS-Lobo.PNG" style="width: 215px; height: 180px;" />
                        <h4 class="company_title">Meter Tracking System</h4>
                    </div>
                    <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
                        <div class="container-fluid">
                            <div class="row">
                                <h2>Log In</h2>
                            </div>
                            <div class="row">

                                <div class="row">
                                    <asp:TextBox ID="txtPhoneNum" runat="server" class="form__input" placeholder="Mobile Number"></asp:TextBox>
                                    
                                </div>
                                
                            </div>

                            <div class="row">
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn" OnClick="Button1_Click" OnClientClick="return validate()"  />

                            </div>
                            <a href="user_manual/user_manual_mts.pdf" download style="text-decoration: underline;">Download User Manual</a>
    </form>
    </div>
    
    <div>

        <div class="row">
            <%--	<p>Don't have an account? <a href="Create_User.aspx">Register Here</a></p>--%>
        </div>

    </div>

    </div>
		</div>
	</div>
    <!-- Footer -->
    <div class="container-fluid text-center footer">
        <%--Coded with &hearts; by <a href="https://bit.ly/yinkaenoch">Yinka.</a></p>--%>
    </div>
    </div>

    </form>

</body>
</html>

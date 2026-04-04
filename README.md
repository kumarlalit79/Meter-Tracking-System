# Meter Tracking System (MTS)
> A web-based application to efficiently record, track, and analyze monthly electricity or utility meter bills.

## 🔗 Demo

**Click the image below to watch the full Eatly demo video!**

[![Click to watch the demo](https://img.youtube.com/vi/PPSzuaebbP4/0.jpg)](https://youtu.be/PPSzuaebbP4)

## 📋 Description
The Meter Tracking System (MTS) is designed to streamline the management of utility bills for households or businesses. It allows users to log their monthly meter readings, track bill amounts, and monitor late payment surcharges. Through an intuitive dashboard, users can visualize their consumption patterns, upcoming dues, and historical payment records, effectively replacing manual tracking methods.

## ⚙️ Tech Stack
![C#](https://img.shields.io/badge/c%23-%23239120.svg?style=for-the-badge&logo=csharp&logoColor=white) 
![.NET Framework](https://img.shields.io/badge/.NET_Framework-_4.8-512BD4?style=for-the-badge&logo=dotnet&logoColor=white) 
![ASP.NET Web Forms](https://img.shields.io/badge/ASP.NET_Web_Forms-5C2D91?style=for-the-badge&logo=dotnet&logoColor=white) 
![Microsoft SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white) 
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white) 
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

## ✨ Features
- **Mobile-Based Authentication:** Simple session-based login system using the user's registered mobile number.
- **Comprehensive Bill Entry:** Record previous and present readings, billable amounts, and late payment surcharges.
- **Intelligent Calculations:** Automatically computes the total units consumed and final payable amounts.
- **Document Upload:** Attach and securely store physical bill images or documents for future reference.
- **Interactive Dashboard:** View total records, total dues, and upcoming due dates at a single glance.
- **Visual Analytics:** Dynamic Highcharts integration to view monthly unit consumption trends by year.
- **Bill History:** Organized grid view to browse, filter by year, and inspect details of all past bills.

## 🔄 How It Works
1. User opens the app → enters their registered mobile number to log in.
2. If unregistered, the user is redirected to create a new profile with their address and meter type.
3. User accesses the intuitive Home Dashboard → sees overall bill statistics and an interactive monthly consumption chart.
4. User initiates a "Bill Entry" → enters dates, previous/present readings, and any late payment surcharges.
5. MTS automatically computes the total consumed units and final payable amount.
6. User uploads an image of the physical bill for reference → saves the record.
7. The new bill instantly reflects on the dashboard charts and grid, allowing full detailed views anytime.

User → Mobile Login → Dashboard Overview → Add Bill Details & Upload → Automatic Calculations → Save to SQL Server → View History & Charts

## 📁 Project Structure
- `mts_project/` — Main Web Forms project directory containing UI pages and C# code-behind files.
- `MTSMaster.master` — The primary master page template ensuring consistent layout navigation.
- `Home.aspx` — User dashboard featuring Highcharts analytics and a summary of dues.
- `Bill_Entry.aspx` — Page responsible for calculating units and accepting new bill entries.
- `Create_User.aspx` / `My_Account.aspx` — Handles user registration and profile modifications.
- `Login.aspx` — Manages basic mobile-number-based session authentication.
- `mydoc/` — Directory used to store uploaded bill images.
- `Scripts/` & `Styles/` — Contains client-side CSS, standard JavaScript, and Bootstrap assets.
- `Web.config` — Application configuration including ADO.NET SQL Server connection strings.

## 🚀 Getting Started

### Prerequisites
- Microsoft Visual Studio 2019 or 2022
- .NET Framework 4.8 SDK
- Microsoft SQL Server (e.g., SQLEXPRESS)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/kumarlalit79/Meter-Tracking-System.git
   ```
2. Open the solution file `mts_project.sln` in Visual Studio.
3. Open `mts_project\Web.config` and update the connection string to point to your local SQL Server instance.
4. Restore the database schema and stored procedures (ensure the `MTS` database is created locally).
5. Build the solution (`Ctrl+Shift+B`) to restore required NuGet packages.
6. Run the application (`F5`) in IIS Express.

### Environment Variables
| Variable / Key | Description | Example |
| --- | --- | --- |
| `conn` | SQL Server connection string (set in `Web.config`) | `Data Source=.\SQLEXPRESS;Initial Catalog=MTS;Integrated Security=True` |

## 👤 Author
Lalit Kumar — GitHub: kumarlalit79

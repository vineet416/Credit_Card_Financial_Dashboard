# Credit Card Financial Dashboard (Power BI + MySQL)

A weekly Power BI dashboard that tracks revenue, transactions, customer profile, activation and delinquency for a credit card portfolio (10,293 customers, 53 weeks of 2023).
CSV data is loaded into MySQL, modelled with DAX in Power BI, and shown on three report pages: Transaction, Customer and Insights.
Week 53 (31 Dec 2023) was added later to demonstrate a data refresh and week-over-week (WoW) comparison.

## Project Files

| File | Description |
|---|---|
| `Credit_Card_Financial_Dashboard.pbix` | Power BI report: *CC Transaction Report*, *CC Customer Report*, *Insights* |
| `Credit Card Financial Weekly Dashboard Report.pdf` | Status report: objective, SQL import, DAX measures, dashboards, insights |
| `SQL Query - Financial Dashboard Data.sql` | Creates DB `ccdb`, tables `cc_detail` / `cust_detail`, loads the CSVs |
| `Datasets/credit_card.csv`, `cc_add.csv` | Card and transaction rows: weeks 1–52 (10,108) and week 53 (185) |
| `Datasets/customer.csv`, `cust_add.csv` | Customer profile rows: weeks 1–52 (10,108) and week 53 (185) |
| `Weekly Dashboard pdf/` | PDF exports of both reports for 24-Dec and 31-Dec-2023, plus `Dashboard Insights.pdf` |

## Dataset

Two tables joined on `Client_Num` (one row per customer, no unmatched keys).

| Table | Fields | Description |
|---|---|---|
| Card / transaction | `Client_Num`, `Card_Category` | Customer ID; Blue, Silver, Gold or Platinum |
| | `Annual_Fees`, `Customer_Acq_Cost` | Fee charged; cost to acquire the customer |
| | `Week_Start_Date`, `Week_Num`, `Qtr`, `current_year` | Sunday week start (dd-mm-yyyy), Week-1 to Week-53, quarter, 2023 |
| | `Credit_Limit`, `Total_Revolving_Bal`, `Avg_Utilization_Ratio` | Credit exposure |
| | `Total_Trans_Amt`, `Total_Trans_Ct`, `Interest_Earned` | Spend, transaction count, interest |
| | `Use Chip`, `Exp Type` | Swipe / Chip / Online; Bills, Entertainment, Fuel, Grocery, Food, Travel |
| | `Activation_30_Days`, `Delinquent_Acc` | 0/1 flags |
| Customer | `Customer_Age`, `Gender`, `Dependent_Count`, `Education_Level`, `Marital_Status` | Demographics |
| | `state_cd`, `Zipcode`, `contact` | Location (28 states), contact type |
| | `Car_Owner`, `House_Owner`, `Personal_loan` | yes/no flags |
| | `Customer_Job`, `Income`, `Cust_Satisfaction_Score` | 6 job types, income, score 1–5 |

## Approach

1. **Understand data:** two source tables (card/transaction and customer) plus a week 53 add-on for each.
2. **Prepare:** clean the CSVs in Excel, then create the MySQL tables and load them with `LOAD DATA INFILE`.
3. **Model:** connect Power BI to MySQL; add `AgeGroup`, `IncomeGroup`, `week_num2` and `Revenue = Annual_Fees + Total_Trans_Amt + Interest_Earned`.
4. **Measure:** DAX current-week / previous-week measures and WoW % for revenue, transaction amount, transaction count and customers.
5. **Report:** build the Transaction, Customer and Insights pages for week 52, then load week 53 and refresh.
6. **Insights:** summarise YTD KPIs and WoW change (recomputed below from the CSVs).

## Key Insights

| Area | Finding (recomputed from CSVs) |
|---|---|
| Totals | Revenue 56.5M; spend 45.5M; interest 7.98M; annual fees 3.0M; 667,234 transactions |
| Customers | 10,293; activation rate 57.46%; delinquency rate 6.06%; satisfaction 3.19 / 5 |
| Gender | Male 30.9M (54.7%) vs female 25.6M (45.3%); females are 58.2% of customers, but male revenue per customer is 7,183 vs 4,274 |
| Card type | Blue 83.5%, Silver 10.0%, Gold 4.5%, Platinum 2.0% of revenue |
| State | TX 23.0%, NY 23.0%, CA 22.8% (68.8% together); FL 17.6%, NJ 7.8% |
| Segments | Businessman 31.3% of revenue; ages 40–50 and 50–60 lead (24.7M, 18.6M); Swipe 63.1% of revenue; Bills is the top expense type (24.8%) |
| Risk | Delinquency is highest for Govt (7.27%), lowest for Businessman (5.27%) |
| Quarters | Revenue 14.0M (Q1), 13.8M (Q2), 14.2M (Q3), 14.5M (Q4) |
| WoW (wk 53 vs 52) | Revenue +28.8%, spend +35.0%, transactions +3.4%, customers +12.8% |

## Tech Stack

Excel (CSV preparation), SQL / MySQL 8.0 (`LOAD DATA INFILE`), Power BI Desktop, DAX (`SWITCH`, `CALCULATE`, `FILTER`, `DIVIDE`, `WEEKNUM`), WoW trend analysis.

## How to Use

1. **View only:** open the PDFs in `Weekly Dashboard pdf/` or the status report PDF.
2. **Explore:** open `Credit_Card_Financial_Dashboard.pbix` in Power BI Desktop.
3. **Rebuild:** copy the four CSVs to the MySQL uploads folder, update the paths in the `.sql` file, and run it. Load `credit_card.csv` and `customer.csv` first, then the `_add` files.
4. **Refresh:** point Power BI to the `ccdb` database and refresh.

Feedback: [LinkedIn](https://www.linkedin.com/in/vineet-patel416/)

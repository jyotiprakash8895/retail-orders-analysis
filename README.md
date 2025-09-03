# 🛍️ Retail Orders Analysis

This project analyzes retail sales data to uncover **business insights** using **Python (Pandas)** for data cleaning and **SQL (SQL Server)** for analytics.

---

## 📌 Project Overview
Retail businesses generate large volumes of transactional data every day.  
The goal of this project is to:
- Clean messy retail transaction data (handling nulls, standardizing fields).
- Store cleaned data in **SQL Server** for efficient querying.
- Use **SQL analytics** to answer real-world business questions.

---

## 🔹 Tech Stack
- **Python**: Pandas, SQLAlchemy, PyODBC  
- **SQL Server**: T-SQL queries, aggregations, window functions  
- **Tools**: Jupyter Notebook, GitHub  

---

## 📂 Files
- `retail_orders.ipynb` → Data cleaning in Python.  
- `retail.sql` → SQL queries for business insights.  
- `requirements.txt` → Python dependencies (optional).  

---

## 🧹 Data Cleaning Steps (Python)
1. Download raw dataset from Kaggle.  
2. Standardize column names.  
3. Handle null values using business logic:  
   - Fill `price_per_unit` or `total_spent` using available fields.  
   - Drop unusable rows.  
   - Convert boolean discounts into readable labels.  
4. Impute missing items using `category + price_per_unit`.  
5. Convert transaction dates into proper `datetime`.  
6. Export the cleaned dataset into **SQL Server** table `retail_orders`.  

---

## 📊 Business Questions Answered (SQL)
1. **Top categories by revenue** and their monthly/quarterly trends.  
2. **Pareto analysis (80/20 rule):** Which items drive most category revenue.  
3. **Discount analysis:** Do discounts actually increase revenue?  
4. **Regional insights:** Which locations generate the most revenue.  
5. **Payment method behavior:** Do card/cash/wallet users spend differently?  
6. **Top customers:** Identify VIPs by revenue and transaction frequency.  
7. **Basket analysis:** Does discounting increase basket size or just reduce ticket value?  

---

## 🚀 How to Run
1. Clone this repo:
   ```bash
   git clone https://github.com/your-username/retail-orders-analysis.git
   cd retail-orders-analysis
Install dependencies:

bash
Copy code
pip install pandas sqlalchemy pyodbc
Update your SQL Server connection string in retail_orders.ipynb:

python
Copy code
engine = sal.create_engine("mssql+pyodbc://<SERVER>/<DB>?driver=ODBC Driver 17 for SQL Server")
Run the notebook to clean and push data into SQL Server.

Execute queries from retail.sql in SQL Server to get insights.

📈 Key Insights
📊 Electronics show seasonal spikes in Q4 (holiday season).

🎯 20% of products contribute to ~80% of revenue.

💸 Discounts increase basket size but reduce average ticket size.

🌍 Region-wise performance shows strong variations (helps in marketing strategy).

🏆 Top customers can be segmented as VIPs for loyalty programs.

🔮 Future Work
Add Power BI / Tableau dashboard for visualization.

Apply Machine Learning for customer segmentation (clustering).

Predict future sales trends using time series forecasting.

🧑‍💻 Author
JYOTI PRAKASH SETHY
📧 jyotiprakash8895@gmail.com

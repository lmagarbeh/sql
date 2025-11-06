# Assignment 1: Meet the farmersmarket.db and Basic SQL

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

#### Submission Parameters:
* Submission Due Date: `November 05, 2025`
* Weight: 30% of total grade
* The branch name for your repo should be: `assignment-one`
* What to submit for this assignment:
    * This markdown (Assignment1.md) with written responses in Section 4
    * One Entity-Relationship Diagram (preferably in a pdf, jpeg, png format).
    * One .sql file 
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pulls/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `assignment-one`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.

*** 

## Section 1:
You can start this section following *session 1*.

Steps to complete this part of the assignment:
- Load the farmersmarket.db and browse its content
- Create a logical data model

<br>
If this is your first time in DB Browser for SQLite, the following instructions may help:

#### 1) Load Database
- Open DB Browser for SQLite
- Go to File > Open Database
- Navigate to your farmersmarket.db 
	- This will be wherever you cloned the GH Repo (within the **05_src/sql** folder)
	- ![db_browser_for_sqlite_choose_db.png](./images/01_db_browser_for_sqlite_choose_db.png)

#### 2) Configure your windows
By default, DB Browser for SQLite has three windows, with four tabs in the main window and three tabs in the bottom right window
- Window 1: Main Window (Centre)
	- Stay in the Database Structure tab for now
- Window 2: Edit Database Cell (Top Right)
- Window 3: Remote (Bottom Right)
	- Switch this to DB Schema tab (very bottom)

Your screen should look like this (or very similar)
![db_browser_for_sqlite.png](./images/01_db_browser_for_sqlite.png)

#### 3) The farmersmarket.db
There are 10 tables in the Main Window:
1) booth
2) customer
3) customer_purchases
4) market_date_info
5) product
6) product_category
7) vendor
8) vendor_booth_assignments
9) vendor_inventory
10) postal_data

Switch to the Browse Data tab, booth is selected by default

<img src="./images/01_the_browse_data_tab.png" width="900">


Using the table drop down at the top left, explore some of the contents of the database

<img src="./images/01_the_table_drop_down_at_the_top_left.png" width="200">

Move on to the Logical Data Model task when you have looked through the tables


### Build Logical Data Model

Recall during session 1:

I diagramed the following four tables:
- product
- product_category
- vendor
- vendor_inventory

 <img src="./images/01_farmers_market_logical_model_partial.png" width="500">


#### Prompt 1:
Choose two tables and create a logical data model. There are lots of tools you can do this (including drawing this by hand), but I'd recommend [Draw.io](https://www.drawio.com/) or [LucidChart](https://www.lucidchart.com/pages/). 

A logical data model must contain:
- table name
- column names
- relationship type

Please do not pick the exact same tables that I have already diagrammed. For example, you shouldn't diagram the relationship between `product` and `product_category`, but you could diagram `product` and `customer_purchases`.

**HINTS**:
- You will need to use the Browse Data tab in the main window to figure out the relationship types.
- You can't diagram tables that don't share a common column
	- These are the tables that are connected
	- <img src="./images/01_farmers_market_conceptual_model.png" width="600">
- The column names can be found in a few spots (DB Schema window in the bottom right, the Database Structure tab in the main window by expanding each table entry, at the top of the Browse Data tab in the main window)

***

## Section 2:
You can start this section following *session 2*.

Steps to complete this part of the assignment:
- Open the assignment1.sql file in DB Browser for SQLite:
	- from [Github](./02_activities/assignments/assignment1.sql)
	- or, from your local forked repository  
- Complete each question

### Write SQL

#### SELECT
1. Write a query that returns everything in the customer table.
2. Write a query that displays all of the columns and 10 rows from the customer table, sorted by customer_last_name, then customer_first_ name.

<div align="center">-</div>

#### WHERE
1. Write a query that returns all customer purchases of product IDs 4 and 9.
2. Write a query that returns all customer purchases and a new calculated column 'price' (quantity * cost_to_customer_per_qty), filtered by customer IDs between 8 and 10 (inclusive) using either:
	1.  two conditions using AND
	2.  one condition using BETWEEN

<div align="center">-</div>

#### CASE
1. Products can be sold by the individual unit or by bulk measures like lbs. or oz. Using the product table, write a query that outputs the `product_id` and `product_name` columns and add a column called `prod_qty_type_condensed` that displays the word “unit” if the `product_qty_type` is “unit,” and otherwise displays the word “bulk.”

2. We want to flag all of the different types of pepper products that are sold at the market. Add a column to the previous query called `pepper_flag` that outputs a 1 if the product_name contains the word “pepper” (regardless of capitalization), and otherwise outputs 0.

<div align="center">-</div>

#### JOIN
1. Write a query that `INNER JOIN`s the `vendor` table to the `vendor_booth_assignments` table on the `vendor_id` field they both have in common, and sorts the result by `vendor_name`, then `market_date`.

***

## Section 3:
You can start this section following *session 3*.

Steps to complete this part of the assignment:
- Open the assignment1.sql file in DB Browser for SQLite:
	- from [Github](./02_activities/assignments/assignment1.sql)
	- or, from your local forked repository  
- Complete each question

### Write SQL

#### AGGREGATE
1. Write a query that determines how many times each vendor has rented a booth at the farmer’s market by counting the vendor booth assignments per `vendor_id`.
2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list of customers for them to give stickers to, sorted by last name, then first name.
   
**HINT**: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword.

<div align="center">-</div>

#### Temp Table
1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal
   
**HINT**: This is two total queries -- first create the table from the original, then insert the new 10th vendor. When inserting the new vendor, you need to appropriately align the columns to be inserted (there are five columns to be inserted, I've given you the details, but not the syntax)

To insert the new row use VALUES, specifying the value you want for each column:  
`VALUES(col1,col2,col3,col4,col5)`

<div align="center">-</div>

#### Date
1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.
   
**HINT**: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month and year are!

2. Using the previous query as a base, determine how much money each customer spent in April 2022. Remember that money spent is `quantity*cost_to_customer_per_qty`.
   
**HINTS**: you will need to AGGREGATE, GROUP BY, and filter...but remember, STRFTIME returns a STRING for your WHERE statement!!

*** 

## Section 4:
You can start this section anytime.

Steps to complete this part of the assignment:
- Read the article
- Write, within this markdown file, <1000 words.

### Ethics

Read: Qadri, R. (2021, November 11). _When Databases Get to Define Family._  Wired. <br>
    https://www.wired.com/story/pakistan-digital-database-family-design/

Link if you encounter a paywall: https://archive.is/srKHV or https://web.archive.org/web/20240422105834/https://www.wired.com/story/pakistan-digital-database-family-design/

**What values systems are embedded in databases and data systems you encounter in your day-to-day life?**

Consider, for example, concepts of fariness, inequality, social structures, marginalization, intersection of technology and society, etc.


```

Rabia Qadri’s “When Databases Get to Define Family” examines how Pakistan’s National Database and Registration Authority (NADRA) digitized the idea of “family” and, in doing so, imposed a specific cultural and moral framework. The database is built around one model, a traditional family where there is a married couple (male+female) and where the male is head of household with dependents.This model shapes who can be recognized by the state. Women, adopted children, or people with nontraditional family situations often find themselves outside the system, struggling to be seen.

Reading this, I understood the ethical concerns Qadri raises about exclusion and social rigidity, but at the same time, I also recognize where this model comes from. Coming from Jordan and being Muslim, I know that defining kinship is deeply important in our culture and in Islam generally. Family structure is not just a social convenience; it has religious, legal, and moral significance. In Islamic law, lineage determines inheritance rights, responsibilities, and even marriage eligibility. So, while I agree that NADRA’s implementation can be restrictive, I also understand why a database in a Muslim country might prioritize clear kinship definitions. It’s not just bureaucracy, it’s part of how family ties and obligations are understood in Islamic societies.


That said, the problem appears when a database treats one model of kinship as absolute and ignores the complex realities of people’s lives. In Pakistan, as in Jordan, social and family arrangements are changing. Many women are heads of households, some families adopt, and others raise children across different cities or countries. When technology refuses to adapt to those realities, it ends up enforcing a narrow interpretation of tradition instead of reflecting real social life. The database becomes less about recording truth and more about deciding who fits.

I think about fairness differently in this context. Fairness in a Western sense often means inclusion and neutrality, a system that treats everyone the same regardless of background. But fairness in many Muslim or collectivist societies involves responsibility and order, not just equality. The role of a “head of household” in Islamic tradition is not about power but about duty: the person responsible for providing for and protecting the family. In that sense, NADRA’s model aligns with a moral framework that values defined relationships and accountability. The challenge, however, is that when this moral framework is translated too rigidly into code, it stops serving its ethical purpose and starts causing harm.

The same pattern exists in many systems we use every day. Databases, whether in universities, healthcare, or banking, often hide assumptions about what a “normal” life looks like. When a student registration form forces users to fill in both “father’s name” and “mother’s name,” it assumes a two-parent household. When a healthcare app doesn’t allow multiple citizenships or nonstandard addresses, it excludes people who live between places or outside national borders. These design choices might seem small, but they shape who is visible and who is erased. I’ve noticed that most systems I interact with such as academic, governmental, or even commercial, carry the same quiet bias: they expect social conformity rather than diversity.

At the same time, I don’t think the solution is to strip cultural or religious values from databases. Neutrality can be its own kind of bias. Pretending that data systems can be free of values often just hides whose values are already embedded. I think the better approach is transparency and balance, that is to build systems that acknowledge their moral roots but remain flexible enough to accommodate real life. For a database like NADRA’s, that could mean preserving kinship categories that reflect Islamic ethics while also providing ways to represent exceptional cases without punishment or suspicion. It’s possible to respect both tradition and complexity.

What Qadri’s article made me realize most is that databases are not just technical tools; they are social instruments that define what counts as real. Once a structure or relationship is encoded into a national database, it becomes part of policy and identity. That is why the ethics of data are not abstract but practical , they affect people’s daily lives, access to rights, and sense of belonging. I find it too simplistic to say that systems like NADRA’s are oppressive; the truth is more complicated. They are built with intentions rooted in moral order, but they can unintentionally marginalize those who don’t fit the template.

What I take from Qadri’s piece is not that defining family through databases is inherently wrong, but that it needs balance. As someone from Jordan, I see both sides. I understand the value of preserving clear kinship ties, they are part of how social and moral responsibilities are maintained. At the same time, I agree with Qadri that technology must evolve with society. Systems like NADRA should be flexible enough to handle social change without erasing cultural foundations.The ethical question isn’t whether to include values, but which values we choose to encode, and whether those choices allow people to live with dignity.

In the end, I believe ethics in data is about balance: respecting cultural and religious frameworks while ensuring no one is made invisible by design. A well-designed database should not erase complexity; it should accommodate it.
```

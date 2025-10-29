OVERVIEW:
As a MET associate at Home Depot, I start every day by changing prices where needed throughout the store. Usually, most of these price changes occur in our hardware aisles, mostly the tool sections. I have decided to do an exploratory analysis of the main tool brands 
sold at Home Depot, these brands include Milwaukee, Makita, Dewalt, Ridgid, and Ryobi. I used data I collected through an API called SerpAPI, which scrapes home depots webpage with given parameters, including store number, brand, item, link, price, price saving, 
percentage_off, price badge, and rating. My goal was to compare the different brands based on rating, average price, promotions, and overall value. 

TOOLS USED:
Python -  I used Pycharm to write my python code

SQL - My DBMS of choice is Postgres, as I have the most experience using it. I also have experience in MySQL.

SerpAPI - Used to scrape Home Depot's webpage (using my store number)

Github - Version control and project management.

STEPS TAKEN:
1. The first step was to collect my data. I used SerpAPI to generate my dataset, aiming for 1000 rows of data per brand. The API only returned roughly 750 results per brand, except Makita, which returned only 480.

2. Next, I created my database in python, which I then connected to my pgadmin database I built.

3. I ran the API, once per brand, and uploaded my data to my database

4. I wrote a list of questions I wanted to answer from the limited data I had

5. I wrote my SQL queries to answer said questions

DISCOVERIES:
Here, i will answer each question I asked in my queries file, this time using english.

1. What is the count of each brands products?
   I found that the API gathered 750-770 results per brand, except for Makita, where it only grabbed about 480, this may skew the results slightly in my analysis.
2. Which brand has the highest average selling price?
   On average, the highest selling price for a tool is from Makita, Dewalt being second, Milwaukee third, Ridgid fourth, and lastly Ryobi being the lowest price. As someone who is in the store every day, I know Ryobi sells a lot of smaller garden accessories that may
   skew the price slightly.
3. How do ratings compare accross brands?
   Not surprisingly, Milwaukee has the highest average rating at 4.63/5, Ridgid at 4.52, Makita at 4.50, Dewalt at 4.47, and Ryobi at 4.41
4. Which brand is best value for money?
   Here, I did a side by side comparison of average rating compared to average price. First ordered by average rating then by average price. The results came back in the same order as the previous question, with Milwaukee having the highest averaage rating, and being
   only the third most expensive
5. How do promotions such as special buy affect average rating?
   Here i created two tables and compared them, first table being average rating with badge, and the second being average rating without badge. Makita does not seem to have any promotions going on at the time I collected this data, as Makita only returned null.
   I found that every other brand has higher ratings for their items that have a promotion. As little as a .02 increase in rating (Milwaukee) to as much as .11 increase in rating (Dewalt)
6. Direct comparison of Milwaukee and Dewalt.
   Here's a fun one. Being an associate for the past year and a half, i have noticed a lot of bias towards one brand or the other. Usually people perfer Milwaukee. I have to say, based on this data that Milwaukee is objectively better for the customer. They have a lower
   average price, higher average price saving, higher average percent off, and a higher average rating with both brands having a total of 768 item in the dataset.
7. Compare gaps between base price and discounted price between brands.
   Here, Ridgid has the highest average percentage off being at 32.04, second being Ryobi at 27.28, third being Milwaukee at 25.05, and lastly Dewalt at 22.25
8. Compare rating between discounted items and non discounted items.
   When comparing the two, on average, prices with discounts applied are higher than prices without a discount applied. This had me confused at first because I expected it to be the other way around. After inspecting the data some more, i found that the items that were
   discounted, tend to be higher priced items. This makes sense to me now because if the item is higher priced, the manufacterer is probably more comforatble with discounting it.


Thank you for taking the time to read through my Home Depot tool analysis. Please feel free to explore the other project I have on my github.








   

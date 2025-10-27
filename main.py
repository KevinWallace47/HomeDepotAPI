from serpapi import HomeDepotSearch
import requests
import SQL
from SQL import session


#Extract from API
def apicall(name, page, items_per_page):
    params = {
      "engine": "home_depot",
      "store_id": "3872",
      "q": name,
      "page": page,
      "ps": items_per_page,
      "api_key": "f60eb8ecaa1d46d9691d050e00669d99455da02db9876ce3709fae6afc4215dd"
    }

    search = HomeDepotSearch(params)
    results = search.get_dict()
    products = results.get("products", [])

#Here are all the parameters i will be using in my database
    for product in products:
        print(product.get("brand"))
        print(product.get("title"))
        print(product.get("link"))
        print(product.get("price"))
        print(product.get("price_was"))
        print(product.get("price_saving"))
        print(product.get("percentage_off"))
        print(product.get("price_badge"))
        print(product.get("rating"))
        print()

    return products

page = 1

#Looking for roughly 1000 entries per brand, 48 items times 21 pages equals 1,008 items
#Started off calling for Ridgid
while page < 21:
    my_products = apicall("Ridgid", (page), 48)

    for item in my_products:
        product = SQL.Product(
            brand=item.get("brand"),
            title=item.get("title"),
            link=item.get("link"),
            price=item.get("price"),
            price_was=item.get("price_was"),
            price_saving=item.get("price_saving"),
            percentage_off=item.get("percentage_off"),
            price_badge=item.get("price_badge"),
            rating=item.get("rating")
        )
        session.add(product)

    session.commit()
    page = page + 1

print(product)
















import os
from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy import Column, Integer, String, Float

#Password from my OS to access the database
db_password = os.environ.get('db_pass')

DATABASE_URL = (f'postgresql+psycopg2://postgres:{db_password}@localhost:5432/HomeDepot')
engine = create_engine(DATABASE_URL)
Session = sessionmaker(bind=engine)
session = Session()

Base = declarative_base()

#Create table for database
class Product(Base):
    __tablename__ = 'products'
    id = Column(Integer, primary_key=True)
    brand = Column(String)
    title = Column(String)
    link = Column(String)
    price = Column(Float)
    price_was = Column(Float)
    price_saving = Column(Float)
    percentage_off = Column(Float)
    price_badge = Column(String)
    rating = Column(Float)

    #Function that represents the class
    def __repr__(self):
        return (f"<Product(id='{self.id}',brand='{self.brand}',title='{self.title}',link='{self.link}',price='{self.price}',price_was={self.price_was}"
                f"price_saving='{self.price_saving}',percentage_off='{self.percentage_off}',price_badge='{self.price_badge}',rating='{self.rating}')>")

Base.metadata.create_all(engine)
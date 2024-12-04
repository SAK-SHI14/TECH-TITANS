import tkinter as tk
from tkinter import ttk
import mysql.connector

# Create the main window
root = tk.Tk()
root.title("Flipkart")

# Create a frame to hold the products
product_frame = tk.Frame(root, bg="white")
product_frame.pack(fill="both", expand=True)

# Create a grid to hold the products
grid = tk.Frame(product_frame, bg="white")
grid.pack(fill="both", expand=True)

# Connect to the database
conn = mysql.connector.connect(
    user='root',
    password='Sakshi@14',
    host='localhost',
    database='flipkart'
)

# Create a cursor object
cursor = conn.cursor()

# Retrieve all products from the database
cursor.execute("SELECT * FROM Product")
products = cursor.fetchall()

# Create a list to hold the product widgets
product_widgets = []

# Create a row counter
row = 0

# Create a column counter
col = 0

# Iterate over the products
for product in products:
    # Create a frame to hold the product
    product_widget = tk.Frame(grid, bg="white", highlightbackground="blue", highlightthickness=1)
    product_widget.grid(row=row, column=col, padx=10, pady=10)

    # Create a label to display the product name
    label = tk.Label(product_widget, text=product[1], font=("Arial", 16), fg="blue")
    label.pack(fill="x", pady=10)

    # Create a label to display the product description
    label = tk.Label(product_widget, text=product[2], font=("Arial", 12), fg="gray")
    label.pack(fill="x", pady=10)

    # Create a button to add to cart
    add_to_cart_button = tk.Button(product_widget, text="Add to Cart", bg="yellow", fg="black", font=("Arial", 12), command=lambda product_id=product[0]: add_to_cart(product_id))
    add_to_cart_button.pack(fill="x", pady=10)

    # Create a button to order now
    order_now_button = tk.Button(product_widget, text="Order Now", bg="blue", fg="white", font=("Arial", 12), command=lambda product_id=product[0]: order_now(product_id))
    order_now_button.pack(fill="x", pady=10)

    # Add the product widget to the list
    product_widgets.append(product_widget)

    # Increment the column counter
    col += 1

    # If the column counter reaches 3, reset it and increment the row counter
    if col == 3:
        col = 0
        row += 1

# Define the add to cart function
def add_to_cart(product_id):
    # Add the product to the cart
    cursor.execute("INSERT INTO carts (user_id, product_id) VALUES (%s, %s)", (1, product_id))
    conn.commit()

# Define the order now function
def order_now(product_id):
    # Create an order
    cursor.execute("INSERT INTO Orders (CustomerID, OrderDate, ShippingAddressID, Payment_type, OrderTotal) VALUES (%s, NOW(), 1, 'Cash', 100.00)", (1,))
    order_id = cursor.lastrowid
    conn.commit()

    # Add the product to the order details
    cursor.execute("INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES (%s, %s, 1, 100.00)", (order_id, product_id))
    conn.commit()

# Start the GUI event loop
root.mainloop()
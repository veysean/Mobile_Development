enum DeliveryType { pickup, delivery }

class Customer {
  final String _name;
  final String _email;
  final String _phoneNumber;

  //Constructor
  Customer({
    required String name,
    required String email,
    required String phoneNumber,
  }) : _name = name,
       _email = email,
       _phoneNumber = phoneNumber;

  //Getter
  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;

  @override
  String toString() {
    return ('Customer Information: $_name, $_email, $_phoneNumber');
  }
}

class Product {
  final String _productName;
  final double _price;

  Product(this._productName, this._price);

  //Getter
  String get productName => _productName;
  double get price => _price;
}

class Order {
  final Customer customer;
  final List<Product> products;
  final DeliveryType deliveryType;
  final String? address;

  Order({
    required this.customer,
    required this.products,
    required this.deliveryType,
    this.address,
  });

  //Method get total amount
  double getTotalAmount() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  void orderSummary() {
    print(customer);
    print("Delivery: ${deliveryType.name}");
    if (deliveryType == DeliveryType.delivery && address != null) {
      print("Address: $address");
    }
    print("Products:");
    for (var product in products) {
      print("- ${product.productName}: \$${product.price}");
    }
    print("Total: \$${getTotalAmount()}");
  }
}

void main() {
  // Create products
  Product p1 = Product("Laptop", 1200.0);
  Product p2 = Product("Mouse", 25.0);

  // Create customer
  Customer customer = Customer(
    name: "Sean",
    email: "veysean@gmail.com",
    phoneNumber: "01234567",
  );

  // Create order with delivery
  Order order1 = Order(
    customer: customer,
    products: [p1, p2],
    deliveryType: DeliveryType.delivery,
    address: "123 Main Street",
  );

  // Create order with pickup
  Order order2 = Order(
    customer: customer,
    products: [p2],
    deliveryType: DeliveryType.pickup,
  );

  // Print summaries
  print("Order 1:");
  order1.orderSummary();

  print("\nOrder 2:");
  order2.orderSummary();
}

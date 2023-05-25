class AddProduct {
  var name;
  var price;
  var exp_date;
  var description;
  var quantity;
  var img;
  var category_id;
  var date_1;
  var date_2;
  var sale_1;
  var sale_2;
  var sale_3;

  AddProduct({
    this.name,
    required this.price,
    required this.exp_date,
    required this.description,
    required this.quantity,
    required this.img,
    required this.category_id,
    required this.date_1,
    required this.date_2,
    required this.sale_1,
    required this.sale_2,
    required this.sale_3,
  });
}

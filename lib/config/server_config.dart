class ServerConfig {
  //DomainNameServer
  static const DNS = 'http://192.168.1.103:8000';
  //auth
  static const register = '/api/signup';
  static const login = '/api/login';
  static const categories = '/api/categories';
  static const addProduct = '/api/products';
  static const searchByName = '/api/products?product_name=';
  static const searchByDate = '/api/products?product_date=';
  static const products = '/api/products';
  static const makeLike = '/api/product/like/';
  static const showComments = '/api/product/comment/';
  static const productbycategory = '/api/productsByCat?cat_id=';
  static const productbyUser = '/api/productsByYou';
  static const logout = '/api/logout';
  static const show = '/api/products/';
  static const comments = '/api/product/comment/';
  static const delete = '/api/products/';
  static const edit = '/api/products/';
}

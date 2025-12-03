class OrderUiModel {
  final double price;
  final String status;
  final String payMethod;
  final String orderId;
  final DateTime? date;

  OrderUiModel({
    required this.price,
    required this.status,
    required this.payMethod,
    required this.orderId,
    required this.date,
  });

  factory OrderUiModel.fromMap(Map<String, dynamic> data) {
    final double price = (data['price'] as num?)?.toDouble() ?? 0;
    final String status = data['status'] ?? 'pending';
    final String payMethod = data['payMethods'] ?? '';
    final String orderId = data['orderId'] ?? '';
    final String dateString = data['date'] ?? '';

    DateTime? date;
    if (dateString.isNotEmpty) {
      try {
        date = DateTime.parse(dateString);
      } catch (_) {
        date = null;
      }
    }

    return OrderUiModel(
      price: price,
      status: status,
      payMethod: payMethod,
      orderId: orderId,
      date: date,
    );
  }
}

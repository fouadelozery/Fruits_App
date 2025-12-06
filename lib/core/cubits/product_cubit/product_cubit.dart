import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  List<ProductEntity> _allProducts = []; // جميع المنتجات
  List<ProductEntity> _sortedProducts = []; // المنتجات بعد البحث/الفلترة
  List<String> _searchHistory = []; // تخزين عمليات البحث السابقة
  Timer? _debounce;

  /// إرجاع تاريخ البحث (آخر بحث أول)
  List<String> get searchHistory => _searchHistory.reversed.toList();

  /// جلب جميع المنتجات
  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();

    result.fold((failure) => emit(ProductError(failure.message)), (products) {
      _allProducts = products;
      _sortedProducts = List.from(products);
      emit(ProductSuccess(_sortedProducts));
    });
  }

  Future<void> fetchBestSellingProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductError(failure.message)), (products) {
      _allProducts = products;
      _sortedProducts = List.from(products);
      emit(ProductSuccess(_sortedProducts));
    });
  }

  void searchProducts(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        _sortedProducts = List.from(_allProducts);
        emit(ProductSuccess(_sortedProducts));
        return;
      }

      // حفظ البحث الكامل فقط، إذا غير موجود
      if (!_searchHistory.contains(query)) {
        _searchHistory.add(query);
      }

      _sortedProducts =
          _allProducts
              .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
              .toList();

      emit(ProductSuccess(_sortedProducts));
    });
  }

  /// مسح البحث
  void clearSearch() {
    _sortedProducts = List.from(_allProducts);
    emit(ProductSuccess(_sortedProducts));
  }

  /// ترتيب حسب السعر من الأقل للأعلى
  void sortByLowestPrice() {
    _sortedProducts.sort((a, b) => a.price.compareTo(b.price));
    emit(ProductSuccess(List.from(_sortedProducts)));
  }

  /// ترتيب حسب السعر من الأعلى للأقل
  void sortByHighestPrice() {
    _sortedProducts.sort((a, b) => b.price.compareTo(a.price));
    emit(ProductSuccess(List.from(_sortedProducts)));
  }

  /// ترتيب أبجدي (A-Z)
  void sortAlphabetically() {
    _sortedProducts.sort((a, b) => a.name.compareTo(b.name));
    emit(ProductSuccess(List.from(_sortedProducts)));
  }

  /// عدد المنتجات الحالي
  int get productLength {
    if (state is ProductSuccess) {
      return (state as ProductSuccess).products.length;
    }
    return 0;
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

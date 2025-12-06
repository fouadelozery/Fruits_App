import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key, this.onChanged, this.onPressed});
  final void Function(String)? onChanged;
  final void Function()? onPressed;

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final TextEditingController _controller = TextEditingController();
  bool _showHistory = false;

  @override
  Widget build(BuildContext context) {
    // الحصول على الـ history من ProductCubit
    final history = context.watch<ProductCubit>().searchHistory;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 9,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          child: TextField(
            controller: _controller,
            onSubmitted: (value) {
              // <-- تحفظ آخر بحث عند الضغط على Enter
              if (value.isNotEmpty) {
                widget.onChanged?.call(value);
                setState(() {
                  _showHistory = false;
                });
              }
            },
            onChanged: (value) {
              widget.onChanged?.call(value); // للفلترة أثناء الكتابة
              setState(() {
                _showHistory = value.isEmpty;
              });
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              suffixIcon: SizedBox(
                width: 30,
                child: Center(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: widget.onPressed,
                      ),
                    ],
                  ),
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: AppColors.primaryColor,
              ),
              border: customBorder(),
              enabledBorder: customBorder(),
              hintText: "ابحث عن .........",
            ),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            keyboardAppearance: Brightness.light,
          ),
        ),
        // عرض البحث السابق
        if (_showHistory && history.isNotEmpty)
          Container(
            color: Colors.grey[200],
            child: Column(
              children:
                  history.map((e) {
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(
                        e,
                        style: const TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        _controller.text = e;
                        widget.onChanged?.call(e);
                        setState(() {
                          _showHistory = false;
                        });
                      },
                    );
                  }).toList(),
            ),
          ),
      ],
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hi`
  String get home_appbar_title {
    return Intl.message('Hi', name: 'home_appbar_title', desc: '', args: []);
  }

  /// `Welcome back`
  String get home_appbar_welcome {
    return Intl.message(
      'Welcome back',
      name: 'home_appbar_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Search for products...`
  String get home_search_hint {
    return Intl.message(
      'Search for products...',
      name: 'home_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `25% Discount`
  String get home_feature_discount {
    return Intl.message(
      '25% Discount',
      name: 'home_feature_discount',
      desc: '',
      args: [],
    );
  }

  /// `Ramadan Offers`
  String get home_feature_ramadan {
    return Intl.message(
      'Ramadan Offers',
      name: 'home_feature_ramadan',
      desc: '',
      args: [],
    );
  }

  /// `Best Sellers`
  String get home_most_selling {
    return Intl.message(
      'Best Sellers',
      name: 'home_most_selling',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get home_show_more {
    return Intl.message(
      'Show More',
      name: 'home_show_more',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get feature_shop_now {
    return Intl.message(
      'Shop Now',
      name: 'feature_shop_now',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart_title {
    return Intl.message('Cart', name: 'cart_title', desc: '', args: []);
  }

  /// `Your cart contains several items`
  String get cart_items_count {
    return Intl.message(
      'Your cart contains several items',
      name: 'cart_items_count',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to payment`
  String get cart_checkout_button {
    return Intl.message(
      'Proceed to payment',
      name: 'cart_checkout_button',
      desc: '',
      args: [],
    );
  }

  /// `Total Weight`
  String get cart_total_weight {
    return Intl.message(
      'Total Weight',
      name: 'cart_total_weight',
      desc: '',
      args: [],
    );
  }

  /// `Products available`
  String get product_available_count {
    return Intl.message(
      'Products available',
      name: 'product_available_count',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get product_details_title {
    return Intl.message(
      'Product Details',
      name: 'product_details_title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get product_description_label {
    return Intl.message(
      'Description',
      name: 'product_description_label',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get product_add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'product_add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Product added to the cart`
  String get product_added_message {
    return Intl.message(
      'Product added to the cart',
      name: 'product_added_message',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get product_price_label {
    return Intl.message(
      'Price',
      name: 'product_price_label',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating_label {
    return Intl.message('Rating', name: 'rating_label', desc: '', args: []);
  }

  /// `Calories`
  String get calories_label {
    return Intl.message('Calories', name: 'calories_label', desc: '', args: []);
  }

  /// `Orders`
  String get order_title {
    return Intl.message('Orders', name: 'order_title', desc: '', args: []);
  }

  /// `Order`
  String get order_id {
    return Intl.message('Order', name: 'order_id', desc: '', args: []);
  }

  /// `Total`
  String get order_total {
    return Intl.message('Total', name: 'order_total', desc: '', args: []);
  }

  /// `Payment Method`
  String get order_payment_method {
    return Intl.message(
      'Payment Method',
      name: 'order_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `There are no orders yet`
  String get order_empty {
    return Intl.message(
      'There are no orders yet',
      name: 'order_empty',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get order_pending {
    return Intl.message('Pending', name: 'order_pending', desc: '', args: []);
  }

  /// `Processing`
  String get order_processing {
    return Intl.message(
      'Processing',
      name: 'order_processing',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get order_done {
    return Intl.message('Completed', name: 'order_done', desc: '', args: []);
  }

  /// `Canceled`
  String get order_canceled {
    return Intl.message('Canceled', name: 'order_canceled', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout_title {
    return Intl.message('Checkout', name: 'checkout_title', desc: '', args: []);
  }

  /// `Shipping Address`
  String get checkout_address_title {
    return Intl.message(
      'Shipping Address',
      name: 'checkout_address_title',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get checkout_payment_title {
    return Intl.message(
      'Payment',
      name: 'checkout_payment_title',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get checkout_shipping_title {
    return Intl.message(
      'Shipping',
      name: 'checkout_shipping_title',
      desc: '',
      args: [],
    );
  }

  /// `The order has been submitted successfully`
  String get checkout_order_submitted {
    return Intl.message(
      'The order has been submitted successfully',
      name: 'checkout_order_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get address_name {
    return Intl.message('Name', name: 'address_name', desc: '', args: []);
  }

  /// `Phone Number`
  String get address_phone {
    return Intl.message(
      'Phone Number',
      name: 'address_phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get address_email {
    return Intl.message('Email', name: 'address_email', desc: '', args: []);
  }

  /// `City`
  String get address_city {
    return Intl.message('City', name: 'address_city', desc: '', args: []);
  }

  /// `Apartment Number`
  String get address_apartment {
    return Intl.message(
      'Apartment Number',
      name: 'address_apartment',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get shipping_cash_title {
    return Intl.message(
      'Cash on Delivery',
      name: 'shipping_cash_title',
      desc: '',
      args: [],
    );
  }

  /// `Pay in cash upon receiving the order`
  String get shipping_cash_subtitle {
    return Intl.message(
      'Pay in cash upon receiving the order',
      name: 'shipping_cash_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Online Payment`
  String get shipping_online_title {
    return Intl.message(
      'Online Payment',
      name: 'shipping_online_title',
      desc: '',
      args: [],
    );
  }

  /// `Pay online using your credit card`
  String get shipping_online_subtitle {
    return Intl.message(
      'Pay online using your credit card',
      name: 'shipping_online_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get payment_cash {
    return Intl.message(
      'Cash on Delivery',
      name: 'payment_cash',
      desc: '',
      args: [],
    );
  }

  /// `PayPal`
  String get payment_paypal {
    return Intl.message('PayPal', name: 'payment_paypal', desc: '', args: []);
  }

  /// `An error occurred`
  String get error_general {
    return Intl.message(
      'An error occurred',
      name: 'error_general',
      desc: '',
      args: [],
    );
  }

  /// `Product added to cart`
  String get product_added {
    return Intl.message(
      'Product added to cart',
      name: 'product_added',
      desc: '',
      args: [],
    );
  }

  /// `Product removed from cart`
  String get product_removed {
    return Intl.message(
      'Product removed from cart',
      name: 'product_removed',
      desc: '',
      args: [],
    );
  }

  /// `Unknown state`
  String get unknown_state {
    return Intl.message(
      'Unknown state',
      name: 'unknown_state',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get fruit_apple {
    return Intl.message('Apple', name: 'fruit_apple', desc: '', args: []);
  }

  /// `Banana`
  String get fruit_banana {
    return Intl.message('Banana', name: 'fruit_banana', desc: '', args: []);
  }

  /// `Orange`
  String get fruit_orange {
    return Intl.message('Orange', name: 'fruit_orange', desc: '', args: []);
  }

  /// `Mango`
  String get fruit_mango {
    return Intl.message('Mango', name: 'fruit_mango', desc: '', args: []);
  }

  /// `Grape`
  String get fruit_grape {
    return Intl.message('Grape', name: 'fruit_grape', desc: '', args: []);
  }

  /// `Peach`
  String get fruit_peach {
    return Intl.message('Peach', name: 'fruit_peach', desc: '', args: []);
  }

  /// `Pear`
  String get fruit_pear {
    return Intl.message('Pear', name: 'fruit_pear', desc: '', args: []);
  }

  /// `Plum`
  String get fruit_plum {
    return Intl.message('Plum', name: 'fruit_plum', desc: '', args: []);
  }

  /// `Cherry`
  String get fruit_cherry {
    return Intl.message('Cherry', name: 'fruit_cherry', desc: '', args: []);
  }

  /// `Strawberry`
  String get fruit_strawberry {
    return Intl.message(
      'Strawberry',
      name: 'fruit_strawberry',
      desc: '',
      args: [],
    );
  }

  /// `Pineapple`
  String get fruit_pineapple {
    return Intl.message(
      'Pineapple',
      name: 'fruit_pineapple',
      desc: '',
      args: [],
    );
  }

  /// `Watermelon`
  String get fruit_watermelon {
    return Intl.message(
      'Watermelon',
      name: 'fruit_watermelon',
      desc: '',
      args: [],
    );
  }

  /// `Melon`
  String get fruit_melon {
    return Intl.message('Melon', name: 'fruit_melon', desc: '', args: []);
  }

  /// `Kiwi`
  String get fruit_kiwi {
    return Intl.message('Kiwi', name: 'fruit_kiwi', desc: '', args: []);
  }

  /// `Papaya`
  String get fruit_papaya {
    return Intl.message('Papaya', name: 'fruit_papaya', desc: '', args: []);
  }

  /// `Guava`
  String get fruit_guava {
    return Intl.message('Guava', name: 'fruit_guava', desc: '', args: []);
  }

  /// `Apricot`
  String get fruit_apricot {
    return Intl.message('Apricot', name: 'fruit_apricot', desc: '', args: []);
  }

  /// `Fig`
  String get fruit_fig {
    return Intl.message('Fig', name: 'fruit_fig', desc: '', args: []);
  }

  /// `Date`
  String get fruit_date {
    return Intl.message('Date', name: 'fruit_date', desc: '', args: []);
  }

  /// `Avocado`
  String get fruit_avocado {
    return Intl.message('Avocado', name: 'fruit_avocado', desc: '', args: []);
  }

  /// `Dragon Fruit`
  String get fruit_dragon_fruit {
    return Intl.message(
      'Dragon Fruit',
      name: 'fruit_dragon_fruit',
      desc: '',
      args: [],
    );
  }

  /// `Passion Fruit`
  String get fruit_passion_fruit {
    return Intl.message(
      'Passion Fruit',
      name: 'fruit_passion_fruit',
      desc: '',
      args: [],
    );
  }

  /// `Lychee`
  String get fruit_lychee {
    return Intl.message('Lychee', name: 'fruit_lychee', desc: '', args: []);
  }

  /// `Persimmon`
  String get fruit_persimmon {
    return Intl.message(
      'Persimmon',
      name: 'fruit_persimmon',
      desc: '',
      args: [],
    );
  }

  /// `Coconut`
  String get fruit_coconut {
    return Intl.message('Coconut', name: 'fruit_coconut', desc: '', args: []);
  }

  /// `Starfruit`
  String get fruit_starfruit {
    return Intl.message(
      'Starfruit',
      name: 'fruit_starfruit',
      desc: '',
      args: [],
    );
  }

  /// `Rambutan`
  String get fruit_rambutan {
    return Intl.message('Rambutan', name: 'fruit_rambutan', desc: '', args: []);
  }

  /// `Longan`
  String get fruit_longan {
    return Intl.message('Longan', name: 'fruit_longan', desc: '', args: []);
  }

  /// `Mangosteen`
  String get fruit_mangosteen {
    return Intl.message(
      'Mangosteen',
      name: 'fruit_mangosteen',
      desc: '',
      args: [],
    );
  }

  /// `Blueberry`
  String get fruit_blueberry {
    return Intl.message(
      'Blueberry',
      name: 'fruit_blueberry',
      desc: '',
      args: [],
    );
  }

  /// `Blackberry`
  String get fruit_blackberry {
    return Intl.message(
      'Blackberry',
      name: 'fruit_blackberry',
      desc: '',
      args: [],
    );
  }

  /// `Raspberry`
  String get fruit_raspberry {
    return Intl.message(
      'Raspberry',
      name: 'fruit_raspberry',
      desc: '',
      args: [],
    );
  }

  /// `Cranberry`
  String get fruit_cranberry {
    return Intl.message(
      'Cranberry',
      name: 'fruit_cranberry',
      desc: '',
      args: [],
    );
  }

  /// `Lemon`
  String get fruit_lemon {
    return Intl.message('Lemon', name: 'fruit_lemon', desc: '', args: []);
  }

  /// `Lime`
  String get fruit_lime {
    return Intl.message('Lime', name: 'fruit_lime', desc: '', args: []);
  }

  /// `Mandarin`
  String get fruit_mandarin {
    return Intl.message('Mandarin', name: 'fruit_mandarin', desc: '', args: []);
  }

  /// `Clementine`
  String get fruit_clementine {
    return Intl.message(
      'Clementine',
      name: 'fruit_clementine',
      desc: '',
      args: [],
    );
  }

  /// `Grapefruit`
  String get fruit_grapefruit {
    return Intl.message(
      'Grapefruit',
      name: 'fruit_grapefruit',
      desc: '',
      args: [],
    );
  }

  /// `Tangerine`
  String get fruit_tangerine {
    return Intl.message(
      'Tangerine',
      name: 'fruit_tangerine',
      desc: '',
      args: [],
    );
  }

  /// `Soursop`
  String get fruit_soursop {
    return Intl.message('Soursop', name: 'fruit_soursop', desc: '', args: []);
  }

  /// `Durian`
  String get fruit_durian {
    return Intl.message('Durian', name: 'fruit_durian', desc: '', args: []);
  }

  /// `Jackfruit`
  String get fruit_jackfruit {
    return Intl.message(
      'Jackfruit',
      name: 'fruit_jackfruit',
      desc: '',
      args: [],
    );
  }

  /// `Tamarind`
  String get fruit_tamarind {
    return Intl.message('Tamarind', name: 'fruit_tamarind', desc: '', args: []);
  }

  /// `Carambola`
  String get fruit_carambola {
    return Intl.message(
      'Carambola',
      name: 'fruit_carambola',
      desc: '',
      args: [],
    );
  }

  /// `Mulberry`
  String get fruit_mulberry {
    return Intl.message('Mulberry', name: 'fruit_mulberry', desc: '', args: []);
  }

  /// `Quince`
  String get fruit_quince {
    return Intl.message('Quince', name: 'fruit_quince', desc: '', args: []);
  }

  /// `Pomegranate`
  String get fruit_pomegranate {
    return Intl.message(
      'Pomegranate',
      name: 'fruit_pomegranate',
      desc: '',
      args: [],
    );
  }

  /// `Sapodilla`
  String get fruit_sapodilla {
    return Intl.message(
      'Sapodilla',
      name: 'fruit_sapodilla',
      desc: '',
      args: [],
    );
  }

  /// `Boysenberry`
  String get fruit_boysenberry {
    return Intl.message(
      'Boysenberry',
      name: 'fruit_boysenberry',
      desc: '',
      args: [],
    );
  }

  /// `Gooseberry`
  String get fruit_gooseberry {
    return Intl.message(
      'Gooseberry',
      name: 'fruit_gooseberry',
      desc: '',
      args: [],
    );
  }

  /// `Cantaloupe`
  String get fruit_cantaloupe {
    return Intl.message(
      'Cantaloupe',
      name: 'fruit_cantaloupe',
      desc: '',
      args: [],
    );
  }

  /// `Honeydew`
  String get fruit_honeydew {
    return Intl.message('Honeydew', name: 'fruit_honeydew', desc: '', args: []);
  }

  /// `Logout`
  String get Log_out {
    return Intl.message('Logout', name: 'Log_out', desc: '', args: []);
  }

  /// `Home`
  String get ui_home {
    return Intl.message('Home', name: 'ui_home', desc: '', args: []);
  }

  /// `Products`
  String get ui_products {
    return Intl.message('Products', name: 'ui_products', desc: '', args: []);
  }

  /// `Cart`
  String get ui_cart {
    return Intl.message('Cart', name: 'ui_cart', desc: '', args: []);
  }

  /// `Account`
  String get ui_account {
    return Intl.message('Account', name: 'ui_account', desc: '', args: []);
  }

  /// `Pounds`
  String get ui_pounds {
    return Intl.message('Pounds', name: 'ui_pounds', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

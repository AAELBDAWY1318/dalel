import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool isLoading = true; // Controls loading indicator
  bool paymentCompleted = false; // Controls WebView display
  String? fawaterkUrl;
  late final WebViewController _controller;

  final apiUrl = 'https://staging.fawaterk.com/api/v2/invoiceInitPay';
  final apiToken = 'd83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd';
  final paymentId = 4; // Example: 2=Visa-MasterCard, 3=Fawry, 4=Meeza

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) => print('Loading: $url'),
          onPageFinished: (String url) => handleNavigationStateChange(url),
        ),
      );
    generateFawaterkSession();
  }

  Future<void> generateFawaterkSession() async {
    final data = {
      'payment_method_id': paymentId,
      'cartTotal': '100', // Replace with actual cart total
      'currency': 'EGP',
      'customer': {
        'first_name': 'test',
        'last_name': 'test',
        'email': 'test@test.test',
        'phone': '01000000000',
        'address': 'test address',
      },
      'redirectionUrls': {
        'successUrl': 'https://dev.fawaterk.com/success',
        'failUrl': 'https://dev.fawaterk.com/fail',
        'pendingUrl': 'https://dev.fawaterk.com/pending',
      },
      'cartItems': [
        {
          'name': 'test',
          'price': '100',
          'quantity': '1',
        },
      ],
    };

    final headers = {
      'Authorization': 'Bearer $apiToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(data),
      );

      final responseData = json.decode(response.body);
      print('API Response: $responseData'); // Debug log

      if (responseData != null &&
          responseData['data'] != null &&
          responseData['data']['payment_data'] != null) {
        setState(() {
          fawaterkUrl = responseData['data']['payment_data']['redirectTo'];
          isLoading = false;
          paymentCompleted = true;
        });
        _controller.loadRequest(Uri.parse(fawaterkUrl!));
      } else {
        throw Exception('Invalid API response format');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      showErrorDialog(error.toString());
    }
  }

  void handleNavigationStateChange(String url) {
    print('Navigating to: $url');

    // Replace 'https://dev.fawaterk.com/' with your redirection URLs
    if (url.contains('https://dev.fawaterk.com/')) {
      if (url.contains('success')) {
        print('Payment successful');
        showSuccessDialog();
      } else if (url.contains('fail')) {
        print('Payment failed');
        showErrorDialog('Payment failed. Please try again.');
      }
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Payment completed successfully.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(controller: _controller),
    );
  }
}

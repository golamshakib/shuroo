import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static const _otpLength = 6;
  static const _initialSeconds = 60;

  final List<TextEditingController> _controllers =
  List.generate(_otpLength, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(_otpLength, (_) => FocusNode());

  late Timer _timer;
  int _secondsRemaining = _initialSeconds;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = _initialSeconds;
      _canResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  String get _otp =>
      _controllers.map((c) => c.text.trim()).join();

  bool get _isOtpComplete => _otp.length == _otpLength;

  void _onDigitChanged(int index, String value) {
    if (value.length == 1 && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {}); // update button enabled state
  }

  void _verify() {
    // TODO: call your verify endpoint with _otp
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('OTP entered: $_otp')));
  }

  void _resendCode() {
    // TODO: trigger backend resend
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('New OTP sent')));
    for (final c in _controllers) c.clear();
    _focusNodes.first.requestFocus();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Enter the 6‑digit code sent to your phone',
                style: theme.textTheme.bodyMedium),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_otpLength, (i) {
                return SizedBox(
                  width: 48,
                  child: TextField(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    onChanged: (v) => _onDigitChanged(i, v),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall,
                    maxLength: 1,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(counterText: ''),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Text(
              _canResend
                  ? 'Didn’t get it?'
                  : 'Resend code in $_secondsRemaining s',
              style: theme.textTheme.bodySmall,
            ),
            TextButton(
              onPressed: _canResend ? _resendCode : null,
              child: const Text('Resend code'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isOtpComplete || _canResend ? _verify : null,
                child: const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    @required String? hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
     TextEditingController? controller,
    ValueChanged<String>? onChanged,
    int? maxlength,
    TextInputType? keyBoardType,
    Key? key,
    VoidCallback? onEditingComplete,
  })  : _hintText = hintText,
        _padding = padding,
        _controller = controller,
        _onChanged=onChanged,

  _maxlength = maxlength,
        _keyBoardType = keyBoardType,_onEditingComplete=onEditingComplete,
        super(key: key);

  final String? _hintText;
  final EdgeInsets _padding;
  final TextEditingController? _controller;
  final TextInputType? _keyBoardType;
final ValueChanged<String>? _onChanged;
final VoidCallback? _onEditingComplete;
final int? _maxlength;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: AppColor.placeholder,
          ),
          contentPadding: _padding,
          counterText: ""
        ),
        controller: _controller,
        onChanged:(String v)=> _onChanged,
        maxLength: _maxlength,
        keyboardType: _keyBoardType,
        onEditingComplete: _onEditingComplete,


      ),
    );
  }
}

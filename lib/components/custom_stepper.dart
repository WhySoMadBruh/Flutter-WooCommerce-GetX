import 'package:flutter/material.dart';
import 'package:mbb/controller/controllers.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    super.key,
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.iconSize,
    required this.value,
    required this.cartItemKey,
    required this.productId,
    required this.userId,
    required this.onChanged,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  final dynamic cartItemKey;
  final dynamic productId;
  final dynamic userId;
  int value;
  final ValueChanged<dynamic> onChanged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                widget.value = widget.value == widget.lowerLimit
                    ? widget.lowerLimit
                    : widget.value -= widget.stepValue;

                widget.onChanged(widget.value);
              });
              //update cart qunatity
              cartController.updateCart(
                  userId: widget.userId,
                  id: widget.productId,
                  cartItemKey: widget.cartItemKey,
                  quantity: widget.value);
            },
          ),
          SizedBox(
            width: 10,
            child: Text(
              '${widget.value}',
              style: TextStyle(
                fontSize: widget.iconSize * 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(
                () {
                  widget.value = widget.value == widget.upperLimit
                      ? widget.upperLimit
                      : widget.value += widget.stepValue;

                  widget.onChanged(widget.value);
                },
              );
              cartController.updateCart(
                userId: widget.userId,
                id: widget.productId,
                cartItemKey: widget.cartItemKey,
                quantity: widget.value,
              );
              //update cart qunatity
            },
          ),
        ],
      ),
    );
  }
}

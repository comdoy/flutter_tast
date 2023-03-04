import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child)? builder;
  final T? model;
  final Widget? child;
  final Function(T)? onReady;

  const ProviderWidget({
    Key? key,
    this.model,
    this.child,
    this.onReady,
    this.builder,
  }) : super(key: key);

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  @override
  void initState() {
    print(2);
    if (widget.onReady != null) {
      widget.onReady!(widget.model!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(5);
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model!,
      child: Consumer<T>(
        builder: widget.builder!,
        child: widget.child,
      ),
    );
  }
}

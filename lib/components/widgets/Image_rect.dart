import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';

String image =
    'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';
String imagee =
    "https://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh%3D600%2C800/sign=73e62ae9d854564ee530ec3f83eeb0ba/342ac65c10385343c14091db9613b07ecb8088b8.jpg";

class ImageRect extends StatelessWidget {
  const ImageRect({Key? key, this.value, this.fit, this.borderRadius})
      : super(key: key);
  final String? value;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: ImagesNetwork(
        fit: fit,
        value: value,
      ),
      borderRadius: borderRadius ??
          const BorderRadius.all(
            Radius.circular(8.0),
          ),
    );
  }
}

class ImagesNetwork extends StatelessWidget {
  const ImagesNetwork({Key? key, this.value, this.fit, this.and = true})
      : super(key: key);
  final String? value;
  final BoxFit? fit;
  final bool? and;
  @override
  Widget build(BuildContext context) {
    return value != '' && value != null
        ? Image.network('${Config.domain}/$value', fit: fit)
        : and == true
            ? Image.asset("assets/images/touimage.png", fit: fit)
            : Image.asset("assets/images/bai.jpg", fit: fit);
  }
}

class NetworkImageCell extends StatelessWidget {
  const NetworkImageCell({Key? key, this.value, this.child}) : super(key: key);
  final String? value;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                value != '' && value != null
                    ? '${Config.domain}/$value'
                    : image,
              ))),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Image(image: AssetImage("assets/images/no-internet.png")),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Center(
            child: Text(
              "Something went wrong!",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black54,
                  ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Center(
            child: Text(
              "No Internet Connection",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black54),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Center(
            child: Text(
              " Check your internet connection",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black38, fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }
}

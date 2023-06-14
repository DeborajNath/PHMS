import 'package:flutter/material.dart';

class Setion2TextfieldWidget extends StatelessWidget {
  const Setion2TextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Search a doctor or Schedule',
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w200),
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/group.png'),
                    width: 18,
                  )),
            ),
          ),
          Container(
            width: 46,
            height: 46,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffFFBE00),
            ),
            child: Container(
                width: 19,
                height: 19,
                child: InkWell(
                  child: const ImageIcon(
                    AssetImage('assets/filter.png'),
                  ),
                  onTap: () {},
                )),
          )
        ],
      ),
    );
  }
}

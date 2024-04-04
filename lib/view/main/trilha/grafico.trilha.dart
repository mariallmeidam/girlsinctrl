import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';

Widget grafico(context, String valor1, String valor2, String valor3) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Salários Médios: ",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 16,
              ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            "Júnior: ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                ),
          ),
          SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              Container(
                height: 14,
                width: size(context, 0.26),
                decoration: BoxDecoration(
                  color: Color.fromARGB(113, 158, 158, 158),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 14,
                  width: size(context, 0.1),
                  decoration: BoxDecoration(
                    color: Color(0xff2f1e81),
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            valor1,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                ),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            "Pleno: ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                ),
          ),
          SizedBox(
            width: 13,
          ),
          Stack(
            children: [
              Container(
                height: 14,
                width: size(context, 0.26),
                decoration: BoxDecoration(
                  color: Color.fromARGB(113, 158, 158, 158),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 14,
                  width: size(context, 0.15),
                  decoration: BoxDecoration(
                    color: Color(0xff2f1e81),
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            valor2,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                ),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            "Sênior: ",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                ),
          ),
          SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              Container(
                height: 14,
                width: size(context, 0.26),
                decoration: BoxDecoration(
                  color: Color.fromARGB(113, 158, 158, 158),
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: 14,
                  width: size(context, 0.2),
                  decoration: BoxDecoration(
                    color: Color(0xff2f1e81),
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            valor3,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontSize: 12,
                ),
          )
        ],
      ),
    ],
  );
}

import 'package:flutter/material.dart';

// melhorias do código:
// criei um novo parâmetro (isEnable) e adicionei um if para verificar
// se o botão está habilitado ou não  e troquei o GestureDetector por InkWell.
// adicionei o Semantics para melhorar a acessibilidade do app.

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: isEnabled ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(4, 4),
                  ),
                ]
              : null,
        ),
        child: Semantics(
          button: true,
          label: text,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isEnabled ? Colors.yellow : Colors.black26,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onPressed();
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.5),
//               blurRadius: 10,
//               offset: const Offset(4, 4),
//             ),
//           ],
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: const TextStyle(
//               color: Colors.yellow,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

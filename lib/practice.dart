/* Simple Hello, World! program */
import 'dart:io';

void main() {
  for (int i = 0; i < 10; i++) {
    for (int n = 0; n < 30; n++) {
      stdout.write('*');
    }
    stdout.write('* \n');
  }
}

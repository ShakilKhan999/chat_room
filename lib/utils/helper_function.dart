import 'package:intl/intl.dart';

String getFormattedDate(DateTime dt, {String format = 'dd/mm/yyyy HH:mm'}) =>
    DateFormat('dd/mm/yyyy HH:mm').format(dt);
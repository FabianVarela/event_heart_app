class Utils {
  static String getMonthString(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return 'ENE';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'ABR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AGO';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DIC';
      default:
        return '';
    }
  }

  static int getDayMonth(DateTime dateTime) {
    return dateTime.day;
  }

  static String getDayString(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Lunes';
      case 2:
        return 'Martes';
      case 3:
        return 'Miércoles';
      case 4:
        return 'Jueves';
      case 5:
        return 'Viernes';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return '';
    }
  }

  static String getHourString(DateTime dateTime) {
    final String minute = dateTime.minute.toString().length <= 1
        ? '0${dateTime.minute}'
        : '${dateTime.minute}';
    return '${dateTime.hour}:$minute';
  }
}

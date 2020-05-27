import 'package:flutter/material.dart';

class Event {
  Event(
    this.name,
    this.currentMonth,
    this.imageUrl, [
    this.eventDates,
    this.color,
  ]);

  final String name;
  final String currentMonth;
  final String imageUrl;
  final List<EventDate> eventDates;
  final Color color;
}

class EventDate {
  EventDate(this.date, this.place);

  final DateTime date;
  final String place;
}

List<Event> events = <Event>[
  Event(
    'Panic at the disco',
    'Junio 2020',
    'assets/images/data/panic.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.june, 20),
        'Movistar Arena',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.june, 25),
        'Movistar Arena',
      ),
    ],
    Color(0xFF350938),
  ),
  Event(
    'Estereo Picnic',
    'Diciembre 2020',
    'assets/images/data/estereo.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.december, 5),
        'Parque Jaime Duque',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.december, 6),
        'Parque Jaime Duque',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.december, 7),
        'Parque Jaime Duque',
      ),
    ],
    Color(0xFF380914),
  ),
  Event(
    'Guns n\' Roses',
    'Agosto 2020',
    'assets/images/data/guns.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.august, 6),
        'Estadio el Campin',
      )
    ],
    Color(0xFF160938),
  ),
  Event(
    'Flutter Hackathon',
    'Junio 2020',
    'assets/images/data/flutter.png',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.june, 25),
        'Online',
      )
    ],
    Color(0xFF093819),
  ),
  Event(
    'Flutter Conf',
    'Octubre 2020',
    'assets/images/data/conf.png',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.october, 1),
        'Marbella, Spain',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.october, 2),
        'Marbella, Spain',
      )
    ],
    Color(0xFF093138),
  ),
  Event(
    'Tomorrowland',
    'Julio 2020',
    'assets/images/data/tomorrowland.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.july, 23),
        'Boom, Belgium',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.july, 24),
        'Boom, Belgium',
      ),
    ],
    Color(0xFF203809),
  ),
  Event(
    'UMF Miami',
    'Marzo 2021',
    'assets/images/data/umf.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.march, 29),
        'Downtown Miami',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.march, 30),
        'Downtown Miami',
      ),
    ],
    Color(0xFF381D09),
  ),
  Event(
    'Burning man',
    'Septiembre 2020',
    'assets/images/data/burning.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.september, 21),
        'Black Rock City',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.september, 22),
        'Black Rock City',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.september, 23),
        'Black Rock City',
      ),
    ],
    Color(0xFF383109),
  ),
];

List<Event> pastEvents = <Event>[
  Event(
    'Gracias totales',
    'Febrero 2020',
    'assets/images/data/gracias_totales.jpeg',
  ),
  Event(
    'Foo fighters',
    'Enero 2020',
    'assets/images/data/foo.jpeg',
  ),
  Event(
    'Flutter Bootcamp',
    'Diciembre 2019',
    'assets/images/data/flutter_boot.jpeg',
  ),
  Event(
    'Call of Duty championship',
    'Marzo 2020',
    'assets/images/data/call.jpeg',
  ),
];

import 'package:flutter/material.dart';

class Event {
  Event(
    this.name,
    this.currentMonth,
    this.imageUrl, [
    this.eventDates,
    this.color,
    this.type,
    this.description,
    this.isSelected,
  ]);

  final String name;
  final String currentMonth;
  final String imageUrl;
  final List<EventDate> eventDates;
  final Color color;
  final String type;
  final String description;
  final bool isSelected;
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
        DateTime(DateTime.now().year, DateTime.june, 20, 18),
        'Movistar Arena',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.june, 21, 18),
        'Movistar Arena',
      ),
    ],
    Color(0xFF350938),
    'Concierto',
    'Panic! at the disco es un grupo estadounidense de rock formado en Las Vegas en 2004 por Ryan Ross y Spencer Smith. Tras varios cambios en su formación, desde 2015 está integrado únicamente por el cantante Brendon Urie, a quien en las giras acompañan Nicole Row en bajo, Mike Naran en guitarra y Dan Pawlovich en batería.',
    false,
  ),
  Event(
    'Estereo Picnic',
    'Diciembre 2020',
    'assets/images/data/estereo.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.december, 5, 12),
        'Parque Jaime Duque',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.december, 6, 12),
        'Parque Jaime Duque',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.december, 7, 12),
        'Parque Jaime Duque',
      ),
    ],
    Color(0xFF380914),
    'Concierto',
    'Creado en el año 2010 por un grupo independiente de promotores de eventos, con muchas dificultades sobre todo en las primeras ediciones, el "Festival Estéreo Picnic" se ha venido realizando en la Sabana de Bogotá con artistas nacionales e internacionales que ofrecen música Rock, Electrónica, Pop y Nuevo Folcklore entre muchos otros.',
    false,
  ),
  Event(
    'Guns n\' Roses',
    'Agosto 2020',
    'assets/images/data/guns.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.august, 6, 7, 30),
        'Estadio el Campin',
      )
    ],
    Color(0xFF160938),
    'Concierto',
    'Guns N\' Roses es una banda estadounidense de hard rock formada en Hollywood en la zona de Sunset Strip alrededor de Santa Monica, en la ciudad de Los Ángeles, California en 1985. El grupo fue fundado por el vocalista Axl Rose y el guitarrista Izzy Stradlin.',
    true,
  ),
  Event(
    'Flutter Hackathon',
    'Junio 2020',
    'assets/images/data/flutter.png',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.june, 25, 9, 30),
        'Online',
      )
    ],
    Color(0xFF093819),
    'Tecnología',
    'Join us for this years Online International Flutter Hackathon!',
    true,
  ),
  Event(
    'Flutter Conf',
    'Octubre 2020',
    'assets/images/data/conf.png',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.october, 1, 9),
        'Marbella, Spain',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.october, 2, 9),
        'Marbella, Spain',
      )
    ],
    Color(0xFF093138),
    'Tecnología',
    'FlutterConf es la primera conferencia sobre Flutter que congregará a todos los entusiastas, desarrolladores y empresas que están apostando por esta increible tecnología.',
    true,
  ),
  Event(
    'Tomorrowland',
    'Julio 2020',
    'assets/images/data/tomorrowland.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.july, 23, 13),
        'Boom, Belgium',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.july, 24, 13, 30),
        'Boom, Belgium',
      ),
    ],
    Color(0xFF203809),
    'Concierto',
    'Tomorrowland es un festival de música electrónica de baile celebrado anualmente en la localidad de Boom (Bélgica). El festival es organizado por ID&T y se calcula que anualmente acuden más de 400.000 personas de casi 200 nacionalidades distintas.',
    false,
  ),
  Event(
    'UMF Miami',
    'Marzo 2021',
    'assets/images/data/umf.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.march, 29, 10, 30),
        'Downtown Miami',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.march, 30, 10, 30),
        'Downtown Miami',
      ),
    ],
    Color(0xFF381D09),
    'Concierto',
    'Ultra Music Festival (UMF) es un festival anual de música electrónica, fundado en 1999 por la pareja de negocios Russell Faibisch y Alex Omes. El festival tiene lugar en marzo en la ciudad de Miami, Florida.',
    true,
  ),
  Event(
    'Burning man',
    'Septiembre 2020',
    'assets/images/data/burning.jpg',
    <EventDate>[
      EventDate(
        DateTime(DateTime.now().year, DateTime.september, 21, 8, 30),
        'Black Rock City',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.september, 22, 8, 30),
        'Black Rock City',
      ),
      EventDate(
        DateTime(DateTime.now().year, DateTime.september, 23, 8, 30),
        'Black Rock City',
      ),
    ],
    Color(0xFF383109),
    'Concierto',
    'El festival Burning Man (en español: "Hombre en llamas") es un evento anual de siete días de duración que se desarrolla en la "ciudad" de Black Rock, Nevada, Estados Unidos. Black Rock City (o "BRC"), que no es un municipio ni tiene gobierno, solo existe durante la semana de Burning Man, es decir, es una ciudad temporal construida por los participantes hasta el primer lunes de septiembre.',
    false,
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

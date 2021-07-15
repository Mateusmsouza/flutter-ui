import 'package:tour_app/model/Tour.dart';

class TourProvider {
  int _currentTour = 0;

  final List<Tour> _tours = [
    Tour(
      tourName: 'Sao Thome Das Letras',
      tourTime: '2h',
      price: 'R\$ 540,00',
      placesCount: '5',
      closeHrs: '2',
      rating: '4.4',
      coverImage: 'images/sao_thome_das_letras.jpg'
    ),
    Tour(
        tourName: 'Ubatuba',
        tourTime: '3h',
        price: 'R\$ 240,00',
        placesCount: '4',
        closeHrs: '9',
        rating: '4.0',
        coverImage: 'images/0820-construcoes-ubatuba.jpg'
    ),
    Tour(
        tourName: 'Ubatuba',
        tourTime: '3h',
        price: 'R\$ 240,00',
        placesCount: '4',
        closeHrs: '9',
        rating: '4.0',
        coverImage: 'images/0820-construcoes-ubatuba.jpg'
    ),
    Tour(
      tourName: 'Campos do Jordao',
      tourTime: '5h',
      price: 'R\$ 840,00',
      placesCount: '8',
      closeHrs: '9',
      rating: '4.3',
      coverImage: 'images/campos-do-jordao-naturam.jpg'
      )
  ];

  Tour currentTour(){
    return _tours[_currentTour];
  }

  Tour nextTour(){
    _currentTour = ++_currentTour % _tours.length;
    return _tours[_currentTour];
  }

  Tour previousTour(){
    _currentTour = _currentTour -1 < 0 ? _tours.length - 1 : _currentTour -1;
    return _tours[_currentTour];
  }
}
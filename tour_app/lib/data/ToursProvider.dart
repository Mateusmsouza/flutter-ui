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
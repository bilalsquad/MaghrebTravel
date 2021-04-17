import 'package:mon_app/models/city_model.dart';
import 'package:mon_app/models/trip.model.dart';

import '../models/activity.model.dart';

List<City> cities = [
  City(name: 'Algerie', image: 'assets/images/Algerie.png', activities: [
    Activity(
      image: 'assets/images/activities_algerie/makam.jpg',
      name: 'Makam Cha3id',
      id: 'a1',
      city: 'Alger',
      price: 15.00,
    ),
    Activity(
        image: 'assets/images/activities_algerie/mosquée.jpg',
        name: 'Mosquée Ketechaoua',
        id: 'a2',
        city: 'Alger',
        price: 8),
    Activity(
        image: 'assets/images/activities_algerie/taddart.jpg',
        name: 'Taddart Rouge',
        city: 'Alger',
        id: 'a3',
        price: 50),
  ]),
  City(name: 'Maroc', image: 'assets/images/maroc.gif', activities: [
    Activity(
        image: 'assets/images/activities_maroc/gorges de Dadès.jpg',
        name: 'Gorges de Dadès',
        id: 'm1',
        city: 'Casablanca',
        price: 4),
    Activity(
        image: 'assets/images/activities_maroc/mosque.jpg',
        name: 'Mosquée Hassan II',
        id: 'm2',
        city: 'Marakech',
        price: 78),
    Activity(
        image: 'assets/images/activities_maroc/surf.jpg',
        name: 'Surf',
        id: 'm3',
        city: 'Tanger',
        price: 3),
  ]),
  City(name: 'Tunisie', image: 'assets/images/tunisie.gif', activities: [
    Activity(
        image: 'assets/images/activities_tunisie/fort hammamet.jpg',
        name: 'Fort de Hammamet',
        id: 't1',
        city: 'Tunis',
        price: 12),
    Activity(
        image: 'assets/images/activities_tunisie/friguia park.jpg',
        name: 'Friguia Park',
        id: 't2',
        city: 'Souf',
        price: 10),
    Activity(
        image: 'assets/images/activities_tunisie/parc.jpg',
        name: 'Parc',
        id: 't3',
        city: 'Hammemet',
        price: 5),
  ]),
];

List<Trip> trips = [
  Trip(
    activities: [
      Activity(
        image: 'assets/images/activities_algerie/makam.jpg',
        name: 'Makam Cha3id',
        id: 'a1',
        city: 'Alger',
        price: 15.00,
        status: ActivityStatus.done,
      ),
      Activity(
        image: 'assets/images/activities_algerie/mosquée.jpg',
        name: 'Mosquée Ketechaoua',
        id: 'a2',
        city: 'Alger',
        price: 8,
        status: ActivityStatus.done,
      ),
      Activity(
        image: 'assets/images/activities_algerie/taddart.jpg',
        name: 'Taddart Rouge',
        city: 'Alger',
        id: 'a3',
        price: 50,
      ),
    ],
    city: 'Algerie',
    date: DateTime.now().add(
      Duration(days: 1),
    ),
  ),
  Trip(
      activities: [],
      city: 'Maroc',
      date: DateTime.now().add(Duration(days: 3))),
  Trip(
      activities: [],
      city: 'Tunisie',
      date: DateTime.now().subtract(Duration(days: 1))),
];

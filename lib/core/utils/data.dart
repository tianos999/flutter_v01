
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var profile = "https://avatars.githubusercontent.com/u/86506519?v=4";

List populars = [
  {
    "image": "https://images.unsplash.com/photo-1541151040323-4d766525ec84?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Salchipapas",
    "price": "\$120k",
    "location": "Miraflores, Lima",
    "is_favorited": false,
  },
  {
    "image": "https://images.unsplash.com/photo-1735924376724-10691f542ba0?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Algodon de Azúcar",
    "price": "\$140k",
    "location": "Santiago de surco, Lima",
    "is_favorited": true,
  },
  {
    "image": "https://images.unsplash.com/photo-1672523355871-ebcb079470d4?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Hot dogs",
    "price": "\$280k",
    "location": "Miraflores, Lima",
    "is_favorited": true,
  },
  {
    "image": "https://images.unsplash.com/photo-1578849278619-e73505e9610f?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Pop corn",
    "price": "\$150k",
    "location": "San isidro, Lima",
    "is_favorited": false,
  },
  {
    "image": "https://images.unsplash.com/photo-1543158181-1274e5362710?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Snacks saludables",
    "price": "\$175k",
    "location": "La molina, Lima",
    "is_favorited": false,
  },
];

List recommended = [
  {
    "image": "https://plus.unsplash.com/premium_photo-1666184891917-f518b68384d0?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Candy Snacks",
    "price": "\$180k",
    "location": "La molina, Lima",
    "is_favorited": true,
  },
  {
    "image": "https://images.unsplash.com/photo-1764025248642-6b0b403ac004?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Tortilla chip",
    "price": "\$175k",
    "location": "San isidro, Lima",
    "is_favorited": false,
  },
  {
    "image": "https://plus.unsplash.com/premium_photo-1684952848980-ae30a28543d6?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Algodon de azucar",
    "price": "\$180k",
    "location": "Miraflores, Lima",
    "is_favorited": true,
  },
];

List recents = [
  {
    "image": "https://images.unsplash.com/photo-1621939514649-280e2ee25f60?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Snack bar",
    "price": "\$180k",
    "location": "Miraflores, Lima",
    "is_favorited": false,
  },
  {
    "image": "https://images.unsplash.com/photo-1485963631004-f2f00b1d6606?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Chips de plátano",
    "price": "\$150k",
    "location": "San isidro, Lima",
    "is_favorited": false,
  },
  {
    "image": "https://images.unsplash.com/photo-1701341964637-94945a277fe0?q=80&w=800&auto=format&fit=crop&ixlib=rb-4.1.0",
    "name": "Double Villa",
    "price": "\$180k",
    "location": "Monterrico, Lima",
    "is_favorited": false,
  },
];

List categories = [
  {
    "name" : "Todo",
    "icon" :  FontAwesomeIcons.boxes
  },
  {
    "name" : "Helados",
    "icon" :  FontAwesomeIcons.iceCream
  },
  {
    "name" : "Sandwiches",
    "icon" :  FontAwesomeIcons.burger
  },
  {
    "name" : "Algodon",
    "icon" :  FontAwesomeIcons.cottonBureau
  },
  {
    "name" : "Pop Corn",
    "icon" :  FontAwesomeIcons.candyCane
  },
];

var brokers = [
    {
    "image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60", 
    "name": "John Siphron", 
    "type": "Broker", 
    "description": "1 - Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4, 
  },
  {
    "image":"https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name" : "Corey Aminoff",
    "type": "Broker", 
    "description": "2 - Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4, 
  },
  {
    "image" : "https://images.unsplash.com/photo-1617069470302-9b5592c80f66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Siriya Aminoff", 
    "type": "Broker", 
    "description": "3 - Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4, 
  },
  {
    "image" : "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Rubin Joe", 
    "type": "Broker", 
    "description": "4 - Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4, 
  },
];

List companies = [
  {
    "image": "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Helados el Polo",
    "location": "Phnom Penh, Cambodia",
    "type": "Jockey Plaza",
    "is_favorited": false,
    "icon" : Icons.domain_rounded
  },
  {
    "image": "https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Snacks el Gordo",
    "location": "Phnom Penh, Cambodia",
    "type": "Empresa gordo",
    "is_favorited": true,
    "icon" : Icons.house_siding_rounded
  },
  {
    "image": "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Dulces el Gato",
    "location": "Phnom Penh, Cambodia",
    "type": "Empresa 2",
    "is_favorited": true,
    "icon" : Icons.home_work_rounded
  },
  {
    "image": "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Cam Reality",
    "location": "Phnom Penh, Cambodia",
    "type": "Empresa gato",
    "is_favorited": true,
    "icon" : Icons.location_city_rounded
  },
];
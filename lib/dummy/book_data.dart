import 'package:riverpods/models/book.dart';

const bookData=[
  {
    'imageUrl':'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBook&psig=AOvVaw1WyVgG92XrE_HMUzzkAGS4&ust=1694518945902000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMi7tJS9ooEDFQAAAAAdAAAAABAE',
    'title':'Quran',
    'detail':'Islamic tradition relates that Muhammad received his first revelation in the Cave of Hira during one of his isolated retreats to the mountains. Thereafter, he received revelations over a period of 23 years. According to hadith and Muslim history, after Muhammad immigrated to Medina and formed an independent Muslim community, he ordered many of his companions to recite the Quran and to learn and teach the laws, which were revealed daily. It is related that some of the Quraysh who were taken prisoners at the Battle of Badr regained their freedom after they had taught some of the Muslims the simple writing of the time. Thus a group of Muslims gradually became literate.',
    'rating':'⭐⭐',
    'genre':'religious',
  },
  {
    'imageUrl':'https://np-live-21.slatic.net/kf/S6ce3c1ca95a041ab8b97af2fea27cf5fe.jpg',
    'title':'Bhagavad Geeta',
    'detail':'As per Hindu mythology, the Bhagavad Gita was written by the god Ganesha, as told to him by the sage Veda Vyasa. The Bhagavad Gita presents a synthesis of various Hindu ideas about dharma, theistic bhakti, and the yogic ideal of moksha.',
    'rating':'⭐⭐⭐⭐⭐',
    'genre':'religious',
  },
  {
    'imageUrl':'https://um-insight.net/downloads/313/download/Holy-Bible.jpg?cb=d7c66cda21ffa0b59262145100eec59f&w=1050',
    'title':'Bible',
    'detail':'Learn More about God, His Character, and How You Fit into His Kingdom Plan. See How You Can Reach the Nations for the Lord Using Ocean-Going Vessels. Adventure overseas.',
    'rating':'⭐⭐⭐',
    'genre':'religious',
  },
];
List<Book> books = bookData.map((e) => Book.fromJson(e)).toList();
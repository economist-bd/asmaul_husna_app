import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AsmaulHusnaApp());
}

class AsmaulHusnaApp extends StatelessWidget {
  const AsmaulHusnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asmaul Husna',
      theme: ThemeData(
        // অ্যাপের কালার থিম (গাঢ় নীল ও সোনালী)
        scaffoldBackgroundColor: const Color(0xFF0F2027),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37), // Gold color
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const NamesPageView(),
    );
  }
}

// নামের ডেটা মডেল
class NameData {
  final String arabic;
  final String bangla;
  final String english;
  final String pronunciation;
  final String meaning;

  NameData({
    required this.arabic,
    required this.bangla,
    required this.english,
    required this.pronunciation,
    required this.meaning,
  });
}

class NamesPageView extends StatefulWidget {
  const NamesPageView({super.key});

  @override
  State<NamesPageView> createState() => _NamesPageViewState();
}

class _NamesPageViewState extends State<NamesPageView> {
  final PageController _controller = PageController();

  // =========================================
  // আল্লাহর ৯৯টি নামের তালিকা (ডেটা সোর্স)
  // =========================================
  final List<NameData> namesList = [
    NameData(arabic: "اللَّهُ", bangla: "আল্লাহ", english: "Allah", pronunciation: "আল্লাহু", meaning: "যিনি ব্যতীত কোন উপাস্য নেই, একমাত্র সত্তা।"),
    NameData(arabic: "الرَّحْمَنُ", bangla: "আর-রহমান", english: "Ar-Rahman", pronunciation: "আর-রহমানু", meaning: "পরম দয়ালু, যার দয়া সবার জন্য উন্মুক্ত।"),
    NameData(arabic: "الرَّحِيمُ", bangla: "আর-রাহীম", english: "Ar-Raheem", pronunciation: "আর-রাহীমু", meaning: "অতি মেহেরবান, বিশেষ দয়ালু (মুমিনদের প্রতি)।"),
    NameData(arabic: "الْمَلِكُ", bangla: "আল-মালিক", english: "Al-Malik", pronunciation: "আল-মালিকু", meaning: "সর্বময় ক্ষমতার অধিকারী, প্রকৃত বাদশাহ।"),
    NameData(arabic: "الْقُدُّوسُ", bangla: "আল-কুদ্দুস", english: "Al-Quddus", pronunciation: "আল-কুদ্দুসু", meaning: "মহাসপবিত্র, সকল ত্রুটি থেকে মুক্ত।"),
    NameData(arabic: "السَّلَامُ", bangla: "আস-সালাম", english: "As-Salam", pronunciation: "আস-সালামু", meaning: "শান্তিদাতা, সকল প্রকারের নিরাপত্তা প্রদানকারী।"),
    NameData(arabic: "الْمُؤْمِنُ", bangla: "আল-মুমিন", english: "Al-Mu’min", pronunciation: "আল-মুমিনু", meaning: "নিরাপত্তা ও ঈমান দানকারী।"),
    NameData(arabic: "الْمُهَيْمِنُ", bangla: "আল-মুহাইমিন", english: "Al-Muhaymin", pronunciation: "আল-মুহাইমিনু", meaning: "রক্ষাকর্তা, প্রতিপালক, তদারককারী।"),
    NameData(arabic: "الْعَزِيزُ", bangla: "আল-আযীয", english: "Al-Aziz", pronunciation: "আল-আযীযু", meaning: "মহাপরাক্রমশালী, যার উপরে কেউ নেই।"),
    NameData(arabic: "الْجَبَّارُ", bangla: "আল-জাব্বার", english: "Al-Jabbar", pronunciation: "আল-জাব্বারু", meaning: "মহাপ্রতাপশালী, দুর্নিবার।"),
    NameData(arabic: "الْمُتَكَبِّرُ", bangla: "আল-মুতাকাব্বির", english: "Al-Mutakabbir", pronunciation: "আল-মুতাকাব্বিরু", meaning: "সর্বশ্রেষ্ঠ, অহংকারের একমাত্র অধিকারী।"),
    NameData(arabic: "الْخَالِقُ", bangla: "আল-খালিক্ব", english: "Al-Khaliq", pronunciation: "আল-খালিক্বু", meaning: "সৃষ্টিকর্তা, যিনি শূন্য থেকে সৃষ্টি করেন।"),
    NameData(arabic: "الْبَارِئُ", bangla: "আল-বারী", english: "Al-Bari’", pronunciation: "আল-বারীউ", meaning: "সঠিকভাবে সৃষ্টিকারী, পরিকল্পনাকারী।"),
    NameData(arabic: "الْمُصَوِّرُ", bangla: "আল-মুসাউইর", english: "Al-Musawwir", pronunciation: "আল-মুসাউইরু", meaning: "আকৃতি দানকারী, রূপদানকারী।"),
    NameData(arabic: "الْغَفَّارُ", bangla: "আল-গাফফার", english: "Al-Ghaffar", pronunciation: "আল-গাফফারু", meaning: "মহা ক্ষমাশীল, বার বার ক্ষমাকারী।"),
    NameData(arabic: "الْقَهَّارُ", bangla: "আল-কাহ্হার", english: "Al-Qahhar", pronunciation: "আল-কাহ্হারু", meaning: "মহাপরাক্রান্ত, সবকিছুর উপর বিজয়ী।"),
    NameData(arabic: "الْوَهَّابُ", bangla: "আল-ওয়াহ্হাব", english: "Al-Wahhab", pronunciation: "আল-ওয়াহ্হাবু", meaning: "মহা দাতা, কোন প্রতিদান ছাড়াই দানকারী।"),
    NameData(arabic: "الرَّزَّاقُ", bangla: "আর-রাজ্জাক", english: "Ar-Razzaq", pronunciation: "আর-রাজ্জাকু", meaning: "রিযিকদাতা, জীবিকা প্রদানকারী।"),
    NameData(arabic: "الْفَتَّاحُ", bangla: "আল-ফাত্তাহ", english: "Al-Fattah", pronunciation: "আল-ফাত্তাহু", meaning: "মহাবিজয়ী, উন্মুক্তকারী, ফয়সালাকারী।"),
    NameData(arabic: "الْعَلِيمُ", bangla: "আল-আলীম", english: "Al-‘Alim", pronunciation: "আল-আলীমু", meaning: "সর্বজ্ঞ, সবকিছু জানেন।"),
    NameData(arabic: "الْقَابِضُ", bangla: "আল-ক্ববিদ্ব", english: "Al-Qabid", pronunciation: "আল-ক্ববিদ্বু", meaning: "সংঙ্কুচিতকারী (জীবিকা বা জীবন)।"),
    NameData(arabic: "الْبَاسِطُ", bangla: "আল-বাসিত", english: "Al-Basit", pronunciation: "আল-বাসিতু", meaning: "প্রসারিতকারী (জীবিকা বা জীবন)।"),
    NameData(arabic: "الْخَافِضُ", bangla: "আল-খফিদ্ব", english: "Al-Khafid", pronunciation: "আল-খফিদ্বু", meaning: "অবনতকারী (কাফির ও মুশরিকদের)।"),
    NameData(arabic: "الرَّافِعُ", bangla: "আর-রাফিই", english: "Ar-Rafi‘", pronunciation: "আর-রাফিই'উ", meaning: "উন্নতকারী (মুমিনদের মর্যাদা)।"),
    NameData(arabic: "الْمُعِزُّ", bangla: "আল-মুই'যয", english: "Al-Mu’izz", pronunciation: "আল-মুই'যযু", meaning: "সম্মান প্রদানকারী।"),
    NameData(arabic: "الْمُذِلُّ", bangla: "আল-মুযিল", english: "Al-Muzil", pronunciation: "আল-মুযিলু", meaning: "অপমানকারী (অবাধ্যদের)।"),
    NameData(arabic: "السَّمِيعُ", bangla: "আস-সামী‘", english: "As-Sami‘", pronunciation: "আস-সামীউ", meaning: "সর্বশ্রোতা, সবকিছু শোনেন।"),
    NameData(arabic: "الْبَصِيرُ", bangla: "আল-বাসীর", english: "Al-Basir", pronunciation: "আল-বাসীরু", meaning: "সর্বদ্রষ্টা, সবকিছু দেখেন।"),
    NameData(arabic: "الْحَكَمُ", bangla: "আল-হাকাম", english: "Al-Hakam", pronunciation: "আল-হাকামু", meaning: "মহাবিচারক, হুকুমদাতা।"),
    NameData(arabic: "الْعَدْلُ", bangla: "আল-আদল", english: "Al-‘Adl", pronunciation: "আল-আদলু", meaning: "ন্যায়পরায়ণ, সুবিচারক।"),
    NameData(arabic: "اللَّطِيفُ", bangla: "আল-লাতীফ", english: "Al-Latif", pronunciation: "আল-লাতীফু", meaning: "সূক্ষ্মদর্শী, কোমল মনের অধিকারী।"),
    NameData(arabic: "الْخَبِيرُ", bangla: "আল-খাবীর", english: "Al-Khabir", pronunciation: "আল-খাবীরু", meaning: "মহা সংবাদরক্ষক, সবকিছু সম্পর্কে অবহিত।"),
    NameData(arabic: "الْحَلِيمُ", bangla: "আল-হালীর", english: "Al-Halim", pronunciation: "আল-হালীমু", meaning: "মহাসহিষ্ণু, ধৈর্যশীল।"),
    NameData(arabic: "الْعَظِيمُ", bangla: "আল-আযীম", english: "Al-‘Azim", pronunciation: "আল-আযীমু", meaning: "মহান, عظمت এর অধিকারী।"),
    NameData(arabic: "الْغَفُورُ", bangla: "আল-গফুর", english: "Al-Ghafur", pronunciation: "আল-গফুরু", meaning: "মহা ক্ষমাশীল।"),
    NameData(arabic: "الشَّكُورُ", bangla: "আশ-শাকূর", english: "Ash-Shakur", pronunciation: "আশ-শাকূরু", meaning: "গুণগ্রাহী, অল্প আমলে বেশি প্রতিদানকারী।"),
    NameData(arabic: "الْعَلِيُّ", bangla: "আল-আলীয়্যু", english: "Al-‘Aliyy", pronunciation: "আল-আলীয়্যু", meaning: "উচ্চ মর্যাদাবান, সুউচ্চ।"),
    NameData(arabic: "الْكَبِيرُ", bangla: "আল-কাবীর", english: "Al-Kabir", pronunciation: "আল-কাবীরু", meaning: "সুমহান, সবচেয়ে বড়।"),
    NameData(arabic: "الْحَفِيظُ", bangla: "আল-হাফীয", english: "Al-Hafiz", pronunciation: "আল-হাফীযু", meaning: "মহা রক্ষণাবেক্ষণকারী, হেফাজতকারী।"),
    NameData(arabic: "الْمُقِيتُ", bangla: "আল-মুক্বীত", english: "Al-Muqit", pronunciation: "আল-মুক্বীতু", meaning: "সবার রুজি ও শক্তির যোগানদাতা।"),
    NameData(arabic: "الْحَسِيبُ", bangla: "আল-হাসীব", english: "Al-Hasib", pronunciation: "আল-হাসীবু", meaning: "মহা হিসাব গ্রহণকারী।"),
    NameData(arabic: "الْجَلِيلُ", bangla: "আল-জালীল", english: "Al-Jalil", pronunciation: "আল-জালীলু", meaning: "মহা মহিমান্বিত।"),
    NameData(arabic: "الْكَرِيمُ", bangla: "আল-কারীম", english: "Al-Karim", pronunciation: "আল-কারীমু", meaning: "মহা অনুগ্রহকারী, উদার।"),
    NameData(arabic: "الرَّقِيبُ", bangla: "আর-রাক্বীব", english: "Ar-Raqib", pronunciation: "আর-রাক্বীবু", meaning: "মহা তদারককারী, তত্ত্বাবধায়ক।"),
    NameData(arabic: "الْمُجِيبُ", bangla: "আল-মুজিব", english: "Al-Mujib", pronunciation: "আল-মুজিবু", meaning: "দোয়া কবুলকারী, সাড়াদাতা।"),
    NameData(arabic: "الْوَاسِعُ", bangla: "আল-ওয়াসি‘", english: "Al-Wasi‘", pronunciation: "আল-ওয়াসিউ", meaning: "সর্বব্যাপী, যার অনুগ্রহ প্রশস্ত।"),
    NameData(arabic: "الْحَكِيمُ", bangla: "আল-হাকীম", english: "Al-Hakim", pronunciation: "আল-হাকীমু", meaning: "মহাজ্ঞানী, প্রজ্ঞাময়।"),
    NameData(arabic: "الْوَدُودُ", bangla: "আল-ওয়াদুদ", english: "Al-Wadud", pronunciation: "আল-ওয়াদুদু", meaning: "প্রেমময়, বান্দাদের প্রতি অত্যন্ত স্নেহশীল।"),
    NameData(arabic: "الْمَجِيدُ", bangla: "আল-মাজীদ", english: "Al-Majid", pronunciation: "আল-মাজীদের", meaning: "মহিমান্বিত, মর্যাদাবান।"),
    NameData(arabic: "الْبَاعِثُ", bangla: "আল-বাই'ছ", english: "Al-Ba’ith", pronunciation: "আল-বাই'ছু", meaning: "পুনরুজ্জীবিতকারী (মৃতদের)।"),
    NameData(arabic: "الشَّهِيدُ", bangla: "আশ-শাহীদ", english: "Ash-Shahid", pronunciation: "আশ-শাহীদু", meaning: "সর্ব সাক্ষী, প্রত্যক্ষদর্শী।"),
    NameData(arabic: "الْحَقُّ", bangla: "আল-হাক্ক", english: "Al-Haqq", pronunciation: "আল-হাক্কু", meaning: "সত্য, পরম সত্য।"),
    NameData(arabic: "الْوَكِيلُ", bangla: "আল-ওয়াকীল", english: "Al-Wakil", pronunciation: "আল-ওয়াকীলু", meaning: "মহা কর্মবিধায়ক, যার উপর ভরসা করা যায়।"),
    NameData(arabic: "الْقَوِيُّ", bangla: "আল-ক্বউইয়্যু", english: "Al-Qawiyy", pronunciation: "আল-ক্বউইয়্যু", meaning: "মহাশক্তিধর।"),
    NameData(arabic: "الْمَتِينُ", bangla: "আল-মাতীন", english: "Al-Matin", pronunciation: "আল-মাতীনু", meaning: "সুদৃঢ়, যার শক্তি অটুট।"),
    NameData(arabic: "الْوَلِيُّ", bangla: "আল-ওয়ালী", english: "Al-Waliyy", pronunciation: "আল-ওয়ালীয়্যু", meaning: "অভিভাবক, বন্ধু, সাহায্যকারী।"),
    NameData(arabic: "الْحَمِيدُ", bangla: "আল-হামীর", english: "Al-Hamid", pronunciation: "আল-হামীরু", meaning: "সকল প্রশংসার অধিকারী।"),
    NameData(arabic: "الْمُحْصِي", bangla: "আল-মুহসী", english: "Al-Muhsi", pronunciation: "আল-মুহসী", meaning: "সকল কিছুর হিসাব রক্ষক।"),
    NameData(arabic: "الْمُبْدِئُ", bangla: "আল-মুবদি’", english: "Al-Mubdi‘", pronunciation: "আল-মুবদিউ", meaning: "প্রথমবার সৃষ্টিকারী।"),
    NameData(arabic: "الْمُعِيدُ", bangla: "আল-মুঈ'দ", english: "Al-Mu’id", pronunciation: "আল-মুঈ'দু", meaning: "পুনরায় সৃষ্টিকারী।"),
    NameData(arabic: "الْمُحْيِي", bangla: "আল-মুহ্য়ী", english: "Al-Muhyi", pronunciation: "আল-মুহ্য়ী", meaning: "জীবন দাতা।"),
    NameData(arabic: "الْمُمِيتُ", bangla: "আল-মুমীত", english: "Al-Mumit", pronunciation: "আল-মুমীতু", meaning: "মৃত্যু দাতা।"),
    NameData(arabic: "الْحَيُّ", bangla: "আল-হাইয়্যু", english: "Al-Hayy", pronunciation: "আল-হাইয়্যু", meaning: "চিরঞ্জীব।"),
    NameData(arabic: "الْقَيُّومُ", bangla: "আল-ক্বাইয়্যূম", english: "Al-Qayyum", pronunciation: "আল-ক্বাইয়্যূমু", meaning: "চিরস্থায়ী, যিনি নিজে নিজের দ্বারা প্রতিষ্ঠিত এবং অন্যকে ধারণ করেন।"),
    NameData(arabic: "الْوَاجِدُ", bangla: "আল-ওয়াজিদ", english: "Al-Wajid", pronunciation: "আল-ওয়াজিদু", meaning: "সবকিছুর প্রাপ্তি যার কাছে, কোনো কিছুর অভাব যার নেই।"),
    NameData(arabic: "الْمَاجِدُ", bangla: "আল-মাজিদ", english: "Al-Majid", pronunciation: "আল-মাজিদু", meaning: "মহান ও গৌরবময়।"),
    NameData(arabic: "الْوَاحِدُ", bangla: "আল-ওয়াহিদ", english: "Al-Wahid", pronunciation: "আল-ওয়াহিদু", meaning: "এক, অদ্বিতীয়।"),
    NameData(arabic: "الْأَحَد", bangla: "আল-আহাদ", english: "Al-Ahad", pronunciation: "আল-আহাদু", meaning: "একক সত্তা (যার কোনো অংশীদার বা সমকক্ষ নেই)।"),
    NameData(arabic: "الصَّمَدُ", bangla: "আস-সামাদ", english: "As-Samad", pronunciation: "আস-সামাদু", meaning: "অমুখাপেক্ষী, সবাই যার মুখাপেক্ষী।"),
    NameData(arabic: "الْقَادِرُ", bangla: "আল-ক্বদির", english: "Al-Qadir", pronunciation: "আল-ক্বদিরু", meaning: "সর্বশক্তিমান।"),
    NameData(arabic: "الْمُقْتَدِرُ", bangla: "আল-মুক্বতাদির", english: "Al-Muqtadir", pronunciation: "আল-মুক্বতাদিরু", meaning: "অসীম ক্ষমতার অধিকারী।"),
    NameData(arabic: "الْمُقَدِّمُ", bangla: "আল-মুক্বাদ্দিম", english: "Al-Muqaddim", pronunciation: "আল-মুক্বাদ্দিমু", meaning: "অগ্রবর্তীকারী (যাকে ইচ্ছা)।"),
    NameData(arabic: "الْمُؤَخِّرُ", bangla: "আল-মুয়াক্খির", english: "Al-Mu’akhkhir", pronunciation: "আল-মুয়াক্খিরু", meaning: "পশ্চাত্পদকারী (যাকে ইচ্ছা)।"),
    NameData(arabic: "الْأَوَّلُ", bangla: "আল-আউয়াল", english: "Al-Awwal", pronunciation: "আল-আউয়ালু", meaning: "অনাদি, সবার প্রথম।"),
    NameData(arabic: "الْآخِرُ", bangla: "আল-আখির", english: "Al-Akhir", pronunciation: "আল-আখিরু", meaning: "অনন্ত, সবার শেষ।"),
    NameData(arabic: "الظَّاهِرُ", bangla: "আজ-জাহির", english: "Az-Zahir", pronunciation: "আজ-জাহিরু", meaning: "প্রকাশ্য (স্বীয় কুদরতের মাধ্যমে)।"),
    NameData(arabic: "الْبَاطِنُ", bangla: "আল-বাতিন", english: "Al-Batin", pronunciation: "আল-বাতিনু", meaning: "গোপন (সত্তাগতভাবে)।"),
    NameData(arabic: "الْوَالِي", bangla: "আল-ওয়ালী", english: "Al-Wali", pronunciation: "আল-ওয়ালী", meaning: "সকল কিছুর পরিচালক ও শাসক।"),
    NameData(arabic: "الْمُتَعَالِي", bangla: "আল-মুতাআ'লী", english: "Al-Muta’ali", pronunciation: "আল-মুতাআ'লী", meaning: "সর্বোচ্চ, সৃষ্টির গুণাবলী থেকে পবিত্র।"),
    NameData(arabic: "الْبَرُّ", bangla: "আল-বার্র", english: "Al-Barr", pronunciation: "আল-বার্রু", meaning: "মহান অনুগ্রহকারী, কল্যাণময়।"),
    NameData(arabic: "التَّوَّابُ", bangla: "আত-তাওয়াব", english: "At-Tawwab", pronunciation: "আত-তাওয়াবু", meaning: "তওবা কবুলকারী।"),
    NameData(arabic: "الْمُنْتَقِمُ", bangla: "আল-মুনতাক্বিম", english: "Al-Muntaqim", pronunciation: "আল-মুনতাক্বিমু", meaning: "প্রতিশোধ গ্রহণকারী (অপরাধীদের থেকে)।"),
    NameData(arabic: "الْعَفُوُّ", bangla: "আল-আ'ফুউ", english: "Al-‘Afuww", pronunciation: "আল-আ'ফুউউ", meaning: "মহা ক্ষমাশীল, পাপ মোচনকারী।"),
    NameData(arabic: "الرَّءُوفُ", bangla: "আর-রাউফ", english: "Ar-Ra’uf", pronunciation: "আর-রাউফু", meaning: "অত্যন্ত স্নেহশীল, কোমল।"),
    NameData(arabic: "مَالِكُ الْمُلْكِ", bangla: "মালিকুল মুলক", english: "Malik-ul-Mulk", pronunciation: "মালিকুল মুলকি", meaning: "সমগ্র জগতের একচ্ছত্র মালিক।"),
    NameData(arabic: "ذُو الْجَلَالِ وَالْإِكْرَامِ", bangla: "যুল-জালালি ওয়াল-ইকরাম", english: "Zul-Jalali wal-Ikram", pronunciation: "যুল-জালালি ওয়াল-ইকরামি", meaning: "মহিমাময় ও মহানুভব সত্তা।"),
    NameData(arabic: "الْمُقْسِطُ", bangla: "আল-মুক্বসিত", english: "Al-Muqsit", pronunciation: "আল-মুক্বসিতু", meaning: "ন্যায়বিচারক।"),
    NameData(arabic: "الْجَامِعُ", bangla: "আল-জামিই'", english: "Al-Jami‘", pronunciation: "আল-জামিই'উ", meaning: "একত্রকারী (হাশরের ময়দানে)।"),
    NameData(arabic: "الْغَنِيُّ", bangla: "আল-গানিয়্যু", english: "Al-Ghaniyy", pronunciation: "আল-গানিয়্যু", meaning: "ঐশ্বর্যশালী, অমুখাপেক্ষী।"),
    NameData(arabic: "الْمُغْنِي", bangla: "আল-মুগনী", english: "Al-Mughni", pronunciation: "আল-মুগনী", meaning: "ধনীকারী, অভাবমোচনকারী।"),
    NameData(arabic: "الْمَانِعُ", bangla: "আল-মানিই'", english: "Al-Mani‘", pronunciation: "আল-মানিই'উ", meaning: "প্রতিরোধকারী, অকল্যাণ থেকে রক্ষাকারী।"),
    NameData(arabic: "الضَّارُّ", bangla: "আদ্ব-দ্বারর", english: "Ad-Darr", pronunciation: "আদ্ব-দ্বাররু", meaning: "ক্ষতিকারী (যাকে ইচ্ছা, পরীক্ষার জন্য)।"),
    NameData(arabic: "النَّافِعُ", bangla: "আন-নাফিই'", english: "An-Nafi‘", pronunciation: "আন-নাফিই'উ", meaning: "কল্যাণকারী, উপকারকারী।"),
    NameData(arabic: "النُّورُ", bangla: "আন-নূর", english: "An-Nur", pronunciation: "আন-নূরু", meaning: "জ্যোতি, আলো দানকারী।"),
    NameData(arabic: "الْهَادِي", bangla: "আল-হাদী", english: "Al-Hadi", pronunciation: "আল-হাদী", meaning: "পথপ্রদর্শক, হেদায়েতকারী।"),
    NameData(arabic: "الْبَدِيعُ", bangla: "আল-বাদীই'", english: "Al-Badi‘", pronunciation: "আল-বাদীই'উ", meaning: "অতুলনীয় স্রষ্টা (নমুনা ছাড়া সৃষ্টিকারী)।"),
    NameData(arabic: "الْبَاقِي", bangla: "আল-বাক্বী", english: "Al-Baqi", pronunciation: "আল-বাক্বী", meaning: "চিরস্থায়ী, অবিনশ্বর।"),
    NameData(arabic: "الْوَارِثُ", bangla: "আল-ওয়ারিছ", english: "Al-Warith", pronunciation: "আল-ওয়ারিছু", meaning: "সবকিছুর চূড়ান্ত মালিক।"),
    NameData(arabic: "الرَّشِيدُ", bangla: "আর-রাশীদ", english: "Ar-Rashid", pronunciation: "আর-রাশীদু", meaning: "সঠিক পথ প্রদর্শনকারী, প্রজ্ঞাময় পরিচালক।"),
    NameData(arabic: "الصَّبُورُ", bangla: "আস-সাবূর", english: "As-Sabur", pronunciation: "আস-সাবূরু", meaning: "মহা ধৈর্যশীল।"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("আসমাউল হুসনা"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.tiroBangla(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFD4AF37), // Gold
        ),
      ),
      // PageView ব্যবহার করা হয়েছে যাতে স্লাইড করে নামগুলো দেখা যায়
      body: PageView.builder(
        controller: _controller,
        itemCount: namesList.length,
        itemBuilder: (context, index) {
          final data = namesList[index];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ক্রমিক নম্বর
                  Text(
                    "${index + 1} / 99",
                    style: const TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                  const SizedBox(height: 40),

                  // ==============================
                  // ক্যালিগ্রাফি সেকশন (Arabic)
                  // ==============================
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFD4AF37), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFD4AF37).withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        data.arabic,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.amiri( // Amiri একটি সুন্দর আরবি ফন্ট
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD4AF37), // Gold color
                          shadows: [
                            const Shadow(blurRadius: 10.0, color: Colors.black, offset: Offset(2.0, 2.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),

                  // ==============================
                  // বিস্তারিত তথ্য সেকশন
                  // ==============================
                  Card(
                    color: Colors.white.withOpacity(0.05),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          // বাংলা নাম
                          Text(
                            data.bangla,
                            style: GoogleFonts.tiroBangla(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // ইংরেজি নাম
                          Text(
                            data.english,
                            style: const TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                          const Divider(color: Color(0xFFD4AF37), height: 30),

                          // উচ্চারণ
                          _buildInfoRow("উচ্চারণ:", data.pronunciation),
                          const SizedBox(height: 15),
                          // অর্থ
                          _buildInfoRow("অর্থ:", data.meaning, isMeaning: true),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // তথ্য দেখানোর জন্য একটি হেল্পার উইজেট
  Widget _buildInfoRow(String label, String value, {bool isMeaning = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.center,
          style: GoogleFonts.tiroBangla(
            fontSize: isMeaning ? 20 : 22,
            color: Colors.white,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
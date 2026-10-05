import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ───────── Tema & helper ─────────
const bg = Color(0xFFFCF8F0), green = Color(0xFF17352A), orange = Color(0xFFE3963A), beige = Color(0xFFF2EBDD), line = Color(0xFFE3DCCB), muted = Color(0xFF6F6F66);

TextStyle serif(double s, {Color c = green}) => GoogleFonts.fraunces(fontSize: s, fontWeight: FontWeight.w600, color: c, height: 1.15);
TextStyle sans(double s, {FontWeight w = FontWeight.w400, Color c = const Color(0xFF1C1C1C)}) => GoogleFonts.inter(fontSize: s, fontWeight: w, color: c);
String rp(int n) => 'Rp${n.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}';
BoxDecoration cardBox() => BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: line));
Widget pad(Widget w, [double v = 0]) => Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: v), child: w);

// ───────── Data ─────────
class Item {
  final String name, sub, img, stall;
  final int price;
  const Item(this.name, this.sub, this.price, this.img, [this.stall = '']);
  @override
  bool operator ==(Object o) => o is Item && o.name == name && o.stall == stall;
  @override
  int get hashCode => Object.hash(name, stall);
}

class Stall {
  final String name, cat, item, tag, img, prep;
  final double rating;
  final int no, price;
  const Stall(this.name, this.cat, this.rating, this.no, this.item, this.price, this.tag, this.img, this.prep);
  List<Item> get menu => name == 'Sego Liwet Bakar Kemangi' ? liwet : [Item(item, 'Porsi', price, img, name)];
}

class Cat {
  final String title, emoji, sub, hint, favTitle, favSub, listTitle, note;
  final int count;
  final List<String> filters;
  final List<Item> favs;
  final List<Stall> stalls;
  const Cat(this.title, this.emoji, this.count, this.sub, this.hint, this.filters, this.favTitle, this.favSub, this.favs, this.listTitle, this.stalls, this.note);
}

const liwet = [
  Item('Sego Liwet Bakar Ayam', 'Porsi · daun pisang', 15000, 'liwet_ayam', 'Sego Liwet Bakar Kemangi'),
  Item('Sego Liwet Bakar Tuna', 'Porsi · daun pisang', 15000, 'liwet_tuna', 'Sego Liwet Bakar Kemangi'),
  Item('Sego Liwet Bakar Teri', 'Porsi · daun pisang', 15000, 'liwet_teri', 'Sego Liwet Bakar Kemangi'),
  Item('Sego Liwet Bakar Cumi', 'Porsi · daun pisang', 16000, 'liwet_cumi', 'Sego Liwet Bakar Kemangi'),
];
const supina = Stall('Nasi Buk Hj. Supina', 'Makanan Berat', 4.9, 3, 'Nasi buk komplit', 25000, 'Nasi, lauk, serundeng', 'nasi_buk', '10–15 menit');
const kemangi = Stall('Sego Liwet Bakar Kemangi', 'Makanan Berat', 4.8, 8, 'Liwet bakar ayam', 15000, 'Dibungkus daun pisang', 'liwet', '10–15 menit');
const marjo = Stall('Sate Mari Kerjo (Marjo)', 'Sate & Bakar', 5.0, 15, 'Sate ayam', 20000, 'Bumbu kacang', 'sate', '15–20 menit');
const klepon = Stall('Klepon-Ku', 'Jajanan Manis', 4.8, 19, 'Klepon gula merah', 10000, 'Gula merah cair', 'klepon', '5–10 menit');
const petaStalls = [supina, kemangi, marjo, klepon];

const makanan = Cat('Makanan Berat', '🍚', 14, 'Nasi, lauk, dan kuah hangat dari pasar.', 'Cari nasi, rawon, atau warung...', ['Semua menu', 'Buka sekarang', 'Harga ▾'], 'Menu favorit', 'Pilihan mengenyangkan, dimasak saat dipesan.',
    [Item('Nasi Buk Komplit', 'Nasi, lauk, serundeng', 25000, 'nasi_buk', 'Nasi Buk Hj. Supina'), Item('Liwet Bakar Ayam', 'Porsi · daun pisang', 15000, 'liwet', 'Liwet Bakar Kemangi')],
    'Warung makanan berat', [supina, kemangi], '🍚 Porsi bisa disesuaikan, tambahkan catatan saat memesan.');
const sate = Cat('Sate & Bakar', '🍢', 8, 'Sate berbumbu dan aneka bakaran arang.', 'Cari sate, ayam bakar, atau warung...', ['Semua menu', 'Buka sekarang', 'Harga ▾'], 'Menu favorit', 'Dibakar langsung, harum sampai ke rumah.',
    [Item('Sate Ayam', '10 tusuk · bumbu kacang', 20000, 'sate', 'Sate Ayam Pak Hasan'), Item('Ayam Bakar + Nasi', 'Porsi · sambal & lalapan', 23000, 'ayam_bakar', 'Ayam Bakar Bu Rini')],
    'Warung sate & bakar', [
      Stall('Sate Ayam Pak Hasan', 'Sate & Bakar', 4.9, 0, 'Sate ayam 10 tusuk', 20000, 'Bumbu kacang khas', 'sate', '15–20 menit'),
      Stall('Ayam Bakar Bu Rini', 'Sate & Bakar', 4.8, 0, 'Ayam bakar + nasi', 23000, 'Bakar arang', 'ayam_bakar', '15–20 menit'),
      Stall('Sate Kambing Pak Yusuf', 'Sate & Bakar', 4.8, 0, 'Sate kambing 10 tusuk', 32000, 'Kecap dan irisan cabai', 'sate_kambing', '15–20 menit'),
      Stall('Ikan Bakar Cak Din', 'Sate & Bakar', 4.7, 0, 'Nila bakar + nasi', 28000, 'Sambal terasi segar', 'ikan_bakar', '20–25 menit'),
    ], '🔥 Dibakar setelah dipesan. Waktu siap tiap warung berbeda.');
const kopi = Cat('Kopi & Minuman', '☕', 7, 'Kopi seduh, minuman segar, dan wedang.', 'Cari kopi, es dawet, atau warung...', ['Semua menu', 'Dingin', 'Hangat', 'Harga ▾'], 'Minuman favorit', 'Teman sarapan dan pelengkap makan siang.',
    [Item('Es Kopi Susu', 'Gelas · gula aren', 12000, 'es_kopi', 'Kopi Pasar Pak Budi'), Item('Es Dawet Gula Aren', 'Gelas · santan segar', 8000, 'dawet', 'Dawet Ayu Bu Tini')],
    'Warung kopi & minuman', [
      Stall('Kopi Pasar Pak Budi', 'Kopi & Minuman', 4.9, 0, 'Es kopi susu', 12000, 'Kopi seduh segar', 'es_kopi', '5–10 menit'),
      Stall('Dawet Ayu Bu Tini', 'Kopi & Minuman', 4.8, 0, 'Es dawet gula aren', 8000, 'Gula aren asli', 'dawet', '5–10 menit'),
      Stall('Es Jeruk Pak Slamet', 'Kopi & Minuman', 4.7, 0, 'Es jeruk peras', 7000, 'Jeruk peras segar', 'es_jeruk', '5–10 menit'),
      Stall('Wedang Rempah Bu Lastri', 'Kopi & Minuman', 4.8, 0, 'Wedang jahe', 8000, 'Hangat & berempah', 'wedang', '5–10 menit'),
    ], '☕ Pilih tingkat gula dan es saat menambahkan minuman.');
const cats = [makanan, sate, kopi];

// ───────── State keranjang ─────────
final cart = ValueNotifier<Map<Item, int>>({});
final tab = ValueNotifier<int>(0);
void add(Item i) {
  final m = Map<Item, int>.from(cart.value);
  m[i] = (m[i] ?? 0) + 1;
  cart.value = m;
}

int cartTotal() => cart.value.entries.fold(0, (s, e) => s + e.key.price * e.value);
int cartCount() => cart.value.values.fold(0, (s, q) => s + q);
void go(BuildContext c, int i) {
  tab.value = i;
  Navigator.of(c).popUntil((r) => r.isFirst);
}

// ───────── Widget kecil ─────────
Widget pill(String t) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: beige, borderRadius: BorderRadius.circular(20)),
    child: Text(t, style: sans(11, w: FontWeight.w600, c: green)));

Widget chip(String t, bool sel, {bool fill = false, bool dark = true, VoidCallback? f}) => GestureDetector(
    onTap: f,
    child: Container(
        alignment: fill ? Alignment.center : null,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(color: sel ? (dark ? green : beige) : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: sel && dark ? green : line)),
        child: Text(t, maxLines: 1, style: sans(12, w: FontWeight.w600, c: sel && dark ? Colors.white : green))));

Widget search(String h) => Container(
    height: 40,
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: line)),
    child: Row(children: [
      Text('🔍  ', style: TextStyle(fontSize: 13)),
      Expanded(child: TextField(decoration: InputDecoration.collapsed(hintText: h, hintStyle: sans(13, c: muted)), style: sans(13))),
    ]));

Widget locPill() => Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: line)),
    child: Text.rich(TextSpan(style: sans(13), children: [
      TextSpan(text: '📍 Dikirim ke '),
      TextSpan(text: 'Jl. Veteran, Malang', style: sans(13, w: FontWeight.w700)),
      TextSpan(text: ' ▾', style: sans(10)),
    ])));

Widget btn(String t, Color b, Color fg, VoidCallback? f, {bool outline = false}) => SizedBox(
    width: double.infinity,
    height: 46,
    child: ElevatedButton(
        onPressed: f,
        style: ElevatedButton.styleFrom(backgroundColor: b, foregroundColor: fg, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: outline ? BorderSide(color: Colors.white38) : BorderSide.none)),
        child: Text(t, style: sans(14, w: FontWeight.w700, c: fg))));

Widget pillBtn(String t) => Container(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
    decoration: BoxDecoration(color: beige, borderRadius: BorderRadius.circular(20)),
    child: Text(t, style: sans(12, w: FontWeight.w700, c: green)));

Widget iconBox(String e) => Container(width: 40, height: 40, alignment: Alignment.center, decoration: BoxDecoration(color: beige, borderRadius: BorderRadius.circular(12)), child: Text(e, style: TextStyle(fontSize: 18)));

Widget footer() => Container(
    color: green,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('© Pasar Oro-Oro Dowo', style: sans(12, c: Colors.white70)),
      Text('Malang', style: sans(12, c: Colors.white70)),
    ]));

Widget sumRow(String a, String b, {bool bold = false}) => Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(a, style: sans(bold ? 14 : 13, w: bold ? FontWeight.w700 : FontWeight.w400, c: bold ? Color(0xFF1C1C1C) : muted)),
      Text(b, style: sans(bold ? 14 : 13, w: FontWeight.w700)),
    ]));

class Img extends StatelessWidget {
  final String n;
  const Img(this.n, {super.key});
  @override
  Widget build(BuildContext c) => Image.asset('assets/images/$n.jpg',
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(color: Color(0xFFD8CDB4), alignment: Alignment.center, child: Icon(Icons.restaurant, color: Colors.white70)));
}

class Header extends StatelessWidget {
  final bool profile;
  const Header({this.profile = false, super.key});
  Widget _b(String e, VoidCallback f, [bool dark = false]) => GestureDetector(
      onTap: f,
      child: Container(
          width: 32,
          height: 32,
          margin: EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: dark ? green : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: dark ? green : line)),
          child: Text(e, style: TextStyle(fontSize: 15))));
  @override
  Widget build(BuildContext c) => Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(children: [
        Container(width: 26, height: 26, alignment: Alignment.center, decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(7)), child: Text('🌿', style: TextStyle(fontSize: 13))),
        SizedBox(width: 10),
        Expanded(child: Text('Pasar Oro-Oro Dowo', style: serif(17))),
        _b('🔔', () {}),
        _b('🧺', () => go(c, 2)),
        _b('👤', () => go(c, 3), profile),
      ]));
}

class Nav extends StatelessWidget {
  final int i;
  const Nav(this.i, {super.key});
  @override
  Widget build(BuildContext c) => Container(
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: line))),
      child: SafeArea(
          top: false,
          child: Row(children: [
            for (var k = 0; k < 4; k++)
              Expanded(
                  child: InkWell(
                      onTap: () => go(c, k),
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                            Text(['🏠', '🗺️', '🧺', '👤'][k], style: TextStyle(fontSize: 18)),
                            SizedBox(height: 2),
                            Text(['Beranda', 'Warung', 'Keranjang', 'Akun'][k], style: sans(10, w: k == i ? FontWeight.w700 : FontWeight.w400, c: k == i ? green : muted)),
                          ])))),
          ])));
}

class ItemCard extends StatelessWidget {
  final Item i;
  final String? badge;
  final bool showStall;
  const ItemCard(this.i, {this.badge, this.showStall = false, super.key});
  @override
  Widget build(BuildContext c) => Container(
      decoration: cardBox(),
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          SizedBox(height: 100, width: double.infinity, child: Img(i.img)),
          if (badge != null) Positioned(left: 8, top: 8, child: pill(badge!)),
        ]),
        Padding(
            padding: EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(i.name, style: sans(13, w: FontWeight.w700)),
              if (showStall) Text(i.stall, style: sans(11, c: muted)),
              Text(i.sub, style: sans(11, c: muted)),
              SizedBox(height: 10),
              Row(children: [
                Expanded(child: Text(rp(i.price), style: sans(14, w: FontWeight.w700, c: green))),
                GestureDetector(
                    onTap: () {
                      add(i);
                      ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text('${i.name} ditambahkan'), duration: Duration(milliseconds: 900)));
                    },
                    child: Container(width: 32, height: 32, alignment: Alignment.center, decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(10)), child: Text('+', style: sans(18, w: FontWeight.w600, c: Colors.white)))),
              ]),
            ])),
      ]));
}

class StallTile extends StatelessWidget {
  final Stall s;
  final bool peta;
  const StallTile(this.s, {this.peta = false, super.key});
  @override
  Widget build(BuildContext c) => GestureDetector(
      onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => StallPage(s))),
      child: Container(
          decoration: cardBox(),
          clipBehavior: Clip.antiAlias,
          child: IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(width: peta ? 112 : 96, child: Img(s.img)),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(s.name, style: sans(14, w: FontWeight.w700)),
                      SizedBox(height: 4),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: '★ ${s.rating.toStringAsFixed(1)}  ', style: sans(12, w: FontWeight.w700, c: Color(0xFFC77A1E))),
                        TextSpan(text: peta ? 'Kuliner · No. ${s.no.toString().padLeft(2, '0')}' : 'Siap ${s.prep}', style: sans(12, c: muted)),
                      ])),
                      if (!peta) ...[SizedBox(height: 4), Text('${s.item} · ${rp(s.price)}', style: sans(12, c: Color(0xFF3A3A34)))],
                      SizedBox(height: 8),
                      pill(peta ? s.cat : s.tag),
                    ]))),
          ]))));
}

// ───────── App ─────────
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pasar Oro-Oro Dowo',
      theme: ThemeData(scaffoldBackgroundColor: bg, colorScheme: ColorScheme.fromSeed(seedColor: green)),
      builder: (c, w) => Container(color: bg, child: Center(child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 430), child: w))), // agar tetap berbentuk mobile saat dibuka di browser
      home: Shell(),
    ));

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext c) => ValueListenableBuilder<int>(
      valueListenable: tab,
      builder: (c, i, _) => Scaffold(
          backgroundColor: bg,
          body: SafeArea(bottom: false, child: [HomePage(), MapPage(), CartPage(), AkunPage()][i]),
          bottomNavigationBar: Nav(i)));
}

// ───────── Beranda ─────────
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext c) {
    final w = (MediaQuery.of(c).size.width.clamp(0, 430) - 44) / 2;
    return ListView(padding: EdgeInsets.zero, children: [
      Header(),
      pad(Column(children: [locPill(), SizedBox(height: 10), search('Cari nasi liwet, sate, kue lumpur...')])),
      SizedBox(height: 16),
      Container(
          color: green,
          padding: EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20)), child: Text('🍳 Dimasak Fresh · Pasar Buka 05.00–17.00', style: sans(11, w: FontWeight.w600, c: Color(0xFFF2C46D)))),
            SizedBox(height: 16),
            Text.rich(TextSpan(style: serif(32, c: Colors.white), children: [TextSpan(text: 'Satu Aplikasi, '), TextSpan(text: 'Ragam Kuliner Legendaris', style: serif(32, c: orange)), TextSpan(text: ' Pasar')])),
            SizedBox(height: 14),
            Text('Pesan langsung dari warung legendaris pasar — dimasak fresh begitu pesanan masuk, diantar hangat ke rumahmu.', style: sans(14, c: Colors.white70).copyWith(height: 1.5)),
            SizedBox(height: 16),
            btn('Pesan Kuliner Sekarang', orange, Color(0xFF1C1C1C), () => go(c, 1)),
            SizedBox(height: 10),
            btn('🗺️ Jelajahi Peta Warung Kuliner', green, Colors.white, () => go(c, 1), outline: true),
            SizedBox(height: 16),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    height: 180,
                    child: Stack(children: [
                      Row(children: [
                        Expanded(child: SizedBox.expand(child: Img('liwet'))),
                        Expanded(child: Column(children: [Expanded(child: SizedBox.expand(child: Img('nasi_buk'))), Expanded(child: SizedBox.expand(child: Img('sate')))])),
                      ]),
                      Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black54])))),
                      Positioned(top: 12, right: 12, child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: orange, borderRadius: BorderRadius.circular(20)), child: Text('40+ Warung Aktif', style: sans(11, w: FontWeight.w700)))),
                      Positioned(left: 14, bottom: 12, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Ragam Kuliner Pasar', style: sans(14, w: FontWeight.w700, c: Colors.white)), Text('Dari 40+ warung legendaris', style: sans(12, c: Colors.white70))])),
                    ]))),
          ])),
      pad(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Pilih kuliner favoritmu', style: serif(24)),
            SizedBox(height: 6),
            Text('Pilih kategori, kami arahkan ke warung dengan menu siap masak hari ini.', style: sans(13, c: muted).copyWith(height: 1.4)),
            SizedBox(height: 14),
            Wrap(spacing: 12, runSpacing: 12, children: [
              for (final k in cats)
                GestureDetector(
                    onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => CategoryPage(k))),
                    child: Container(width: w, padding: EdgeInsets.all(14), decoration: cardBox(), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [iconBox(k.emoji), SizedBox(height: 14), Text(k.title, style: sans(14, w: FontWeight.w700)), Text('${k.count} warung', style: sans(12, c: muted))]))),
            ]),
          ]),
          24),
      footer(),
    ]);
  }
}

// ───────── Peta Warung ─────────
class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapState();
}

class _MapState extends State<MapPage> {
  String f = 'Semua';
  @override
  Widget build(BuildContext c) {
    final list = f == 'Semua' ? petaStalls : petaStalls.where((s) => s.cat == f).toList();
    return ListView(padding: EdgeInsets.zero, children: [
      Header(),
      pad(search('Cari nama warung atau menu...')),
      pad(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Peta Warung Kuliner', style: serif(26)),
            SizedBox(height: 4),
            Text('40+ warung kuliner aktif hari ini.', style: sans(13, c: muted)),
            SizedBox(height: 14),
            Wrap(spacing: 8, runSpacing: 8, children: [for (final t in ['Semua', 'Makanan Berat', 'Sate & Bakar', 'Jajanan Manis']) chip(t, f == t, f: () => setState(() => f = t))]),
            SizedBox(height: 16),
            for (final s in list) Padding(padding: EdgeInsets.only(bottom: 12), child: StallTile(s, peta: true)),
          ]),
          16),
    ]);
  }
}

// ───────── Kategori kuliner ─────────
class CategoryPage extends StatelessWidget {
  final Cat cat;
  const CategoryPage(this.cat, {super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: Nav(1),
      body: SafeArea(
          bottom: false,
          child: ListView(padding: EdgeInsets.zero, children: [
            Header(),
            pad(locPill()),
            SizedBox(height: 10),
            Container(
                color: green,
                padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(onTap: () => Navigator.pop(c), child: Text('← Beranda / Kategori kuliner', style: sans(12, c: Colors.white70))),
                  SizedBox(height: 12),
                  Row(children: [
                    Expanded(child: Text(cat.title, style: serif(30, c: Colors.white))),
                    Container(width: 44, height: 44, alignment: Alignment.center, decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(12)), child: Text(cat.emoji, style: TextStyle(fontSize: 20))),
                  ]),
                  SizedBox(height: 6),
                  Text.rich(TextSpan(children: [TextSpan(text: '${cat.count} warung', style: sans(13, w: FontWeight.w700, c: Color(0xFFF2C46D))), TextSpan(text: ' · ${cat.sub}', style: sans(13, c: Colors.white70))])),
                ])),
            pad(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    for (final k in cats)
                      Expanded(child: Padding(padding: EdgeInsets.only(right: k == cats.last ? 0 : 8), child: chip(k.title, k == cat, fill: true, f: k == cat ? null : () => Navigator.pushReplacement(c, MaterialPageRoute(builder: (_) => CategoryPage(k)))))),
                  ]),
                  SizedBox(height: 12),
                  search(cat.hint),
                  SizedBox(height: 12),
                  Wrap(spacing: 8, runSpacing: 8, children: [for (var n = 0; n < cat.filters.length; n++) chip(cat.filters[n], n == 0, dark: false)]),
                  SizedBox(height: 20),
                  Text(cat.favTitle, style: serif(24)),
                  SizedBox(height: 4),
                  Text(cat.favSub, style: sans(13, c: muted)),
                  SizedBox(height: 12),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(child: ItemCard(cat.favs[0], badge: 'Terlaris', showStall: true)),
                    SizedBox(width: 12),
                    Expanded(child: ItemCard(cat.favs[1], badge: 'Favorit', showStall: true)),
                  ]),
                  SizedBox(height: 24),
                  Row(children: [Expanded(child: Text(cat.listTitle, style: serif(22))), Text('Terpopuler ▾', style: sans(12, w: FontWeight.w700, c: green))]),
                  SizedBox(height: 4),
                  Text('${cat.stalls.length} dari ${cat.count} warung · menu tersedia hari ini', style: sans(13, c: muted)),
                  SizedBox(height: 12),
                  for (final s in cat.stalls) Padding(padding: EdgeInsets.only(bottom: 12), child: StallTile(s)),
                  if (cat.count > cat.stalls.length)
                    GestureDetector(
                        onTap: () => go(c, 1),
                        child: Container(width: double.infinity, padding: EdgeInsets.symmetric(vertical: 14), decoration: cardBox(), child: Text('Lihat ${cat.count - cat.stalls.length} warung lainnya →', textAlign: TextAlign.center, style: sans(13, w: FontWeight.w700, c: green)))),
                  SizedBox(height: 16),
                  Container(width: double.infinity, padding: EdgeInsets.all(14), decoration: BoxDecoration(color: beige, borderRadius: BorderRadius.circular(12)), child: Text(cat.note, style: sans(12, c: Color(0xFF3A3A34)))),
                  SizedBox(height: 24),
                ]),
                16),
            footer(),
          ])));
}

// ───────── Detail warung / produk ─────────
class StallPage extends StatelessWidget {
  final Stall s;
  const StallPage(this.s, {super.key});
  @override
  Widget build(BuildContext c) {
    final w = (MediaQuery.of(c).size.width.clamp(0, 430) - 44) / 2;
    return Scaffold(
        backgroundColor: bg,
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: cart,
            builder: (_, __, ___) => Container(
                color: green,
                child: SafeArea(
                    top: false,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
                        child: Row(children: [
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Total keranjang', style: sans(12, c: Colors.white70)), Text(rp(cartTotal()), style: sans(16, w: FontWeight.w700, c: Colors.white))])),
                          ElevatedButton(
                              onPressed: () => go(c, 2),
                              style: ElevatedButton.styleFrom(backgroundColor: orange, foregroundColor: Color(0xFF1C1C1C), elevation: 0, padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                              child: Text('Keranjang (${cartCount()})', style: sans(14, w: FontWeight.w700))),
                        ]))))),
        body: SafeArea(
            bottom: false,
            child: ListView(padding: EdgeInsets.zero, children: [
              Header(),
              pad(GestureDetector(onTap: () => Navigator.pop(c), child: Text('← Peta Warung', style: sans(13, w: FontWeight.w700, c: green))), 4),
              pad(
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(children: [
                        SizedBox(height: 120, width: double.infinity, child: Img(s.img)),
                        Positioned.fill(
                            child: Container(
                                color: Color(0xB317352A),
                                padding: EdgeInsets.all(16),
                                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(s.name, style: serif(24, c: Colors.white)),
                                  SizedBox(height: 4),
                                  Text('★ ${s.rating.toStringAsFixed(1)} (410 pesanan)', style: sans(12, c: Colors.white)),
                                  Text('Kuliner${s.no > 0 ? ' · No. ${s.no.toString().padLeft(2, '0')}' : ''}', style: sans(12, c: Colors.white)),
                                  Text('Dimasak fresh · siap ${s.prep.replaceAll(' menit', '')} menit', style: sans(12, c: Colors.white)),
                                ]))),
                      ])),
                  12),
              pad(
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Menu tersedia', style: serif(24)),
                    SizedBox(height: 4),
                    Text(s.name.contains('Liwet') ? 'Dibungkus daun pisang, dibakar begitu pesanan masuk.' : 'Dimasak fresh begitu pesanan masuk.', style: sans(13, c: muted)),
                    SizedBox(height: 14),
                    Wrap(spacing: 12, runSpacing: 12, children: [for (final i in s.menu) SizedBox(width: w, child: ItemCard(i))]),
                    SizedBox(height: 24),
                  ]),
                  8),
            ])));
  }
}

// ───────── Keranjang ─────────
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext c) => ValueListenableBuilder<Map<Item, int>>(
      valueListenable: cart,
      builder: (c, m, _) {
        final groups = <String, List<MapEntry<Item, int>>>{};
        for (final e in m.entries) {
          groups.putIfAbsent(e.key.stall, () => []).add(e);
        }
        final sub = cartTotal();
        return ListView(padding: EdgeInsets.zero, children: [
          Header(),
          pad(GestureDetector(onTap: () => go(c, 1), child: Text('← Lanjut pesan', style: sans(13, w: FontWeight.w700, c: green))), 4),
          pad(
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Keranjang Pesanan', style: serif(24)),
                SizedBox(height: 4),
                Text('Menu dikelompokkan per warung, diantar dalam satu jadwal.', style: sans(13, c: muted)),
                SizedBox(height: 14),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: beige, borderRadius: BorderRadius.circular(12)),
                    child: Text.rich(TextSpan(style: sans(12, c: Color(0xFF3A3A34)), children: [TextSpan(text: '🍳 Dimasak fresh begitu diterima warung — estimasi tiba '), TextSpan(text: '25–35 menit', style: sans(12, w: FontWeight.w700)), TextSpan(text: '.')]))),
                SizedBox(height: 16),
                if (m.isEmpty) Padding(padding: EdgeInsets.symmetric(vertical: 24), child: Center(child: Text('Keranjang masih kosong. Pilih menu dari warung dulu.', style: sans(13, c: muted)))),
                for (final g in groups.entries)
                  Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                          decoration: cardBox(),
                          clipBehavior: Clip.antiAlias,
                          child: Column(children: [
                            Container(color: beige, padding: EdgeInsets.all(12), child: Row(children: [Expanded(child: Text(g.key, style: sans(13, w: FontWeight.w700))), Text(rp(g.value.fold(0, (s, e) => s + e.key.price * e.value)), style: sans(13, w: FontWeight.w700))])),
                            for (final e in g.value)
                              Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(border: Border(top: BorderSide(color: line))),
                                  child: Row(children: [
                                    ClipRRect(borderRadius: BorderRadius.circular(8), child: SizedBox(width: 44, height: 44, child: Img(e.key.img))),
                                    SizedBox(width: 12),
                                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(e.key.name, style: sans(13, w: FontWeight.w700)), Text(e.key.sub, style: sans(11, c: muted))])),
                                    Text('x${e.value}', style: sans(12, c: muted)),
                                    SizedBox(width: 12),
                                    Text(rp(e.key.price * e.value), style: sans(13, w: FontWeight.w700)),
                                  ])),
                          ]))),
                Container(
                    padding: EdgeInsets.all(16),
                    decoration: cardBox(),
                    child: Column(children: [
                      sumRow('Subtotal menu', rp(sub)),
                      sumRow('Ongkos kirim', rp(m.isEmpty ? 0 : 8000)),
                      Divider(color: line, height: 20),
                      sumRow('Total bayar', rp(m.isEmpty ? 0 : sub + 8000), bold: true),
                      SizedBox(height: 12),
                      btn('Konfirmasi Pesanan', orange, Color(0xFF1C1C1C), m.isEmpty ? null : () => Navigator.push(c, MaterialPageRoute(builder: (_) => SuccessPage(sub + 8000)))),
                    ])),
                SizedBox(height: 24),
              ]),
              4),
        ]);
      });
}

// ───────── Validasi transaksi ─────────
class SuccessPage extends StatelessWidget {
  final int total;
  const SuccessPage(this.total, {super.key});
  Widget _r(String a, String b) => Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(a, style: sans(13, c: muted)), Text(b, style: sans(13, w: FontWeight.w700))]));
  @override
  Widget build(BuildContext c) {
    final n = DateTime.now();
    final no = '#OOD-${n.year}${n.month.toString().padLeft(2, '0')}${n.day.toString().padLeft(2, '0')}-041';
    return Scaffold(
        backgroundColor: bg,
        body: SafeArea(
            bottom: false,
            child: Column(children: [
              Header(),
              Expanded(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        SizedBox(height: 32),
                        Container(width: 60, height: 60, decoration: BoxDecoration(color: green, shape: BoxShape.circle), child: Icon(Icons.check, color: Colors.white, size: 30)),
                        SizedBox(height: 16),
                        Text('Pesanan dikonfirmasi', style: serif(24)),
                        SizedBox(height: 8),
                        Text('Warung mulai memasak pesananmu. Kami kabari begitu makanan siap diantar hangat.', textAlign: TextAlign.center, style: sans(13, c: muted).copyWith(height: 1.4)),
                        SizedBox(height: 24),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: cardBox(),
                            child: Column(children: [_r('Nomor pesanan', no), Divider(color: line, height: 1), _r('Estimasi tiba', '25–35 menit'), Divider(color: line, height: 1), _r('Alamat', 'Jl. Veteran, Malang'), Divider(color: line, height: 1), _r('Total bayar', rp(total))])),
                        SizedBox(height: 20),
                        btn('Kembali ke Beranda', green, Colors.white, () {
                          cart.value = {};
                          go(c, 0);
                        }),
                      ]))),
              footer(),
            ])));
  }
}

// ───────── Akun ─────────
class AkunPage extends StatelessWidget {
  Widget _sec(Widget child) => Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 16), child: Container(width: double.infinity, padding: EdgeInsets.all(16), decoration: cardBox(), child: child));
  Widget _stat(String a, String b) => Expanded(child: Container(margin: EdgeInsets.only(right: 8), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: beige, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(a, style: sans(12, c: muted)), SizedBox(height: 4), Text(b, style: sans(16, w: FontWeight.w700))])));
  Widget _row(String a, String b, Widget trail) => Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(a, style: sans(14, w: FontWeight.w700)), Text(b, style: sans(12, c: muted))])), trail]));
  Widget _fav(String img, String n, String k) => Expanded(child: Padding(padding: EdgeInsets.only(right: 6), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ClipRRect(borderRadius: BorderRadius.circular(12), child: SizedBox(height: 72, width: double.infinity, child: Img(img))), SizedBox(height: 8), Text(n, style: sans(13, w: FontWeight.w700)), Text(k, style: sans(11, c: muted))])));
  @override
  Widget build(BuildContext c) => ListView(padding: EdgeInsets.zero, children: [
        Header(profile: true),
        SizedBox(height: 8),
        _sec(Column(children: [
          Row(children: [
            Container(width: 64, height: 64, alignment: Alignment.center, decoration: BoxDecoration(color: green, shape: BoxShape.circle), child: Text('LM', style: serif(22, c: Colors.white))),
            SizedBox(width: 16),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Lionel Messi', style: serif(20)), Text('+62 812 3456 7890', style: sans(13, c: muted))])),
            Container(padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(10)), child: Text('Edit Profil', style: sans(12, w: FontWeight.w700, c: Colors.white))),
          ]),
          SizedBox(height: 16),
          Row(children: [_stat('Pesanan aktif', '2'), _stat('Riwayat', '18'), _stat('Favorit', '6')]),
        ])),
        _sec(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Pesanan Saya', style: serif(20)), SizedBox(height: 8), _row('Pesanan aktif', '2 pesanan sedang diproses', pillBtn('Lihat semua')), _row('Riwayat pesanan', 'Lihat semua transaksi', pillBtn('Lihat'))])),
        _sec(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Alamat Tersimpan', style: serif(20)),
          SizedBox(height: 12),
          Row(children: [iconBox('📍'), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Alamat utama', style: sans(14, w: FontWeight.w700)), Text('Jl. Veteran No. 12, Malang', style: sans(12, c: muted))])), pillBtn('Ubah')]),
        ])),
        _sec(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Warung Favorit', style: serif(20)), SizedBox(height: 12), Row(children: [_fav('nasi_buk', 'Nasi Buk Hj. Supina', 'Makanan Berat'), _fav('liwet', 'Sego Liwet Bakar', 'Makanan Berat')])])),
        _sec(Row(children: [iconBox('🤝'), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Bantuan', style: sans(14, w: FontWeight.w700)), Text('FAQ, bantuan pesanan, dan kontak dukungan', style: sans(12, c: muted))])), Text('▸', style: sans(10))])),
      ]);
}
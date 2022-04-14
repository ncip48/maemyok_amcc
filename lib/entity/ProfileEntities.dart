class Profile {
  final String namareseller;
  final String alamatreseller;
  final String email;
  final int poin;
  final int saldo;
  final String telp;
  final String aktif;
  final String tgllahir;

  const Profile(
      {required this.namareseller,
      required this.alamatreseller,
      required this.email,
      required this.poin,
      required this.saldo,
      required this.telp,
      required this.aktif,
      required this.tgllahir});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      namareseller: json['msg']['namareseller'],
      alamatreseller: json['msg']['alamatreseller'],
      email: json['msg']['email'],
      poin: json['msg']['poin'],
      saldo: json['msg']['saldo'],
      telp: json['msg']['telp'],
      aktif: json['msg']['Aktif'],
      tgllahir: json['msg']['tgllahir'],
    );
  }
}

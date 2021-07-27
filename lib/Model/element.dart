class ElementDataModel {
  String? name;
  String? appearance;
  double? atomic_mass;
  double? boil;
  String? category;
  String? color;
  double? density;
  String? discovered_by;
  double? melt;
  double? molar_heat;
  String? named_by;
  int? number;
  int? period;
  String? phase;
  String? source;
  String? spectral_img;
  String? summary;
  String? symbol;
  int? xpos;
  int? ypos;
  // Int[]? shells;
  String? electron_configuration;
  String? electron_configuration_semantic;
  double? electron_affinity;
  double? electronegativity_pauling;
  // String? ionization_energies;
  String? cpk_hex;

  ElementDataModel(
      this.name,
      this.appearance,
      this.atomic_mass,
      this.boil,
      this.category,
      this.color,
      this.density,
      this.discovered_by,
      this.melt,
      this.molar_heat,
      this.named_by,
      this.number,
      this.period,
      this.phase,
      this.source,
      this.spectral_img,
      this.summary,
      this.symbol,
      this.xpos,
      this.ypos,
      // Int[]? shells;
      this.electron_configuration,
      this.electron_configuration_semantic,
      this.electron_affinity,
      this.electronegativity_pauling,
      // String? ionization_energies;
      this.cpk_hex);

  ElementDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    appearance = json['appearance'];
    atomic_mass = json['atomic_mass'];
    boil = json['boil'];
    category = json['category'];
    color = json['color'];
    density = json['density'];
    discovered_by = json['discovered_by'];
    melt = json['melt'];
    molar_heat = json['molar_heat'];
    named_by = json['named_by'];
    number = json['number'];
    period = json['period'];
    phase = json['phase'];
    source = json['source'];
    spectral_img = json['spectral_img'];
    summary = json['summary'];
    symbol = json['symbol'];
    xpos = json['xpos'];
    ypos = json['ypos'];
    //shells = json['shells'];
    electron_configuration = json['electron_configuration'];
    electron_configuration_semantic = json['electron_configuration_semantic'];
    electron_affinity = json['electron_affinity'];
    electronegativity_pauling = json['electronegativity_pauling'];
    //ionization_energies = json['ionization_energies'];
    cpk_hex = json['cpk-hex'];
  }
}

enum Team {
  developer("http://10.0.0.213:5500/api/developer.json"),
  manager("http://10.0.0.213:5500/api/management.json");

  const Team(this.urlString);
  final String urlString;
}
